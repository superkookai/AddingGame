//
//  HighScoreView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import SwiftUI
import SwiftData

struct HighScoreView: View {
//    @EnvironmentObject private var highScoreVM: HighScoreViewModel
    @Query(sort:\HighScoreEntity.score, order: .reverse) private var highScores: [HighScoreEntity] = []
//    @Query(sort:[SortDescriptor(\.HighScoreEntity.self, order: .reverse)]) private var highScores: [HighScoreEntity] = []
    
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        ZStack{
            HighScoreBackgroundView()
            
            VStack {
                HighScoreTitleView()
                
                List{
                    ForEach(Array(highScores.enumerated()),id: \.offset) {
                        index, entity in
                        
                        RankScoreView(
                            rank: index+1,
                            score: Int(entity.score),
                            entity: entity
                        )
                    }
                    .onDelete(perform: deleteHighScore(indexSet:))
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
    
    func deleteHighScore(indexSet: IndexSet) {
        guard let index = indexSet.first else{ return }
        let entity = highScores[index]
        modelContext.delete(entity)
        
//        for index in indexSet {
//            modelContext.delete(highScores[index])
//        }
    }
}


#Preview {
    HighScoreView()
        .modelContainer(for: HighScoreEntity.self)
}
