//
//  ContentView.swift
//  3-AligmentVeSpacing
//
//  Created by Furkan on 27.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack(alignment: .leading,spacing: 100){//Aligment ile saga sola ve ortalama işlemleri yapılabilir
            //Spacing ile de hucreler arası boşluk bırakılabilir
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundColor(.accentColor)
                Spacer()//Aralarına maximum olcak şekilde boşluk verir
            Text("Hello, world!")
        }
        .padding()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
