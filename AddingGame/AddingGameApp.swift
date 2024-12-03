//
//  AddingGameApp.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 30/11/2567 BE.
//

import SwiftUI
import SwiftData

@main
struct AddingGameApp: App {
//    @StateObject var highScoreVM = HighScoreViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .modelContainer(for: HighScoreEntity.self)
//                .environmentObject(highScoreVM)
        }
    }
}
