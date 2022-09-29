//
//  ContentView.swift
//  4-VeriPaylasimi
//
//  Created by Furkan on 28.09.2022.
//

import SwiftUI

class Veri:ObservableObject{ //Gozelenebilri obje sınfıını oluşturduk bu sınıftan turemiş objede bi degisiklik olursa butun ekranlara yansır
    @Published var sayac : Int = 0//Publised objemiz heryerde degisikligi yakalayan objemizidr
}

struct ContentView: View {
    @ObservedObject var Sayac = Veri()//Observable turde sınıftan obje olusturduk
    var body: some View {
        NavigationView{
            VStack(spacing: 10){
                Text("Observal Obje :\(Sayac.sayac)")//Degeri gosterdik
                Button("Sayac artır"){
                    Sayac.sayac += 1//Degeri artırabilir
                }
                NavigationLink(destination: SecondView(sayac: $Sayac.sayac)){//2.sayfamıza gonderdik objemizi
                    Text("Go To SeconView")
                }
            }
        }.navigationTitle("Main View")
    }
}

struct SecondView:View{
    @Binding var sayac : Int//Bindin yapısıla observable objeyi yakaldık
    var body: some View{
        VStack{
            Text("Observable Obje Degeri: \(sayac)")//degerini gosterdik
            Button("Sayac Artır"){
                sayac += 1//Degerini artırabiliriz
                //Degisiklikler ilk ekranımıza da yansıayacaktık
            }
        }.navigationTitle("Second View")
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
