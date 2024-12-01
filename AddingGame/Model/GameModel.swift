//
//  GameModel.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import Foundation

struct GameModel: Identifiable {
    let id = UUID()
    var level: Int
    var score: Int
    var speed: Int
    var lives: Int
    var currentProblem: ProblemModel
    
    var gameOver: Bool {
        lives == 0
    }
    
    static let defaultGame = GameModel(level: 1, score: 0, speed: 1, lives: 3)
    
    init(level: Int, score: Int, speed: Int, lives: Int) {
        self.level = level
        self.score = score
        self.speed = speed
        self.lives = lives
        self.currentProblem = ProblemModel(level: level)
    }
    
    mutating func updateScore(value: Int){
        let isCorrect = currentProblem.checkSolution(value: value)
        if isCorrect{
            score += level
        }else{
            lives -= 1
        }
    }
}
