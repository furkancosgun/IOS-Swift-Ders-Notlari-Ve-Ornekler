//
//  ViewController.swift
//  14-Navigation-uisegmented kullanimi
//
//  Created by Furkan on 19.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func segmentSwitch(_ sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex{
        case 0:
            lblText.text = "Stage 1"
            break
        case 1:
            lblText.text = "Stage 2"
            break
        default:
            print("Default")
            break
        }
        
    }
    
}

