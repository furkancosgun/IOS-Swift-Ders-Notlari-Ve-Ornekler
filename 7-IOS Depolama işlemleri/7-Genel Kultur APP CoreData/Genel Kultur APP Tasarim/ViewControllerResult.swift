//
//  ViewControllerResult.swift
//  Genel Kultur APP Tasarim
//
//  Created by Furkan on 31.08.2022.
//

import UIKit

class ViewControllerResult: UIViewController {

    var trueData = 0
    @IBOutlet weak var lblResultPercentage: UILabel!
    @IBOutlet weak var lblResult: UILabel!
    var percentage : Int?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationItem.hidesBackButton = true
        lblResult.text = "Dogru Sayisi: \(trueData)"
        lblResultPercentage.text = "Başarı oranı: %\(percentage!)"
    }
    
    @IBAction func btnRestart(_ sender: Any) {
        navigationController?.popToRootViewController(animated: true)//ilk sayfaya doner
    }
    
    
    

}
