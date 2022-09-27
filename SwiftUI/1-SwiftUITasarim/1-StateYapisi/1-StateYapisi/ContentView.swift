//
//  ContentView.swift
//  1-StateYapisi
//
//  Created by Furkan on 27.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var  deger = 0 //State keywordu verilmişse bu ekranı guncelleyebilir niteligi taşır
    var body: some View {
        VStack {
        Text("\(deger)")
            Button("Degeri artır", action: {
                deger = deger + 1
            })
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
