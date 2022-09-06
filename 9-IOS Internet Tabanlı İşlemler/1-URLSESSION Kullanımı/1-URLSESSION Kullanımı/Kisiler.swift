//
//  Kisiler.swift
//  1-URLSESSION Kullanımı
//
//  Created by Furkan on 6.09.2022.
//

import Foundation

//Sadece codable sınıfından kalıtım alcak sınıf oluşturulur json veri tipine uygun
class Kisiler : Codable{
    var kisi_id : String?
    var kisi_ad : String?
    var kisi_tel : String?
    
    init(kisi_id:String,kisi_ad:String,kisi_tel:String) {
        self.kisi_id = kisi_id
        self.kisi_ad = kisi_ad
        self.kisi_tel = kisi_tel
    }
}
