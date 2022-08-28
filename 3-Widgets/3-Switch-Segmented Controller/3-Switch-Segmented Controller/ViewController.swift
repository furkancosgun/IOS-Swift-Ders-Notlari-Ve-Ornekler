//
//  ViewController.swift
//  3-Switch-Segmented Controller
//
//  Created by Furkan on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblSegmented: UILabel!
    @IBOutlet weak var lblSwitch: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func switchTrigger(_ sender: UISwitch) {
        if sender.isOn{ 
            lblSwitch.text = "Switch True"
        }else{
            lblSwitch.text = "Switch False"
        }
        
    }
    
    
    @IBAction func segmented(_ sender: UISegmentedControl) {
        let data = sender.selectedSegmentIndex
            lblSegmented.text = "Selected Segment \(data)"
        
    }
}

