//
//  AddingGameViewModel.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import Foundation

class AddingGameViewModel: ObservableObject {
    @Published var gameModel: GameModel = GameModel.defaultGame
    
    private var problemCount = 0
    let nextLevelBound = 5
    let maxIncreaseScore = 10
    
    var score: Int{
        gameModel.score
    }
    
    //problemCount -> 5,10,15,... -> nextLevel is true
    var timeToMoveToNextLevel: Bool{
        problemCount % nextLevelBound == 0
    }
    
    var number1: Int{
        gameModel.currentProblem.number1
    }
    
    var number2: Int{
        gameModel.currentProblem.number2
    }
    
    var possibleSolutions: [Int] {
        gameModel.currentProblem.solutions.shuffled()
    }
    
    var answer: Int{
        gameModel.currentProblem.answer
    }
    
    var gameOver: Bool{
        gameModel.gameOver
    }
    
    func generateNumbers(){
        gameModel.currentProblem = ProblemModel(level: gameModel.level)
        
        problemCount += 1
        
        if timeToMoveToNextLevel{
            gameModel.level += 1
        }
    }
    
    func increaseScore(){
        gameModel.score += min(gameModel.level, maxIncreaseScore)
    }
    
    func loseLife(){
        gameModel.lives = max(gameModel.lives-1,0)
        gameModel.score = max(gameModel.score-2,0)
    }
    
    func reset(){
        gameModel = GameModel.defaultGame
        problemCount = 0
    }
}
