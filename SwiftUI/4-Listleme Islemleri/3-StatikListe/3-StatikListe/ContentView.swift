//
//  ContentView.swift
//  3-StatikListe
//
//  Created by Furkan on 29.09.2022.
//

import SwiftUI

struct IcerikView : View{
    var ulkeAd : String
    var body: some View{
        
            Text(ulkeAd)
        
    }
}

struct ContentView: View {
    var body: some View {
            List{
                IcerikView(ulkeAd: "Almanya")
                IcerikView(ulkeAd: "Almanya")
                IcerikView(ulkeAd: "Almanya")
                IcerikView(ulkeAd: "Almanya")
                IcerikView(ulkeAd: "Almanya")
                IcerikView(ulkeAd: "Almanya")
            }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
