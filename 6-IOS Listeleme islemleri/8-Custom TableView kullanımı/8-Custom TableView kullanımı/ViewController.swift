//
//  ViewController.swift
//  8-Custom TableView kullanımı
//
//  Created by Furkan on 25.08.2022.
//

import UIKit

class ViewController: UIViewController {
    
    var Kisiler = [Persons]()
 
    @IBOutlet weak var tblView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
        
        let per1 = Persons(Id: 1, Ad: "Furkan", Tel: "05412130000")
        let per2 = Persons(Id: 2, Ad: "Gizem", Tel: "05123279423")
        let per3 = Persons(Id: 3, Ad: "Hasan", Tel: "05465742424")
        let per4 = Persons(Id: 4, Ad: "Mehmet", Tel: "0526816346")
        
        Kisiler = [per1,per2,per3,per4]
    }


}

//Normal sınıfları implement ettigimiz gibi buton sınıfı için yazdıgımız interfacei de implement ederiz
extension ViewController:UITableViewDelegate,UITableViewDataSource,UITableViewClickProtocol{

    //Implement edilen protoclun fonksyonu zorunlu olarak eklenir içinin doldurulması gerekmektedir
    func clickFunc(indexPath: IndexPath) {
        //Butona tıkalnınca ne olcagı
        print("Button tıklanı Tıklanan Satır: \(indexPath.row) Buttonu")
    }
    
    //Satir sayisi
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Kisiler.count
    }
    
    //Bolum sayisi
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Hucre islemleri
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        //Herxamanki gibi hucreye erişilir ama bu sefer casting işlemi uygulanır ve oluşturdugumuz table view cell sınıfını referans alırız o sınıfta oluşturdugumuz labellara erişerek metinler yazdırırız
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.lblId.text = "\(Kisiler[indexPath.row].id!)"
        cell.lblAd.text = Kisiler[indexPath.row].ad
        cell.lblTel.text = Kisiler[indexPath.row].tel
        
        //Button işlemlerinin sorunsuz olabilmesi için
        cell.TableViewClickProtocol = self//Protocol adresini diger sayfadan burayı gostermemiz gerekir
        cell.iPath = indexPath//Indexpath istegimizi bu fonksyondan karşılıyoruz
        return cell//Ve her hucreye button ekleme işlemimiz tamamlanıyor
    }
    
    //Satır secilirse
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(Kisiler[indexPath.row].id!,"idli kolon secildi")
    }
}

