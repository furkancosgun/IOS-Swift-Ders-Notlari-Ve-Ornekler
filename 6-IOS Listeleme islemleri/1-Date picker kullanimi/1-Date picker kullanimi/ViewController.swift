//
//  ViewController.swift
//  1-Date picker kullanimi
//
//  Created by Furkan on 22.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFieldDate: UITextField!
    
    //Date picker nesnesi sonradan doldurulmak uzere oluşturuldu
    var datePicker : UIDatePicker?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        datePicker = UIDatePicker()//Date picker nesnesi doldu
        
        datePicker?.datePickerMode = .date//Date picker gorunumu sadece bize tarih versin istyoruz
        
        txtFieldDate.inputView = datePicker//Text fielda tıklayınca giris gorunumu datepicker turuunde olcak
        
        //Add target diyerek içine verinen fonksyonu istenilen şekilde çaşıtırır biz bu sınfın  içindekş getdate methodunu verdik  her deger degiisminde method calisacak
        datePicker?.addTarget(self, action:#selector(self.getDate(date:)), for: .valueChanged)
        
        
        
        
        //Ekrandaki herhangi bir alana dokunuldugunda tetiklenir
        //Genellikle klavye kapatmalarımda vs kullanılır
        let clickMethod = UITapGestureRecognizer(target: self, action: #selector(self.tapFunc))
        view.addGestureRecognizer(clickMethod)
    }
    
    
    @objc func getDate(date:UIDatePicker){
        
        //Tarih formatlama işlemi yapacagız
        let dateFormatter = DateFormatter()//Formatlama işlemi için nesne oluşturduk
        dateFormatter.dateFormat = "dd/MM/yyyy"//Format tipimiz
        let dateText = dateFormatter.string(from: date.date)//Formatlama işlemini string uzerinden yapcaz dedik ve datepickerimizi veridk
        
        print(dateText)
        txtFieldDate.text = dateText
    }
    
    
    //Ekrandaki herhangi bir alana dokunuldugunda caliscak olan kod
    //Genellikle klavye kapatmalarımda vs kullanılır
    @objc func tapFunc(){
      //  view.endEditing(true) //Eger ekrandaki klavye veya başka birşeyi zorla kapatmak istersek bu kodu yazarız
    }

}

