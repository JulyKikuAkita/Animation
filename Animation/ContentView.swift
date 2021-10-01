//
//  ContentView.swift
//  Animation
//
//  Created by Ifang Lee on 9/28/21.
//

import SwiftUI

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
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 100, height: 100)
                        .transition(.asymmetric(insertion: .scale, removal: .opacity))
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
