//
//  ViewController.swift
//  5-Timer kullanimi
//
//  Created by Furkan on 3.09.2022.
//

import UIKit

class ViewController: UIViewController {

    var timer = Timer()
    var time = 0
    @IBOutlet weak var lblText: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func btnStart(_ sender: Any) {
        //Timer degiskenine timer sınıfın methodunu kullanarak her saniyede setLabel fonksyonunu çalıştır dedik
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(setLabel), userInfo: nil, repeats: true)
    }
    
    @objc func setLabel(){
        lblText.text = "Time: \(time)"
        time += 1
        // timer.invalidate() // Timer kullanımı sona erdirebiliriz
        
    }
    
}

