//
//  AddCityView.swift
//  Weather
//
//  Created by alumno on 22/11/24.
//

import SwiftUI
import CoreLocation

struct AddCityView: View {
    @Environment(\.dismiss) var dismiss
    @Environment(\.modelContext) private var modelContext
    @State private var name: String = ""
    @State private var results: [CLPlacemark] = []
    @State private var msgError: String? = nil
    
    private let geocoder = CLGeocoder()
    
    var body: some View {
        NavigationStack {
            Form {
                Section(header: Text("City Details")) {
                    TextField("City Name", text: $name)
                        .padding()
                        .onChange(of: name) {
                            searchCityCoordinates()
                        }
                }
            }
            
            if !results.isEmpty {
                Section(header: Text("Select City")) {
                    List(results.indices, id: \.self) { index in
                        let place = results[index]
                        
                        Button(action : {
                            saveCity(placemark: place)
                        }) {
                            if let locality = place.locality {
                                Text(locality)
                                    .font(.headline)
                            }
                            if let subLocality = place.subLocality {
                                Text(subLocality)
                                    .font(.subheadline)
                            }
                            if let adminArea = place.administrativeArea {
                                Text(adminArea)
                                    .font(.subheadline)
                            }
                            if let country = place.country {
                                Text(country)
                                    .font(.subheadline)
                            }
                        }
                    }
                }
            }
        }
    }
    
    private func searchCityCoordinates() {
        self.results = []
        
        //method to search lat, long of city
        geocoder.geocodeAddressString(name) { (places, error) in
            if let error = error {
                print(error.localizedDescription)
                self.msgError = "Search Error"
                return
            }
            
            guard let places = places, !places.isEmpty else {
                self.msgError = "No Search Results"
                return
            }
            
            print(places)
            self.results = places
        }
    }
    
    private func saveCity(placemark: CLPlacemark) {
        guard let location = placemark.location else {
            print("City info could not be saved")
            return
        }
        let cityName = placemark.locality ?? name
        let latitude = location.coordinate.latitude
        let longitude = location.coordinate.longitude
        
        let newCity = City(name: cityName, latitude: latitude, longitude: longitude)
        
        modelContext.insert(newCity)
        
        do {
            try modelContext.save()
            dismiss()
        } catch {
            print("Error saving new city")
        }
    }
}

#Preview {
    AddCityView()
}
