//
//  HighScoreView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import SwiftUI

struct HighScoreView: View {
    @EnvironmentObject private var highScoreVM: HighScoreViewModel
    
    var body: some View {
        ZStack{
            HighScoreBackgroundView()
            
            VStack {
                HighScoreTitleView()
                
                List{
                    ForEach(Array(highScoreVM.highScores.enumerated()),id: \.offset) {
                        index, entity in
                        
                        RankScoreView(
                            rank: index+1,
                            score: Int(entity.score),
                            entity: entity
                        )
                    }
                    .onDelete(perform: highScoreVM.deleteHighScore(indexSet:))
                    .listRowBackground(Color.black)
                }
                .listStyle(.plain)
                
                Image(Creatures.creature0.rawValue)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 100, height: 100)
            }
        }
    }
}


#Preview {
    HighScoreView()
        .environmentObject(HighScoreViewModel())
}
