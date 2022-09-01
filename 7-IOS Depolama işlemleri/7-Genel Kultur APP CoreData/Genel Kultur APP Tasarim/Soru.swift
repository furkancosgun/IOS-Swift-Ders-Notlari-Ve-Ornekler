//
//  Soru.swift
//  Genel Kultur APP Tasarim
//
//  Created by Furkan on 31.08.2022.
//

import Foundation
import CoreData

class Soru{
    var soruList = [Sorular]()
    //Core data işlemlerini yapmamız için kullancagimiz yapı
    let context : NSManagedObjectContext?

    init(context : NSManagedObjectContext){
        self.context = context
    }
    //Listeleme
    func Read() -> [Sorular] {
        do {
            //Do catch yapısı ile kisi listemize context yani tablo içinden kişileri alcagımızı soyledik
            soruList =  try context!.fetch(Sorular.fetchRequest())
        } catch {
            print("ERROR")
        }
        return soruList
        
    }
    
    //Kaydetme
    func Save(soru : String,cvpA : String,cvpB : String,cvpC : String,cvpD : String,cevap : String) {
        //Tabloya veri eklemk için once tablo tipinde bir nesne oluşturulur
        let sorular = Sorular(context: self.context!)
        
        sorular.soru = soru
        sorular.cvpA = cvpA
        sorular.cvpB = cvpB
        sorular.cvpC = cvpC
        sorular.cvpD = cvpD
        sorular.cevap = cevap
        
        //Appdelegate nesnesi yardımı ile de kayıt işlemi yaparız
        appDel.saveContext()
        print("Soru Eklendi")
    }
  
   

}
