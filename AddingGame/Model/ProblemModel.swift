//
//  ProblemModel.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import Foundation

struct ProblemModel: Identifiable{
    let id = UUID()
    let number1: Int
    let number2: Int
    let level: Int
    
    //solutions[0] is an answer, others are distraction
    let solutions: [Int]
    var answer: Int {
        solutions[0]
    }
    
    init(level: Int){
        self.level = level
        
        let lower = (level-1)*5
        let upper = level*5
        self.number1 = Int.random(in: lower...upper)
        self.number2 = Int.random(in: lower...upper)
        let answer = number1 + number2
        
        var newSolutions: [Int] = []
        newSolutions.append(answer) //solutions[0] corrected answer
        newSolutions.append(answer+10) //solutions[1] distraction 1
        let belowAnswer = answer-5
        let aboveAnswer = answer+5
        newSolutions.append(Int.random(in: (answer+1)...aboveAnswer)) //solutions[2] distraction 2
        newSolutions.append(Int.random(in: belowAnswer..<answer)) //solutions[3] distraction 3
        
        self.solutions = newSolutions
        
    }
    
    func checkSolution(value: Int) -> Bool {
        !solutions.isEmpty && value == answer
    }
}
