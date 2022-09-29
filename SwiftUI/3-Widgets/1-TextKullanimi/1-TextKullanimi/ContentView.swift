//
//  ContentView.swift
//  1-TextKullanimi
//
//  Created by Furkan on 28.09.2022.
//

import SwiftUI

struct ContentView: View {
    private var text = "Furkan"
    var body: some View {
        VStack {
           Text("Furkan Coşgun")
            Text(text)
                .foregroundColor(.orange)//Metin rengi
                .background(.red)//Arka plan rengi
                .font(.largeTitle)//font tipi
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
