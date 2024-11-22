//
//  WeatherChart.swift
//  Weather
//
//  Created by alumno on 22/11/24.
//

import SwiftUI
import Charts

struct WeatherInfo {
    var time: Int
    var temp: Double
}

struct WeatherChart: View {
    let weatherData: [WeatherInfo] = [
        WeatherInfo(time: 0, temp: 5),
        WeatherInfo(time: 12, temp: 10),
        WeatherInfo(time: 24, temp: 8)
    ]
    
    var body: some View {
        Chart {
            ForEach(weatherData) { data in
                BarMark (
                    x: .value("Time", data.time),
                    y: .value("Temperature", data.temp)
                )
            }
        }
    }
}

#Preview {
    WeatherChart()
}
