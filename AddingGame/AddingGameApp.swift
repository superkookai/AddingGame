//
//  AddingGameApp.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 30/11/2567 BE.
//

import SwiftUI

@main
struct AddingGameApp: App {
    @State var highScoreVM = HighScoreViewModel()
    
    var body: some Scene {
        WindowGroup {
            MainView()
                .environment(highScoreVM)
        }
    }
}
