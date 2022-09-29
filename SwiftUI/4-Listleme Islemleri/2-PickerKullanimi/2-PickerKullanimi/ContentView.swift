//
//  ContentView.swift
//  2-PickerKullanimi
//
//  Created by Furkan on 29.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var secilenIndex = 0
    var ulkeList = ["Almanya","Hollanda","Turkiye","Isvicre","Fransa"]
    var body: some View {
        
        VStack {
            Picker("", selection: $secilenIndex){
                ForEach(0 ..< ulkeList.count){
                    Text("\(ulkeList[$0])")
                }
            }.labelsHidden()
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
