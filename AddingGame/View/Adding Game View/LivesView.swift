//
//  LivesView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import SwiftUI

struct LivesView: View {
    let imageName: Creatures
    let numLives: Int
    let maxLives: Int
    let dim = 30.0
    
    var body: some View {
        HStack {
            ForEach(0..<maxLives, id: \.self) { i in
                let opacity: CGFloat = i >= numLives ? 0 : 1
                Image(imageName.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: dim, height: dim)
                    .opacity(opacity)
            }
        }
    }
}

#Preview {
    ZStack {
        GameBackgroundView()
        
        LivesView(imageName: .creature1, numLives: 2, maxLives: 3)
    }
}
