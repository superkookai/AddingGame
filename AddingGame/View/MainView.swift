//
//  MainView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 30/11/2567 BE.
//

import SwiftUI

struct MainView: View {
    @Environment(HighScoreViewModel.self) private var highScoreVM: HighScoreViewModel
    
    var body: some View {
        TabView{
            AddingGameView()
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            
            HighScoreView()
                .tabItem{
                    Image(systemName: "list.number")
                    Text("High Scores")
                }
        }
    }
}

#Preview {
    MainView()
        .environment(HighScoreViewModel())
}
