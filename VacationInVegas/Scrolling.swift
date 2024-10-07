//
//  Scrolling.swift
//  VacationInVegas
//
//  Created by JocleynYang on 10/6/24.
//




import SwiftUI

struct Scrolling: View {
//    let image: ImageResource
    
    
    var body: some View {
        ScrollView{
            VStack{
                ScrollInImage(image: .bellagio)
                ScrollInImage(image: .excalibur)
                ScrollInImage(image: .luxor)
                ScrollInImage(image: .paris)
                ScrollInImage(image: .stratosphere)
                ScrollInImage(image: .treasureisland)

                
            }
            .padding()
        
        
            }
    }
}

#Preview {
    Scrolling()
}
