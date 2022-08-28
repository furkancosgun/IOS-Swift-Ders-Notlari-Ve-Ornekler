//
//  ViewController.swift
//  Artir-Azalt
//
//  Created by Furkan on 21.08.2022.
//

import UIKit

class ViewController: UIViewController {
    var data : Int? = nil
    var pred : Int?
    @IBOutlet weak var lblState: UILabel!
    @IBOutlet weak var lblPredSize: UILabel!
    @IBOutlet weak var txtField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        // Do any additional setup after loading the view.
        data = Int.random(in: 1...1000)
        print(data!)
        pred = 10
    }
    @IBAction func btnPredict(_ sender: Any) {
        let predrict = Int(txtField.text!) ?? 0
        if pred! > 1{
            if predrict < data!{
                lblState.text = "Daha Yuksek Tahmin Et \n  Tahminin: \(predrict)"
            }else if predrict > data!{
                lblState.text = "Daha Düşük Tahmin Et  \n  Tahminin: \(predrict)"
            }else{
                performSegue(withIdentifier: "goToState", sender: [data,predrict])
            }
            pred! -= 1
            lblPredSize.text = "Tahmin Hakkın: \(pred!)"
        }else{
            performSegue(withIdentifier: "goToState", sender: [data,predrict])
        }
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let data = sender as? [Int]{
            if segue.identifier == "goToState"{
                let screen2 = segue.destination as? ViewController2
                screen2?.value = data[0]
                screen2?.predrict = data[1]
            }
        }
    }
}

