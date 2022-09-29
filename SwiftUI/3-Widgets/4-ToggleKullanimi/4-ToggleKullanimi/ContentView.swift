//
//  ContentView.swift
//  4-ToggleKullanimi
//
//  Created by Furkan on 28.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var isOpen = false
    var body: some View {
        VStack {
            Toggle("Ac Beni", isOn: $isOpen)
            if isOpen{
                Text("Hello")
            }
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
