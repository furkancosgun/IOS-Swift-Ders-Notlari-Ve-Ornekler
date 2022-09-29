//
//  ContentView.swift
//  6-TabBar-Kullanim
//
//  Created by Furkan on 28.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            TabView{//Tab View açılır
                VStack{//Screen içindeki gorunumler
                    Text("First View")
                }.tabItem{//gorunumun en altındaki bar gostergesinde ne olcagı
                    Image(systemName: "1.circle")
                    Text("First View")
                }.tag(1)//Ve hangi sayfada oldugumzuu anlamak için tag
                //Kullanmasakta calisir :D
                VStack{
                    Text("SecondView")
                }.tabItem{
                    Image(systemName: "2.circle")
                    Text("SecondView")
                }.tag(2)
            }
        }
        .navigationTitle("Main View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
