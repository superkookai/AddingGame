//
//  MainView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 30/11/2567 BE.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView{
            Text("Adding game view")
                .tabItem{
                    Image(systemName: "gamecontroller")
                    Text("Game")
                }
            
            Text("High score view")
                .tabItem{
                    Image(systemName: "list.number")
                    Text("High Scores")
                }
        }
    }
}

#Preview {
    MainView()
}
