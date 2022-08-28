//
//  ViewController.swift
//  7-Cok bolumlu TableView
//
//  Created by Furkan on 25.08.2022.
//

import UIKit

class ViewController: UIViewController {

    var sections=["Mevsimler","Renkler","Gunler"]
    var data=[["Yaz","Kış","Ilkbahar","Sonbahar"],["Mavi","Yeşil","Kırmızı"],["Pazartesi","Sali","Carşamba"]]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }


}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    //Bolumlere başlık ekleme
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        //Bolumler listesinden sectin degerini vererek satır satrı başlık eklemesi yapar
        return sections[section]
    }
    
    //Hucrede ne olcagi
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Oluşturdugumuz hucreyi koda baglariz
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        //hucrenin metnine = veri listemizden bolum bolum ayrıdıgımız verileri once bolumlere sonra satırlara gore yazdırma yaparız
        cell.textLabel?.text = data[indexPath.section][indexPath.row]
        return cell
    }
    
    //Bolum sayısı
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count//Direk bolum sayımızı return ettik yani 3
    }
    
    //Bolumlerin satır sayısı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data[section].count//Satır sayımızı donmek için once bolumlere eriştik daha sonra bolumler içinden her bolumde kac satır varsa ona gore retrun işlemi yaptık
    }
    
    //Herhangi bir secim yapılırsa ne olcagı
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(data[indexPath.section][indexPath.row])//Satıra tıklandıgında ilk once Hangi bolume daha sonra ise hangı satıra oldugu verisini aldık
    }
}

