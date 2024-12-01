//
//  BubbleView.swift
//  AddingGame
//
//  Created by Weerawut Chaiyasomboon on 1/12/2567 BE.
//

import SwiftUI

struct BubbleView: View {
    let bubbleSize: CGFloat = 200
    let textColor: Color
    let bgColor: Color
    let name: String
    let text: String
    
    @State private var rotate = 0.0
    
    var body: some View {
        Text(text)
            .foregroundStyle(textColor)
            .font(.largeTitle)
            .fontWeight(.semibold)
            .padding()
            .background(
                Image(name)
                    .resizable()
                    .scaledToFill()
                    .opacity(0.6)
                    .rotationEffect(.degrees(rotate))
                    .background(bgColor)
                    .clipShape(.circle)
            )
            .padding()
            .onAppear{
                withAnimation(.linear(duration: 20).repeatForever(autoreverses: false)) {
                    rotate = 360
                }
            }
    }
}

#Preview {
    VStack {
        BubbleView(
            textColor: .black,
            bgColor: .purple.opacity(0.7),
            name: "bubble2",
            text: "25"
        )
        
        BubbleView(
            textColor: .black,
            bgColor: .purple.opacity(0.7),
            name: "bubble3",
            text: "25"
        )
        
        BubbleView(
            textColor: .white,
            bgColor: .purple.opacity(0.7),
            name: "bubble1",
            text: "25"
        )
    }
}
