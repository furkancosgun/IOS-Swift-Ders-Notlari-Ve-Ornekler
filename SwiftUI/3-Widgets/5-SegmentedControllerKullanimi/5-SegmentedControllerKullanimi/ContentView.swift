//
//  ContentView.swift
//  5-SegmentedControllerKullanimi
//
//  Created by Furkan on 28.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var segment = 0
    var body: some View {
        VStack {
            Picker("", selection: $segment){//Picker oluştrulur
                Text("First").tag(1)//segmentetler uzerindeki ifadeler ve secim degerleri
                Text("Second").tag(2)
                Text("Last").tag(3)
                
            }.pickerStyle(.segmented)//picker style 
            Text("Secim Sonucu :\(segment)")//Secilen segment no
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
