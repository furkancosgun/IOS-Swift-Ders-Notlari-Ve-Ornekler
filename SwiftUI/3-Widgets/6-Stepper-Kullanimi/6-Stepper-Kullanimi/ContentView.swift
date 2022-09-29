//
//  ContentView.swift
//  6-Stepper-Kullanimi
//
//  Created by Furkan on 29.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var stepperValue = 0
    var body: some View {
        VStack {
            Stepper("Deger: ",value: $stepperValue,in: 0...100)//2 deger arasında işlem yapmamızı saglar
            
            Text("\(stepperValue)")
            
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
