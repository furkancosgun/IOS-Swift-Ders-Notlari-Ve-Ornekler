//
//  ViewController.swift
//  ASCII CONVERTER
//
//  Created by Furkan on 21.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var doButton: UIButton!
    @IBOutlet weak var lblEncodedDecoded: UILabel!
    @IBOutlet weak var txtArea: UITextView!
    @IBOutlet weak var txtField: UITextField!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var segment: UISegmentedControl!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

   
    @IBAction func segmentedController(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0 {
            lblTitle.text = "ASCII ENCODER"
            lblEncodedDecoded.text = "Encoded Text"
            doButton.setTitle("DO ENCODE", for: .normal)
            txtArea.text = ""
            txtField.text = ""
        }else{
            lblTitle.text = "ASCII DECODER"
            lblEncodedDecoded.text = "Decoded Text"
            doButton.setTitle("DO DECODE", for: .normal)
            txtArea.text = ""
            txtField.text = ""
        }
    }
    
    @IBAction func doController(_ sender: Any) {
        if segment.selectedSegmentIndex == 0{
            var encodedtext = ""
           
            if let data = txtField.text {
                let text = data.asciiValues
                for i in text{
                    encodedtext += " " + String(i)
                }
                txtArea.text = encodedtext
            }
        }else{
            var decodedText = ""
            if let data = txtField.text {
                let words:[String] =  data.components(separatedBy: " ")
                print(words)
                for word in words{
                    if let num = UInt8(word){
                        let c = Character(UnicodeScalar(num))
                        decodedText += String(c)
                    }
                }
                txtArea.text = decodedText
            }
        }
    }
   
}
extension StringProtocol {
    var asciiValues: [UInt8] { compactMap(\.asciiValue) }
}

