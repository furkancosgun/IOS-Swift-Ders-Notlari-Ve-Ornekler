//
//  ContentView.swift
//  2-Stacks
//
//  Created by Furkan on 27.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack{//Dikey hizalama
            Text("IOS")
            Text("Apple")
            Text("Mac")
            HStack{//Yatay Sıralama yapar
                Text("IOS 14")
                Text("IOS 15")
                Text("IOS 16")
            }
            ZStack{//En son eklenen hep en ustte olur
                Image(systemName: "globe")
                    .fixedSize(horizontal: true, vertical: true)
                Text("Globe")
            }
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
