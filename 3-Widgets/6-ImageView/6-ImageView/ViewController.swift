//
//  ViewController.swift
//  6-ImageView
//
//  Created by Furkan on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var imgView: UIImageView!//image viewi outlet olarak koda tnaıtırız
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func SegmentedController(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{//segmented controller index ile resme gore şart kosariz
            imgView.image = UIImage(named: "apple")
            //imgViewin imagıni uiimage ile atarız
        }else{
            imgView.image = UIImage(named: "apple2")
        }
        
    }
    
}

