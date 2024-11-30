//
//  HighScoreViewModel.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 30/11/2567 BE.
//

import Foundation
import CoreData

class HighScoreViewModel: ObservableObject {
    let container: NSPersistentContainer
    
    @Published var highScores: [HighScoreEntity] = []
    
    init(){
        container = NSPersistentContainer(name: "HighScoresDataModel")
        
        //Load data
        container
            .loadPersistentStores { description, error in
                if let error {
                    print("Loading error: \(error.localizedDescription)")
                }else{
                    print("Loading succeeded")
                }
            }
        
        //Fetch data into highScores
        fetchHighScores()
    }
    
    func fetchHighScores(){
        let request = NSFetchRequest<HighScoreEntity>(entityName: "HighScoreEntity")
        let sortDescriptor = NSSortDescriptor(keyPath: \HighScoreEntity.score, ascending: false) //decending order
        request.sortDescriptors = [sortDescriptor]
        
        do{
            highScores = try container.viewContext.fetch(request)
        }catch{
            print("Error fetching high scores: \(error.localizedDescription)")
        }
    }
    
    func saveHighScores(){
        do{
            try container.viewContext.save()
            fetchHighScores() //to change highScores follow what we save in CoreData
        }catch{
            print("Error saving high scores: \(error.localizedDescription)")
        }
    }
    
    func addHighScore(name: String, score: Int64){
        let entity = HighScoreEntity(context: container.viewContext)
        entity.name = name
        entity.score = score
        
        saveHighScores()
    }
    
    func updateHighScore(entity: HighScoreEntity, name: String){
        entity.name = name
        
        saveHighScores()
    }
    
    func deleteHighScore(entity: HighScoreEntity){
        container.viewContext.delete(entity)
        
        saveHighScores()
    }
}
