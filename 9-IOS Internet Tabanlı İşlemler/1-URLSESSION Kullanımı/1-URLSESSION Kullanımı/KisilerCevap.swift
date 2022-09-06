//
//  KisilerCevap.swift
//  1-URLSESSION Kullanımı
//
//  Created by Furkan on 6.09.2022.
//

import Foundation

//Sadece codable sınıfından kalıtım alcak sınıf oluşturulur jsondan donen veri tipine uygun
class KisilerCevap : Codable {
    var kisiler : [Kisiler]?
}
