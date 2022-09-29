//
//  ContentView.swift
//  3-TextField-Kullanimi
//
//  Created by Furkan on 28.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var metin = ""
    @State private var sifre = ""
    var body: some View {
        VStack(spacing: 20) {
            TextField("Deger Giriniz", text: $metin)
                .foregroundColor(.red).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
                
            Text("Girilen Deger :\(metin)")
                
            SecureField("Şifre alanı", text: $sifre ).textFieldStyle(RoundedBorderTextFieldStyle()).padding()
            
            Text("Girilen Deger :\(sifre)")
                .textFieldStyle(RoundedBorderTextFieldStyle()).padding()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
