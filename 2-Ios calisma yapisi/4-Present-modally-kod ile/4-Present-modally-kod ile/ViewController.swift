//
//  ViewController.swift
//  4-Present-modally-kod ile
//
//  Created by Furkan on 17.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func goto2(_ sender: Any) {
        let storyBoard = UIStoryboard(name: "Main",bundle: nil)
        let goToVc = storyBoard.instantiateViewController(withIdentifier: "screen2") as! screen2VC
        self.present(goToVc, animated: true,completion: nil)
    }
    
}

