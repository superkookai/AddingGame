//
//  RankScoreView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 2/12/2567 BE.
//

import SwiftUI

struct RankScoreView: View {
    let scoreColors: [Color] = [.blue,.pink,.purple,.yellow,.orange]
    
    let rank: Int
    let score: Int
    let entity: HighScoreEntity
    var color: Color{
        scoreColors[(rank-1) % scoreColors.count]
    }
    
    @State private var editMode: Bool = false
    @State private var name = ""
    @State private var save = false
    
    @Environment(HighScoreViewModel.self) private var highScoreVM: HighScoreViewModel
    
    var body: some View {
        VStack {
            if editMode {
                HStack{
                    TextField(entity.name ?? "Name", text: $name)
                        .padding()
                        .background(.green.gradient)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .clipShape(.rect(cornerRadius: 10))
                    
                    Button {
                        highScoreVM
                            .updateHighScore(
                                entity: entity,
                                name: name.isEmpty ? (entity.name ?? "Anonymous") : name
                            )
                        withAnimation {
                            editMode.toggle()
                        }
                    } label: {
                        Text("Save")
                            .foregroundStyle(.white)
                            .padding()
                            .background(.red.gradient)
                            .clipShape(.rect(cornerRadius: 10))
                    }

                }
            } else {
                HStack{
                    Text(rank.ordinal)
                        .frame(maxWidth: .infinity)
                    
                    Text("\(score)")
                        .frame(maxWidth: .infinity)
                    
                    Text(entity.name?.uppercased() ?? "")
                        .frame(maxWidth: .infinity)
                }
                .font(.headline)
                .fontWeight(.semibold)
                .foregroundStyle(color)
                .onTapGesture {
                    withAnimation {
                        editMode.toggle()
                    }
                }
            }
        }
    }
}


