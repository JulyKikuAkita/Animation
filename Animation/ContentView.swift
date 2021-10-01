//
//  ContentView.swift
//  Animation
//
//  Created by Ifang Lee on 9/28/21.
//

import SwiftUI

struct ContentView: View {
    let letters = Array("Hello Mangos")
    let mangoInitialLocaiton = CGSize(width: 0, height: -150)
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var dragAmount2: CGSize = CGSize(width: 0, height: -150)

    var body: some View {
        ZStack {
            HStack(spacing: 0) {
                ForEach(0..<letters.count) { idx in
                    Text(String(letters[idx]))
                        .padding(5)
                        .font(.title)
                        .background(enabled ? Color.red : Color.orange)
                        .offset(dragAmount)
                        .animation(Animation.default.delay(Double(idx) / 20))
                }
            }
            .gesture(
                DragGesture()
                    .onChanged { dragAmount = $0.translation}
                    .onEnded { _ in
                        dragAmount = .zero
                        enabled.toggle()
                    }
            )

            VStack {
                LinearGradient(gradient: Gradient(colors: [.yellow, .pink]),
                               startPoint: .topLeading,
                               endPoint: .bottomTrailing
                )
                    .frame(width: 300, height: 200)
                    .clipShape(Ellipse())
                    .offset(dragAmount2)
                    .gesture(
                        DragGesture()
                            .onChanged{ move in dragAmount2 = move.translation }
                            .onEnded{ _ in
                                withAnimation(.spring()) {
                                    dragAmount2 = mangoInitialLocaiton
                                }
                            }
                    )
    //                .animation(.spring())

                Button("tap me"){
                    enabled.toggle()
                }
                .frame(width: 100, height: 100)
                .background(enabled ? Color.green : Color.orange)
                .animation(nil)
                .foregroundColor(.white)
                .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
                .animation(.interpolatingSpring(stiffness: 10, damping: 1))
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
