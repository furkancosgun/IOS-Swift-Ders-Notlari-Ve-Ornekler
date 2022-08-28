//
//  Persons.swift
//  8-Custom TableView kullanımı
//
//  Created by Furkan on 25.08.2022.
//

import Foundation
class Persons{
    var id : Int?
    var ad : String?
    var tel: String?
    
    init(){
        
    }
    init(Id:Int,Ad:String,Tel:String){
        self.id = Id
        self.ad = Ad
        self.tel = Tel
    }
}
