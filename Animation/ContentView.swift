//
//  ContentView.swift
//  Animation
//
//  Created by Ifang Lee on 9/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount: CGFloat = 0.0


    var body: some View {
        VStack {  //animation modifier
            Stepper("Scale amount", value: $animationAmount.animation(
                Animation.easeOut(duration: 1)
                    .repeatCount(3, autoreverses: true)
            ), in: 1...10)

            Spacer()

            Button("All axis spin"){
                animationAmount += 180
            }
            .padding(100)
            .background(Color.orange)
            .foregroundColor(.white)
            .clipShape(Circle())
            .rotation3DEffect(.degrees(animationAmount), axis: (x:1, y:1, z:1))

            HStack{
                VStack {
                    Text("Explicit animaiton")
                    Button("Tap me"){
                        withAnimation {
                            animationAmount += 360
                        }
                    }
                    .padding(40)
                    .background(Color.red)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .rotation3DEffect(.degrees(animationAmount), axis: (x:1, y:0, z:0))

                }

                VStack{
                    Text("No explicit animaiton")
                    Button("Tap me"){
                        animationAmount += 180
                    }
                    .padding(40)
                    .background(Color.black)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .rotation3DEffect(.degrees(animationAmount), axis: (x:0, y:1, z:0))
                }

                VStack{
                    Text("z axis")
                    Button("Tap me"){
                        withAnimation(.interactiveSpring(response: 1, dampingFraction: 2, blendDuration: 1)){
                            animationAmount += 360
                        }
                    }
                    .padding(40)
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .clipShape(Circle())
                    .rotation3DEffect(.degrees(animationAmount), axis: (x:0, y:0, z:1))
                }
            }
        }

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
