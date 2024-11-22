//
//  CityView.swift
//  Weather
//
//  Created by alumno on 22/11/24.
//

import SwiftUI

struct CityView: View {
    @Bindable var city: City
    
    var body: some View {
        Text("Weather in \(city.name)")
            .font(.largeTitle)
            .padding()
        
        Spacer()
        
        WeatherChart()
        
        Spacer()
    }
}

#Preview {
    CityView(city: City(name: "Madrid", latitude: 40.416775, longitude: -3.703790))
}
