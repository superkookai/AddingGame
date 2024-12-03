//
//  RankScoreView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 2/12/2567 BE.
//

import SwiftUI
import SwiftData

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
    
//    @EnvironmentObject private var highScoreVM: HighScoreViewModel
    @Environment(\.modelContext) var modelContext
    
    var body: some View {
        VStack {
            if editMode {
                HStack{
                    TextField(entity.name, text: $name)
                        .padding()
                        .background(.green.gradient)
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                        .clipShape(.rect(cornerRadius: 10))
                    
                    Button {
                        entity.name = name.isEmpty ? "Anonymous" : name
                        do{
                            try modelContext.save()
                        }catch{
                            print("Error saving: \(error.localizedDescription)")
                        }
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
                    
                    Text(entity.name.uppercased())
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


