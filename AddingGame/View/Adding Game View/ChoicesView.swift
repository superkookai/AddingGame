//
//  ChoicesView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import SwiftUI

struct ChoicesView: View {
    let gameVM: AddingGameViewModel
    
    let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns) {
            ForEach(gameVM.possibleSolutions, id: \.self) { choice in
                let cheatColor: Color = choice == gameVM.answer ? .red : .black
                let absChoice = abs(choice)
                BubbleView(
                    textColor: cheatColor,
                    bgColor: .purple.opacity(0.7),
                    name: "bubble2",
                    text: "\(absChoice)"
                )
                .onTapGesture {
                    withAnimation{
                        if gameVM.answer == choice {
                            gameVM.increaseScore()
                        }else{
                            gameVM.loseLife()
                        }
                        gameVM.generateNumbers()
                    }
                }
            }
        }
    }
}

#Preview {
    ChoicesView(gameVM: AddingGameViewModel())
}
