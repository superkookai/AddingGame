//
//  TestLocalizeView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 30/11/2567 BE.
//

import SwiftUI

struct TestLocalizeView: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Game over")
            Text("Score")
            Text("Level")
            Text("Game")
            Text("High Scores")
            Text("Rank")
            Text("Name")
            Text("Save")
        }
        .font(.title)
    }
}

#Preview {
    TestLocalizeView()
}
