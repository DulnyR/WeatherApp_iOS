//
//  ContentView.swift
//  Weather
//
//  Created by alumno on 22/11/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    @Environment(\.modelContext) private var modelContext
    @Query(sort: \City.name) private var cities: [City]
    @State private var showAddCity = false
    @State private var cityView = false
 
    var body: some View {
        NavigationStack {
            List(cities, id: \.self) { city in
                NavigationLink(destination: CityView(city: city)){
                    Text(city.name)
                }
            }
            .navigationTitle("Weather")
            .toolbar {
                Button( action: {
                    showAddCity = true
                }) {
                    Label("Add City", systemImage: "plus")
                }
            }
            .sheet(isPresented: $showAddCity) {
                AddCityView()
            }
        }
        
        
    }
}

#Preview {
    ContentView()
        .modelContainer(for: [City.self, Forecast.self], inMemory: true)
}
