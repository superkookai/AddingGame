//
//  GameOverView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import SwiftUI

struct GameOverView: View {
    var body: some View {
        HStack {
            Label {
                Text("Game Over")
                    .multilineTextAlignment(.center)
                Image(systemName: "arrowshape.turn.up.left.circle.fill")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 50, height: 50)
                    .foregroundStyle(.yellow)
            } icon: {
                Image(Creatures.creature5.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 25, height: 25)
                    .padding()
                    .background(.green)
                    .clipShape(.circle)
            }
            .font(.title)
            .fontWeight(.bold)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(.rect(cornerRadius: 10))
            .shadow(radius: 3)
        }
    }
}

#Preview {
    GameOverView()
}
