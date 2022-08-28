//
//  ViewController.swift
//  4-TextField ile PickerView kullanimi
//
//  Created by Furkan on 23.08.2022.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource{
    
    
    var selectedIndex = 0
    @IBOutlet weak var txtField: UITextField!
    var pickerView : UIPickerView?
    var sehiler = ["Adana","Adıyaman", "Afyon", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin",
                   "Aydın", "Balıkesir","Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale",
                   "Çankırı", "Çorum","Denizli","Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum ", "Eskişehir",
                   "Gaziantep", "Giresun","Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir",
                   "Kars", "Kastamonu", "Kayseri","Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya ", "Malatya",
                   "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya",
                   "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon  ", "Tunceli", "Şanlıurfa", "Uşak",
                   "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt ", "Karaman", "Kırıkkale", "Batman", "Şırnak",
                   "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük ", "Kilis", "Osmaniye ", "Düzce"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //picker view tanımlama
        pickerView = UIPickerView()
        pickerView?.dataSource = self
        pickerView?.delegate = self
        txtField.inputView = pickerView
        
        //pickerView a button ekleme
        let toolbar = UIToolbar()//Toolbar oluşturduk
        toolbar.tintColor = UIColor.red//Tolbar button rengi
        toolbar.sizeToFit()//Toolbar alanını ekrana gore genişletir otomatik
        
        let btnOk = UIBarButtonItem(title: "OK", style: .plain, target: self, action: #selector(self.btnOkClick))
        //Button tanımlanır ok yazan ve plain tipinde olan target yanı işlem yapacagı kendisi olan ve action tipi btnOkClik olan methodu her tıklayışta çalıştırır
        
        let space = UIBarButtonItem(barButtonSystemItem: .flexibleSpace, target: nil, action: nil)
        //Boş bir flexible space tanımladık hiçbir işlem yapmana
        
        let btnCancel = UIBarButtonItem(title: "CANCEL", style: .done, target: self, action: #selector(self.btnCancelClick))
        
        toolbar.setItems([btnCancel,space,btnOk], animated: true)//Set items diyerek item listesi verilir
        
        txtField.inputAccessoryView = toolbar
        //inputa tıklanınca bir gorunum ve bir de gorunumun aksesuraı olan vardır biz burda pickerview ile gorunumu aksesuar alanını da toolbar ile doldurmuş olduk
        
    }
    
    //Kolon Sayısı
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1 //1 Kolon veri bascam dedim
    }
 
    //Satır sayısı
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return sehiler.count //liste uzunlugu kadar veri bascam dedim
    }
    
    //Verinin ne gostercegi
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return sehiler[row] //Sehir listesini tek tek bascam deidm
    }
 
    //Secilen satırı verir
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        txtField.text = sehiler[row]//Satır secildiginde textfield içine yaz dedim
        selectedIndex = row //Secilen satırı degiskene attım
    }
    
    @objc func btnCancelClick(){
        
            view.endEditing(true)//Gorunmumu kapatmaya zorlar yani biz pickeri kapatacgız
    }
      
    
    @objc func btnOkClick(){
        print(sehiler[selectedIndex])
    
    }
}

