//
//  HighScoreView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import SwiftUI

struct HighScoreView: View {
    var body: some View {
        ZStack{
            HighScoreBackgroundView()
            
            Text("High Score View")
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    HighScoreView()
}
