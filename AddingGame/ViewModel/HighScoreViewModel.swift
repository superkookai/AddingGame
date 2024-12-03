//
//  HighScoreViewModel.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 30/11/2567 BE.
//

import Foundation
import SwiftData

@MainActor
@Observable
class HighScoreViewModel {
    
    let container: ModelContainer
    
    var highScores: [HighScoreEntity] = []
    
    var minHighScore: Int?{
        if highScores.isEmpty{
            return nil
        }else{
            return highScores.last?.score
        }
    }
    
    let maxNumOfHighScores = 100
    
//    init(container: ModelContainer){
//        self.container = container
//
//        //Fetch data into highScores
//        
//        fetchHighScores()
//    }
    
    init(){
        container = try! ModelContainer(for: HighScoreEntity.self)
        fetchHighScores()
    }
    
    
    func fetchHighScores(){
        let fetchHighScores = FetchDescriptor<HighScoreEntity>(sortBy: [SortDescriptor(\HighScoreEntity.score, order: .reverse)])
        do{
            highScores = try container.mainContext.fetch(fetchHighScores)
        }catch{
            print("Error fetching high scores: \(error.localizedDescription)")
        }
    }
    
    func saveHighScores(){
        do{
            try container.mainContext.save()
            fetchHighScores() //to change highScores follow what we save in CoreData
        }catch{
            print("Error saving high scores: \(error.localizedDescription)")
        }
    }
    
    func addHighScore(name: String, score: Int){
        let entity = HighScoreEntity(name: name, score: score)
        container.mainContext.insert(entity)
        
        saveHighScores()
    }
    
    func updateHighScore(entity: HighScoreEntity, name: String){
        guard let index = highScores.firstIndex(where: {$0 == entity}) else { return }
        let entity = highScores[index]
        entity.name = name
        
        saveHighScores()
    }
    
    func deleteHighScore(entity: HighScoreEntity){
        container.mainContext.delete(entity)
        
        saveHighScores()
    }
    
    func deleteHighScore(indexSet: IndexSet){
        guard let index = indexSet.first else{ return }
        let entity = highScores[index]
        deleteHighScore(entity: entity)
    }
    
    func isNewHighScore(score: Int) -> Bool{
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
