//
//  WeatherApp.swift
//  Weather
//
//  Created by alumno on 22/11/24.
//

import SwiftUI
import SwiftData

@main
struct WeatherApp: App {
    var sharedModelContainer: ModelContainer = {
        let schema = Schema([
            City.self, Forecast.self
        ])
        let modelConfiguration = ModelConfiguration(schema: schema, isStoredInMemoryOnly: false)

        do {
            return try ModelContainer(for: schema, configurations: [modelConfiguration])
        } catch {
            fatalError("Could not create ModelContainer: \(error)")
        }
    }()

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(sharedModelContainer)
    }
}
