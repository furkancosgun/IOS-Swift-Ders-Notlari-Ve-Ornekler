//
//  Sozluk.swift
//  Sozluk App Tasarim
//
//  Created by Furkan on 8.09.2022.
//

import Foundation

class Sozluk:Codable{
    var kelime_id : String?
    var kelime_tr : String?
    var kelime_en : String?
    
    init(Kelime_id : String,Kelime_tr:String,Kelime_en:String){
        self.kelime_id = Kelime_id
        self.kelime_tr = Kelime_tr
        self.kelime_en = Kelime_en
    }
}
