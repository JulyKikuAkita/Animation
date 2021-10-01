//
//  ContentView.swift
//  Animation
//
//  Created by Ifang Lee on 9/28/21.
//

import SwiftUI

struct CornerRotateModifer: ViewModifier {
    let amount: Double
    let anchor: UnitPoint

    func body(content: Content) -> some View {
        // clipped: the view rotates the parts that are lying outside its natural rectangle don’t get drawn.
        content.rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

struct ContentView: View {
    @State private var isShowinRed = false

    var body: some View {
        ZStack {
            VStack {
                Button("tap me"){
                    withAnimation() {
                        isShowinRed.toggle()
                    }
                }

                if isShowinRed {
                    Ellipse()
                        .fill(Color.green)
                        .frame(width: 300, height: 300)
//                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
                        .transition(.pivot)
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(active: CornerRotateModifer(amount: -90, anchor: .bottomTrailing), identity: CornerRotateModifer(amount: 0, anchor: .topTrailing))
    }
}
