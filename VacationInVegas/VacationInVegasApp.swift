//
//  VacationInVegasApp.swift
//  VacationInVegas
//
//  Created by JocleynYang on 10/6/24.
//

import SwiftUI

@main
struct VacationInVegasApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        // Type.self
        .modelContainer(for: Place.self)
    }
}
