//
//  ContentView.swift
//  6-ScrollView
//
//  Created by Furkan on 27.09.2022.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        ScrollView(.vertical, showsIndicators: true){//Varsayılan olarak axis veticaldır yatakyadki gorunumleri scroll etmeye yara vstack kullanılırken vertical hstack kullanılırken horizontal kullanılması mantıklıdır
        VStack {
           
                ForEach(1...20,id: \.self){ index in
                    Text("\(index).Box").frame(width: 100,height: 100).background(.red)
            
                }
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
