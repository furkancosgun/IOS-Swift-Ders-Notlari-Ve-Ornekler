//
//  ContentView.swift
//  7-SliderKullanimi
//
//  Created by Furkan on 29.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderVal = 0.0
    var body: some View {
        VStack {
            Slider(value: $sliderVal, in: 0...100.0)//2 deger arasında kaydırma işlemi gercekleştrilir
            
            Text("\(sliderVal)")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
