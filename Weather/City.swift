//
//  Item.swift
//  Weather
//
//  Created by alumno on 22/11/24.
//

import Foundation
import SwiftData

@Model class City {
    var name: String
    var latitude: Double
    var longitude: Double
    var forecasts: [Forecast] = []
    
    init(name: String, latitude: Double, longitude: Double) {
        self.name = name
        self.latitude = latitude
        self.longitude = longitude
    }
}

@Model class Forecast {
    var date: Date
    var temp: Double
    var rainProbability: Double
    
    init(date: Date, temp: Double, rainProbability: Double) {
        self.date = date
        self.temp = temp
        self.rainProbability = rainProbability
    }
}
