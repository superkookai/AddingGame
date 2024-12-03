//
//  AddingGameView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import SwiftUI

struct AddingGameView: View {
    @State var gameVM = AddingGameViewModel()
    @Environment(HighScoreViewModel.self) private var highScoreVM: HighScoreViewModel
    
    @State private var highScoreViewIsPresented  = false
    @State private var name = ""
    
    var showHighScoreView: Bool {
        gameVM.gameOver && highScoreVM.isNewHighScore(score: gameVM.score)
    }
    
    var showGameOverView: Bool {
        gameVM.gameOver
    }
    
    var body: some View {
        ZStack{
            GameBackgroundView()
            
            VStack {
                ScoreLivesView(
                    score: gameVM.score,
                    lives: gameVM.gameModel.lives,
                    maxLives: 3,
                    level: gameVM.gameModel.level
                )
                
                Spacer()
                
                BubbleView(
                    textColor: .white,
                    bgColor: .purple.opacity(0.7),
                    name: "bubble3",
                    text: "\(gameVM.number1) + \(gameVM.number2)"
                )
                
                Spacer()
                
                ChoicesView(gameVM: gameVM)
            }
            .padding()
            .blur(radius: showGameOverView ? 5: 0)
            .disabled(showGameOverView)
            
            GameOverView()
                .padding()
                .blur(radius: showGameOverView ? 0 : 30)
                .opacity(showGameOverView ? 1 : 0)
                .disabled(!showGameOverView)
                .onTapGesture {
                    gameVM.reset()
                }
        }
        .fullScreenCover(isPresented: $highScoreViewIsPresented) {
            //onDismiss
            gameVM.reset()
        } content: {
            //Show
            EnterNewHighScoreView(score: gameVM.score, name: $name, isPresented: $highScoreViewIsPresented)
        }
        .onChange(of: showHighScoreView) { oldValue, newValue in
            highScoreViewIsPresented = newValue
        }

    }
}

#Preview {
    AddingGameView()
        .environment(HighScoreViewModel())
}
