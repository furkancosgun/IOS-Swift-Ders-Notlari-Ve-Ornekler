//
//  ViewController.swift
//  4-Slider Stepper
//
//  Created by Furkan on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var lblStepper: UILabel!
    @IBOutlet weak var lblSlider: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
//Bu iki widget sadece value tutma işlemi yapar onlara verilen max ve min degerler arasındaki gecisi optimize ederler
    
    @IBAction func SliderTracker(_ sender: UISlider) {
        let data = sender.value
        lblSlider.text = "%\(data)"
    }
    @IBAction func StepperTracker(_ sender: UIStepper) {
        let data = sender.value
        lblStepper.text = "Value \(data)"
    }
}

