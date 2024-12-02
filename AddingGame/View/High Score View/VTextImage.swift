//
//  VTextImage.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 2/12/2567 BE.
//

import SwiftUI

struct VTextImage: View {
    let imageName: String
    let text: LocalizedStringKey
    let dim: Double
    
    var body: some View {
        VStack(spacing: 0){
            Image(imageName)
                .resizable()
                .scaledToFit()
                .frame(width: dim, height: dim)
            
            Text(text)
                .fixedSize(horizontal: true, vertical: false)
                .font(.headline)
                .foregroundStyle(.white)
                .fontWeight(.bold)
            
        }
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    ZStack {
        HighScoreBackgroundView()
        VTextImage(imageName: Creatures.creature0.rawValue, text: "Rank", dim: 50)
    }
}
