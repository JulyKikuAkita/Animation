//
//  ContentView.swift
//  Animation
//
//  Created by Ifang Lee on 9/28/21.
//

import SwiftUI

struct ContentView: View {
    @State private var enabled = false


    var body: some View {

        Button("tap me"){
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? Color.green : Color.orange)
        .animation(nil)
        .foregroundColor(.white)
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1))
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
