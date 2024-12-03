//
//  HighScoreEntity.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 3/12/2567 BE.
//

import Foundation
import SwiftData

@Model
class HighScoreEntity{
    var id = UUID()
    var name: String
    var score: Int
    
    init(name: String, score: Int) {
        self.name = name
        self.score = score
    }
}
