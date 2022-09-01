//
//  ViewControllerAdd.swift
//  KisilerUygulamaTasarimi
//
//  Created by Furkan on 30.08.2022.
//

import UIKit

class ViewControllerAdd: UIViewController {
    let context =  appDelegate.persistentContainer.viewContext 

    @IBOutlet weak var txtKisiAd: UITextField!
    @IBOutlet weak var txtKisiYas: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func btnSave(_ sender: Any) {
        Save(KisiAd: txtKisiAd.text!, KisiYas: Int16(txtKisiYas.text!)!)
        navigationController?.popViewController(animated: true)
    }
    
    
    func Save(KisiAd : String,KisiYas : Int16) {
         //Tabloya veri eklemk için once tablo tipinde bir nesne oluşturulur
         let kisi = Kisiler(context: context)
         
         //Daha sonra ise nesne doldurulur
         kisi.kisi_ad = KisiAd
         kisi.kisi_yas = KisiYas
         
         //Appdelegate nesnesi yardımı ile de kayıt işlemi yaparız
         appDelegate.saveContext()
         print("Kisi Eklendi")
     }

}
