//
//  ScrollInImage.swift
//  VacationInVegas
//
//  Created by JocleynYang on 10/6/24.
//



import SwiftUI

struct ScrollInImage: View {
    let image: ImageResource
    
    
    var body: some View {
        Image(image)
            .resizable()
            .scaledToFit()
            .clipShape(.rect(cornerRadius: 20))
            .scrollTransition(transition: {content,phase in content
                    .scaleEffect(phase.isIdentity ? 1:0.5)
                    .opacity(phase.isIdentity ? 1:0.5)
                
            })
    }
}

#Preview {
    ScrollInImage(image: .bellagio )
}
