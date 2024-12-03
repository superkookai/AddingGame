//
//  AddingGameView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import SwiftUI
import SwiftData

struct AddingGameView: View {
    @StateObject var gameVM = AddingGameViewModel()
//    @EnvironmentObject private var highScoreVM: HighScoreViewModel
    
    @State private var highScoreViewIsPresented  = false
    @State private var name = ""
    
    @Query(sort:\HighScoreEntity.score, order: .reverse) private var highScores: [HighScoreEntity]
    
    var minHighScore: Int?{
        if highScores.isEmpty{
            return nil
        }else{
            return highScores.last?.score
        }
    }
    
    let maxNumOfHighScores = 100
    
    var showHighScoreView: Bool {
        gameVM.gameOver && isNewHighScore(score: Int64(gameVM.score))
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
    
    func isNewHighScore(score: Int64) -> Bool{
        if score <= 0{
            return false
        } else if let minHighScore{
            return minHighScore < score || highScores.count <= maxNumOfHighScores //this mean this score need to add to the list of highScores because we set the list must be 100 maximum (now it less than 10)
        } else{
            //score > 0 and not have minHighScore (= nil, which means list of highScores isEmpty, so add this score to the list)
            return true
        }
    }
}

#Preview {
    AddingGameView()
        .modelContainer(for: HighScoreEntity.self)
}
