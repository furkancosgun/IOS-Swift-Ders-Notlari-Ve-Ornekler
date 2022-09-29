//
//  ContentView.swift
//  GirilenDegerIleGecis
//
//  Created by Furkan on 28.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var text : String = ""//Text Fiel Alanı için deger tutucu
    var body: some View {
       
        NavigationView{
            VStack{
                TextField("Deger Alim", text: $text).textFieldStyle(RoundedBorderTextFieldStyle())
                    .padding(10)
                NavigationLink(destination: SecondView(girilenDeger: text)){
                    Text("Diger Sayfaya Gec")
                }
            }.padding()
        }.navigationTitle("Main Page")
    }
}

struct SecondView : View{
    var girilenDeger : String?
    var body: some View{
        VStack{
            Text(girilenDeger!)
        }.navigationTitle("Second View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
