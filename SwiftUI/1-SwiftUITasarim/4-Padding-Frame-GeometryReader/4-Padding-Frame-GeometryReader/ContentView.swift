//
//  ContentView.swift
//  4-Padding-Frame-GeometryReader
//
//  Created by Furkan on 27.09.2022.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        VStack {
            Image("ios")
                .imageScale(.large)
                .foregroundColor(.accentColor).frame(width: 100,height: 100)//Frame ozelligi ile gorunumun boyutlartı belirlenir
            Text("Hello, world!").padding(.all,30)//Gorunumlere padding verilebilir hucrenin iç katmanını dışarıdan uzak tutar
            
            GeometryReader{ geometry in //Geometry sınıfnı kullanarak kalan alanın degerlerini alır bizde bununla eşit olculerde programlar yapabiliriz
                Image("ios").frame(width: geometry.size.width , height: geometry.size.height)
            }
        }
        
    }
   
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
