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
                SelectButtonView(gameVM: gameVM, choice: choice)
            }
        }
    }
}

struct SelectButtonView: View {
    let gameVM: AddingGameViewModel
    let choice: Int
    
    @State private var isSelected: Bool = false
    var scale: CGFloat{
        isSelected ? 1.2 : 1.0
    }
        
    var color: Color{
        isSelected ? getRandomColor()
        : .purple.opacity(0.7)
    }
    
    var body: some View {
        BubbleView(
            textColor: .black,
            bgColor: color,
            name: "bubble2",
            text: "\(choice)"
        )
        .scaleEffect(scale)
        .onTapGesture {
            withAnimation(.spring(response: 0.3, dampingFraction: 0.3).repeatCount(1, autoreverses: true))
            {
                isSelected.toggle()
            }
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                withAnimation {
                    isSelected = false
                }
            }
            
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
    
    private func getRandomColor() -> Color {
        return [.green.opacity(0.7),.blue.opacity(0.5),.pink.opacity(0.7)]
            .randomElement() ?? .green.opacity(0.7)
    }
}

#Preview {
    ChoicesView(gameVM: AddingGameViewModel())
}
