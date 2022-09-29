//
//  ContentView.swift
//  4-DinamikListe
//
//  Created by Furkan on 29.09.2022.
//

import SwiftUI

struct icerikView : View{
    var ulkeAd : String
    var body: some View{
        Text(ulkeAd)
    }
}
struct ContentView: View {
    @State private var ulkeList = [String]()
    var body: some View {
        NavigationView{
            List{
                ForEach(ulkeList,id: \.self){ ulke in
                    icerikView(ulkeAd: ulke).onTapGesture {
                        print("Tıklandı\(ulke)")
                    }
                }.onDelete(perform: ulkeSil)
            }.navigationTitle("Ülkeler")
                
        }
        .onAppear(){
            self.ulkeList = ["Almanya","Hollanda","Avusturalya","Kanada"]
        }
    }
func ulkeSil(at offsets : IndexSet){
    self.ulkeList.remove(atOffsets: offsets)
}
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
