//
//  ContentView.swift
//  Animation
//
//  Created by Ifang Lee on 9/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 1

    var body: some View {
        Button("tap me"){
//            animationAmount *= 1.0
        }
        .padding(50)
        .background(Color.green)
        .foregroundColor(.white)
        .clipShape(Ellipse())
        .overlay(
            Ellipse()
                .stroke(Color.black)
                .scaleEffect(animationAmount)
                .opacity(Double(2 - animationAmount))
                .animation(
                    Animation.easeInOut(duration: 1)
                        .repeatForever(autoreverses: false)
                )
        )
        .onAppear {
            self.animationAmount = 2
        }
        .scaleEffect(animationAmount)
//        .blur(radius: (animationAmount - 1) * 1.2)
//        .animation(.interpolatingSpring(stiffness: 50, damping: 1))

    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
