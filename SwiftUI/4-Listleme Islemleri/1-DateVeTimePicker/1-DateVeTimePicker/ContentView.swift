//
//  ContentView.swift
//  1-DateVeTimePicker
//
//  Created by Furkan on 29.09.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var saatGor = false
    @State private var tarihGor = false
    @State private var zaman = Date()
    var body: some View {
        VStack(spacing: 100) {
            
            Button("SAAT"){
                if saatGor{
                    saatGor = false
                }else{
                    saatGor = true
                }
                
            }.font(.largeTitle).fontWeight(.heavy)
            
            if saatGor{//Eger saat stati true ise
                DatePicker("",selection: $zaman,displayedComponents: .hourAndMinute).labelsHidden()
                //datepicker kullanarak saatvedakika goster bu verileri zaman degiskeninden al ve labelları gizle
            }
            
            Button("TARIH"){
                if tarihGor{
                    tarihGor = false
                }else{
                    tarihGor = true
                }
                
            }.font(.largeTitle).fontWeight(.heavy)
          
            if tarihGor {
                DatePicker("",selection: $zaman,displayedComponents:.date).labelsHidden()
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
