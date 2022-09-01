//
//  ViewController.swift
//  Genel Kultur APP Tasarim
//
//  Created by Furkan on 31.08.2022.
//

import UIKit
import CoreData


let appDel = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {

   // let persistentContainer = NSPersistentContainer(name: "Soru")
    
    let context = appDel.persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        
        /*
        Save(soru: "“Sinekli Bakkal” Romanının Yazarı Aşağıdakilerden Hangisidir?", cvpA: "Reşat Nuri Güntekin", cvpB: "Halide Edip Adıvar", cvpC: "Halide Edip Adıvar", cvpD: "Ömer Seyfettin", cevap: "Halide Edip Adıvar ")
        Save(soru: "Aşağıda Verilen İlk Çağ Uygarlıklarından Hangisi Yazıyı İcat Etmiştir?", cvpA: "Hititler", cvpB: "Elamlar", cvpC: "Sümerler", cvpD: "Urartular", cevap: "Sümerler")
        Save(soru: "Tsunami Felaketinde En Fazla Zarar Gören Güney Asya Ülkesi Aşağıdakilerden Hangisidir?", cvpA: "Endonezya", cvpB: "Srilanka", cvpC: "Tayland", cvpD: "Hindistan", cevap: "Endonezya")
        Save(soru: "2003 Yılında Euro Vizyon Şarkı Yarışmasında Ülkemizi Temsil Eden ve Yarışmada Birinci Gelen Sanatçımız Kimdir?", cvpA: "Grup Athena", cvpB: "Sertap Erener", cvpC: "Şebnem Paker", cvpD: "Ajda Pekkan", cevap: "Sertap Erener")
        Save(soru: "Mustafa Kemal Atatürk’ün Nüfusa Kayıtlı Olduğu İl Hangisidir?", cvpA: "Bursa", cvpB: "Ankara", cvpC: "İstanbul", cvpD: "Gaziantep", cevap: "Gaziantep")
         */
    }

    //Kaydetme
    func Save(soru : String,cvpA : String,cvpB : String,cvpC : String,cvpD : String,cevap : String) {
        //Tabloya veri eklemk için once tablo tipinde bir nesne oluşturulur
        let sorular = Soru(context: context)
        
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

