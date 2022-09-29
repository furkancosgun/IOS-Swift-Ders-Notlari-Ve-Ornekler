//
//  ContentView.swift
//  2-Button Kullanimi
//
//  Created by Furkan on 28.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var sayac = 0//State degisken veya objeler ekranı yenilmememize olanak saglar
    var body: some View {
        VStack(spacing: 15) {
            Button("Artır"){
                sayac += 1
                print("Sayacın degeri artırıldı")
            }.font(.largeTitle)
            Text("Sayac : \(sayac)").font(.largeTitle)
            Button("Azalat"){
                sayac -= 1
                print("Sayacın degeri azaltıldı")
            }.font(.largeTitle)
                .foregroundColor(.red)
        }
        .padding()
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
