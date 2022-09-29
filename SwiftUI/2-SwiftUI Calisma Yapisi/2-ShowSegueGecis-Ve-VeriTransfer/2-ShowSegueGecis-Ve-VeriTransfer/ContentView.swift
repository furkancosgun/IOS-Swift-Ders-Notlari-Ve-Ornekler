//
//  ContentView.swift
//  2-ShowSegueGecis-Ve-VeriTransfer
//
//  Created by Furkan on 28.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var gecsinMi = false
    var body: some View {
        NavigationView{//Navigation bar gorunumu veriir
            VStack{//View içindeki ana yapı gorunum
             
                Button("Sayfaya git"){
                    gecsinMi = true
                }
                
                NavigationLink(destination:SecondView(title: "IsActive True oldu" ),isActive: $gecsinMi){
           
                }
                    
                
                /*//Ilk Yontem
                 NavigationLink(destination: SecondView(title: "Second view :D")){
                    Text("Go To SecondView")
                    
                }*/
            }.navigationTitle("AnaSayfa")
        }
    }
}

struct SecondView: View {
    var title : String?
    var body: some View {
        VStack {
            Text(self.title!).font(.largeTitle)
        }
        .padding()
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
