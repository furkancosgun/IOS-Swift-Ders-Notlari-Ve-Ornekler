//
//  Movies.swift
//  11-Detaylı CollectionView
//
//  Created by Furkan on 27.08.2022.
//

import Foundation
import UIKit

class Movies {
    var id : Int?
    var title : String?
    var price : Double?
    var img : UIImage?
    init(){
        
    }
    init(Id:Int,Title:String,Price:Double,Img:UIImage){
        self.id = Id
        self.title = Title
        self.price = Price
        self.img = Img
    }
}
