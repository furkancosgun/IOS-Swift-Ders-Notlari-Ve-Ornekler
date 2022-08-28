//
//  ViewController.swift
//  3-Picker view kullanimi
//
//  Created by Furkan on 23.08.2022.
//

import UIKit

class ViewController: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource {
 
var ulkeler = ["Turkiye","Japonya","Almanya","Hollanda","Rusya"]
    
    @IBOutlet weak var lblText: UILabel!
    @IBOutlet weak var pickerView: UIPickerView!//Bu bir gorunum label gibi
    var secilenIndex  = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        //Picker veiw in veri kaynagı ayarlanır
        pickerView.delegate = self //Bu sınıfı kast ettik
        pickerView.dataSource = self
        
    }

    @IBAction func btnShow(_ sender: Any) {
        print(ulkeler[secilenIndex])
    }
    
    //Kac satır veri olacagi
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return ulkeler.count
    }
    
    //Kac kolon olcagı
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    //Veri olarak ekranda ne gosterilecegi
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return ulkeler[row] //Eger ben rertrun "furkan" dersem bu bana yukarda verdigim satır sayısı kadar furkan yazdırır
        //bizde ulkeler listesinin rowlarına denk gelen verileri yazdırıyrouz
    }
    
    //Seciln satırın(Uzerinde durdugunda ki) bilgisini bize row degerinde veirir
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        lblText.text = ulkeler[row]
        secilenIndex = row //Secilen index bilgisini bir degiskene atarak istedigmiz gibi kullanabiliriz
    }
}

