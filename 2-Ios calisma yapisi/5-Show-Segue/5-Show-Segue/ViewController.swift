//
//  ViewController.swift
//  5-Show-Segue
//
//  Created by Furkan on 17.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.navigationItem.hidesBackButton = true
    }

    @IBAction func goTo2(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main",bundle: nil) //Main story board uzerinde bulunan
//tasarım sayfasından geçis yapacağımızı belirtmek için main alanı degismeyecel

        let goToVc = storyBoard.instantiateViewController(withIdentifier: "sayfa2") as! ViewController2
//identifire olarak verilen viewcontroller id ile downcasting yaparak hangi View kontrolleri sahipse o sınıfa downcasting yaparız

        navigationController?.pushViewController(goToVc, animated: true)
    }
    
}

