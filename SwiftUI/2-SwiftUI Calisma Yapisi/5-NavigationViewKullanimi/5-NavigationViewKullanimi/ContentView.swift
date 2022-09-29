//
//  ContentView.swift
//  5-NavigationViewKullanimi
//
//  Created by Furkan on 28.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        NavigationView{
            
            
            VStack{
                Text("Selamss")
            }
            //Naviagion bar items diyerek sag ve sol taraflarına gorunumler verbilirz
            .navigationBarTitle("Main View",displayMode: .inline)//display mode big title olsunmu olmasınmı
            .navigationBarItems(leading:
                HStack{
                    Button("Selam", action: {
                        print("Selam")
                    })
                Text("Selam")
            }, trailing:
                
                    Text("Bruhh")
                
            )}
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
