//
//  ViewController.swift
//  3-UserDef Login
//
//  Created by Furkan on 28.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtPass: UITextField!
    @IBOutlet weak var txtUser: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        let user = UserDefaults.standard
        
        if "admin" == user.string(forKey: "username") && "admin" == user.string(forKey: "pass"){
            performSegue(withIdentifier: "goToMain", sender: nil)
        }
    }
    

    @IBAction func btnLogin(_ sender: Any) {
        if  txtPass.text == "admin" && txtUser.text == "admin"{
            let user = UserDefaults.standard
            user.set("admin", forKey: "username")
            user.set("admin", forKey: "pass")
            performSegue(withIdentifier: "goToMain", sender: nil)
        }
    }
    

}
