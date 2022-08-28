//
//  ViewController.swift
//  Alert Verme
//
//  Created by Furkan on 21.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnBasitAlert(_ sender: Any) {
        //Alert Dialog created title and message with style
        let alertController = UIAlertController(title: "Title", message: "Message", preferredStyle: .alert)
        
        //for alert created buttons
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: {_ in
          print("Cancel Clicked")
        })
        
        //adding for alert dialog
        alertController.addAction(cancelButton)
        
        let okButton = UIAlertAction(title: "Ok", style: .destructive, handler: {_ in
            print("Ok Button Clicked")
        })
        
        alertController.addAction(okButton)
        
        //ALert dialog called with  present like screen call
        self.present(alertController, animated: true)
    }
    
    @IBAction func btnOzelAlert(_ sender: Any) {
        //Alert oluşturduk bi sıkıntı yok burda
        let alertController = UIAlertController(title: "Girs yap", message: "Kullanıc adınızı ve şifrenizi giriniz", preferredStyle: .alert)
        
        //Butoan tıklanıldıgında
        let signButton = UIAlertAction(title: "Sign in ", style: .destructive, handler: {_ in
           //Bir degisken icine alertcontroller icinde textfild diye bir nesnem var diyorum ve ben bunu 0 . indexteki nesnesine erişmek isteiyorum onu da unwraping yaparak kendisini bir uitextfield objesi olarak kabul etsin ki o nesme uzerinden işlemler yapalım diyorum
            let txtName = alertController.textFields![0] as UITextField
            let txtPass = alertController.textFields![1] as UITextField
            
            //Daha sonra unwrapping işlemi yapınca normal bir textfield kullanır gibi kullanbailirz
            print("UserName:\t \(txtName.text ?? "") \nPassword:\t \(txtPass.text ?? "")")
            
            //Bu sınıfın lbltextine yazdır
            self.lblText.text = "UserName:\t \(txtName.text ?? "") \nPassword:\t \(txtPass.text ?? "")"
        })
        
        alertController.addAction(signButton)
        
        //textfield yapısı addtextfield methodunu yazdıtkan sonra in yapısının onundeki degerin icinde tutulur
        alertController.addTextField{ txtField in
            //Ve biz bunu istege gore ozelleştirebiliriz
            txtField.placeholder = "User Name"
            txtField.keyboardType = .emailAddress
        }
        
        alertController.addTextField{ txtField in
            txtField.placeholder = "Password"
            txtField.isSecureTextEntry = true
        }
        
        self.present(alertController, animated: true)
        
        
    }
    @IBAction func btnActionSheet(_ sender: Any) {
        //Button action sheet daha cok bottomsheet gibi calışır daha cok uyarı için degilde tavsişye vs için kullanılabilir
        let aletController = UIAlertController(title: "Action Sheet", message: "Lorem ipsum bla bla", preferredStyle: .actionSheet)
        
        let cancelButton = UIAlertAction(title: "Cancel", style: .cancel, handler: { _ in
            print("Cancel button clicked")
        })
        
        aletController.addAction(cancelButton)
        
        self.present(aletController, animated: true)
    }
}

