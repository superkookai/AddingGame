//
//  TitleValueView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import SwiftUI

struct TitleValueView: View {
    let title: String
    let value: Int
    
    var body: some View {
        VStack {
            Text(title)
            Text("\(value)")
        }
        .font(.headline)
        .fontWeight(.bold)
        .foregroundStyle(.white)
    }
}

#Preview {
    ZStack {
        GameBackgroundView()
        
        TitleValueView(title: "Score", value: 10)
    }
}
