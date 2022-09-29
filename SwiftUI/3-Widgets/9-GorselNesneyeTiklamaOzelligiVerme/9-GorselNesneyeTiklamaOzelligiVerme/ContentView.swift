//
//  ContentView.swift
//  9-GorselNesneyeTiklamaOzelligiVerme
//
//  Created by Furkan on 29.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .resizable()
                .frame(width: 100,height: 100)
                .foregroundColor(.accentColor)
                .onTapGesture {
                    print("Touched Image")
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
