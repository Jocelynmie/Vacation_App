//
//  ContentView.swift
//  VacationInVegas
//
//  Created by JocleynYang on 10/6/24.
//

import SwiftUI
import SwiftData

struct PlaceList: View {
    @Query(sort:\Place.name) private var places:[Place]
    @State private var showImages = false
    @State private var fillterByInterested = false
    @State private var searchText = ""
    private var predicate :Predicate<Place>{
        #Predicate<Place>{
            if !searchText.isEmpty && fillterByInterested{
                $0.name.localizedStandardContains(searchText) && $0.interested
            }else if !searchText.isEmpty {
                $0.name.localizedStandardContains(searchText)
            }
            else if fillterByInterested{
                $0.interested
            }
            else{
                true
            }
        }
    }
    var body: some View {
        NavigationStack{
            
            List((try?places.filter(predicate)) ?? places){place in
                HStack{
                    place.image
                        .resizable()
                        .scaledToFit()
                        .clipShape(.rect(cornerRadius: 7))
                        .frame(width:100,height: 100)
                    Text(place.name)
                    Spacer()
                    if place.interested{
                        Image(systemName: "star.fill")
                            .foregroundStyle(.yellow)
                            .padding(.trailing)
                    }
                }
            }
            .searchable(text: $searchText,prompt: "Find a place")
            .animation(.default, value:searchText)
            .navigationTitle("Places")
            .toolbar{
                ToolbarItem(placement: .topBarTrailing){
                    Button("Show Images",systemImage: "photo"){
                        showImages.toggle()
                    }
                }
                ToolbarItem(placement: .topBarTrailing){
                    Button("Filter",systemImage:fillterByInterested ? "star.fill": "star"){
                        withAnimation{
                            fillterByInterested.toggle()
                        }
                        
                    }.tint(fillterByInterested ?.yellow:.blue)
                }
                 
            }
            .sheet(isPresented: $showImages){
                Scrolling()
            }
         
            
        }
    }
}

#Preview {
    PlaceList()
        .modelContainer(Place.preview)
}

