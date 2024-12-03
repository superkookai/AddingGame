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
    let container: ModelContainer
    let highScoreVM: HighScoreViewModel
    
    var body: some Scene {
        WindowGroup {
            MainView()
        }
        .environment(highScoreVM)
        .modelContainer(container)
    }
    
    init() {
        container = try! ModelContainer(for: HighScoreEntity.self)
        highScoreVM = .init(container: container)
    }
}
