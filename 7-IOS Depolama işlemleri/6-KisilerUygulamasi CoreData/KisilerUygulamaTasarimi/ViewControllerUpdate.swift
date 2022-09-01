//
//  ViewControllerUpdate.swift
//  KisilerUygulamaTasarimi
//
//  Created by Furkan on 30.08.2022.
//

import UIKit

class ViewControllerUpdate: UIViewController {


    var kisi : Kisiler?
  
    @IBOutlet weak var txtAd: UITextField!
    
    @IBOutlet weak var txtYas: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        txtAd.text = kisi!.kisi_ad
        txtYas.text = String(kisi!.kisi_yas)
    }
    //Guncelleme
    func Update(KisiAd:String,KisiYas:Int16){
          //Degerleri degistirilir
          kisi!.kisi_ad = KisiAd
          kisi!.kisi_yas = KisiYas
          //Ve geri kaydedilir
          appDelegate.saveContext()
      }
      
    @IBAction func btnUpdate(_ sender: Any) {
        if txtAd.text != nil && txtYas.text != nil {
            Update(KisiAd: txtAd.text!, KisiYas: Int16(txtYas.text!)!)  
            navigationController?.popViewController(animated: true)//Geldigi sayfaya doner

            
            
        }
    }
    

}
