//
//  Product.swift
//  9-Detaylı TableView Kullanımı
//
//  Created by Furkan on 25.08.2022.
//

import Foundation
import UIKit

class Product{
    var urunAd : String?
    var urunFiyat : Int?
    var urunImg : UIImage?
    
    init(){
        
    }
    
    init(UrunAd:String,UrunFiyat:Int,UrunImg:UIImage) {
        self.urunAd = UrunAd
        self.urunFiyat = UrunFiyat
        self.urunImg = UrunImg
    }
}
