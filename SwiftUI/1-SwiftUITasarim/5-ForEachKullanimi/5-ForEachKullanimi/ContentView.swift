//
//  ContentView.swift
//  5-ForEachKullanimi
//
//  Created by Furkan on 27.09.2022.
//

import SwiftUI

struct ContentView: View {
    let colors : [Color]  = [.blue,.red,.purple,.cyan]
    var body: some View {
        VStack {
            ForEach(colors, id: \.self ){ color in
                Text("Hello World!").foregroundColor(color).padding()
            }//Foreach deki id bizim indexe tekabul eder biz foreach yapısında index veremedigimiz icin self diyerek o anki indexi veirirz
            //ForEach(VeriList,id:\.self) listeden yakalancak deger in şekklinde kullanılır
            ForEach(1...10,id: \.self){ index in
                Text("\(index)")
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
