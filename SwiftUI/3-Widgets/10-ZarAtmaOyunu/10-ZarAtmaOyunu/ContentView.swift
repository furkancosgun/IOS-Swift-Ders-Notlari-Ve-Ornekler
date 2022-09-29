//
//  ContentView.swift
//  10-ZarAtmaOyunu
//
//  Created by Furkan on 29.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var zar = 1
    var body: some View {
        VStack(spacing: 50) {
            Image("dice\(zar)").resizable().frame(width: 250,height: 250)
                .background(.black)
                .shadow(radius: 10)
                
            Button("Zar At"){
                var value = Int.random(in: 1...6)
                self.zar = value
            }
            .font(.largeTitle).foregroundColor(.black).fontWeight(.heavy)
            
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
           
    }
}
