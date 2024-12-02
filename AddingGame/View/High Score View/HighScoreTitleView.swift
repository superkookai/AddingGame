//
//  HighScoreTitleView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 2/12/2567 BE.
//

import SwiftUI

struct HighScoreTitleView: View {
    var body: some View {
        HStack{
            VTextImage(
                imageName: Creatures.creature0.rawValue,
                text: "Rank",
                dim: 25
            )
            
            VTextImage(
                imageName: Creatures.creature1.rawValue,
                text: "Score",
                dim: 25
            )
            
            VTextImage(
                imageName: Creatures.creature2.rawValue,
                text: "Name",
                dim: 25
            )
        }
        .padding(.horizontal)
    }
}



#Preview {
    HighScoreTitleView()
}
