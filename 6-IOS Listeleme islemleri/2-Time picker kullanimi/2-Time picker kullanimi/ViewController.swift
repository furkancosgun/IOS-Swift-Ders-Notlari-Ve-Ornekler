//
//  ViewController.swift
//  2-Time picker kullanimi
//
//  Created by Furkan on 22.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtFieldTime: UITextField!
    var timePicker : UIDatePicker?
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        timePicker = UIDatePicker()
        timePicker?.datePickerMode = .time
        txtFieldTime.inputView = timePicker
        timePicker?.addTarget(self, action: #selector(self.getTime(time:)), for: .valueChanged)
    }

    @objc func getTime(time:UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateFormat = "HH.mm.ss"
        let timeText = formatter.string(from: time.date)
        print(timeText)
    }

}

