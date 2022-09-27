//
//  ContentView.swift
//  1-PresentModal-Gecis-Transfer
//
//  Created by Furkan on 27.09.2022.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sayfayaGec = false
    //Gecis yapmak icin state degeri olan bi degisken olustrulur
    var body: some View {
        VStack {
            Text("Burası Sayfa 1").frame(width: 400,height: 100)
                .background(.orange).padding()
                .fontWeight(.bold)
            
            Button("Modal Gecis Yap", action: {//Butona tıklanırsa
                sayfayaGec = true//state degeri olan degiskenin degeri degisir
                
            }).foregroundColor(.black)
                .fontWeight(.heavy)
                .sheet(isPresented: $sayfayaGec){//Sheet fonk ile de state degeri olan degisken true olunca modal gecis yapılarak yeni sayfa acılır
                    SecondView(receivedData: "Furkan")//sheet methodunda ekranı cagırırken sanki bir parametre gibi deger eklenir
                }
        }
        .padding()
    }
}

struct SecondView: View {
    @Environment(\.presentationMode) var presentMode
    var receivedData : String?//Veri transferi yapmak için transfer yapılcak ekraana degisken oluştrulur
    //Sistem ozelliklerine enviroment mehtodu ile erişebiliriz
    var body: some View {
        VStack{
            Button("Modal Kapat", action: {
                self.presentMode.wrappedValue.dismiss()//Sistem içinden presenet modally gorunumu kapatılır
            })
            Text("\(receivedData!)")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
