//
//  EnterNewHighScoreView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 2/12/2567 BE.
//

import SwiftUI

struct EnterNewHighScoreView: View {
    let score: Int
    @Binding var name: String
    @Binding var isPresented: Bool
    @EnvironmentObject private var highScoreVM: HighScoreViewModel
    
    var body: some View {
        ZStack {
            BackgroundView(colorList: [.blue,.purple], opacity: 1)
            
            VStack {
                Text("New High Score!!")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .fontWeight(.semibold)
                    .padding()
                
                Text("\(score)")
                    .font(.largeTitle)
                    .foregroundStyle(.white)
                    .padding()
                
                TextField("Enter name", text: $name)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                    .multilineTextAlignment(.center)
                    .autocorrectionDisabled(true)
                    .padding()
                    .background(.white)
                    .clipShape(.rect(cornerRadius: 10))
                    .padding()
                
                Button {
                    name = name.isEmpty ? "Anonymous" : name
                    highScoreVM.addHighScore(name: name, score: Int64(score))
                    isPresented.toggle()
                } label: {
                    Text("Save")
                        .font(.title)
                        .foregroundStyle(.white)
                        .padding()
                        .background(.green)
                        .clipShape(.rect(cornerRadius: 10))
                }

            }
        }
    }
}

#Preview {
    EnterNewHighScoreView(
        score: 20,
        name: .constant(""),
        isPresented: .constant(true)
    )
    .environmentObject(HighScoreViewModel())
}
