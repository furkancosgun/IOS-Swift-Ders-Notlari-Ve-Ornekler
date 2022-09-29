//
//  ContentView.swift
//  8-ImageKullanimi
//
//  Created by Furkan on 29.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var img = "2.circle"//State degeri olan degisken

    var body: some View {
        VStack {
            Image(systemName: "\(img)").resizable().frame(width: 100,height: 100)//imagei resizable ozelligi ile boyutlandırırz
            //state olan degerimizi sistem içindeki gorsel adlarını tutmak için kullandık
            HStack(spacing: 30){
                Button("1.Yap"){
                    img = "1.circle"
                }
                Button("2.Yap"){
                    img = "2.circle"
                }
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
