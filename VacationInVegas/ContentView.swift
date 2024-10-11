//
//  ContentView.swift
//  VacationInVegas
//
//  Created by JocleynYang on 10/6/24.
//

import SwiftUI
import SwiftData

struct ContentView: View {
    var body: some View {
        TabView{
            Tab("Places",systemImage: "photo"){
                PlaceList()
            }
            Tab("Trip History",systemImage: "chart.line.uptrend.xyaxis"){
                TripChart()
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
        .modelContainer(Place.preview)
}
