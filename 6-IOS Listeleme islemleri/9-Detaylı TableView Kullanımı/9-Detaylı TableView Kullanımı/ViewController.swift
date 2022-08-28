//
//  ViewController.swift
//  9-Detaylı TableView Kullanımı
//
//  Created by Furkan on 25.08.2022.
//

import UIKit

class ViewController: UIViewController {

    //Table Outlet olarak eklenir
    @IBOutlet weak var tableView: UITableView!
    //boş bir product classı kullanarak bir liste oluşturulur
    var products = [Product]()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Tableviewın data sorcu ve delegatei bu sınıf denir
        tableView.dataSource = self
        tableView.delegate = self
        
        //Prodductlar oluşturulur
        let p1 = Product(UrunAd: "Kebap", UrunFiyat: 45, UrunImg: UIImage(named: "kebap")!)
        let p2 = Product(UrunAd: "Ayran", UrunFiyat: 3, UrunImg:UIImage(named: "ayran")!)
        let p3 = Product(UrunAd: "Kola", UrunFiyat: 8, UrunImg:UIImage(named: "kola")!)
        let p4 = Product(UrunAd: "Pide", UrunFiyat: 28, UrunImg:UIImage(named: "pide")!)
        
        //Ve listyee eklenir
        products = [p1,p2,p3,p4]
        
    }
    
    
    

}

//Extension kullanıalrak datasource ve delegate doldurulur ayrıca button tıklama işleminin interfacei de implement edilir
extension ViewController:UITableViewDelegate,UITableViewDataSource,UITableViewClickProtocol{
    
    //Button tıkla interfaci bize bir index gonderirdi biz de o indexki kullanarak konsola bi yazı yazdırırz
    func clickMehtod(indexPath: IndexPath) {
        print("\(String(describing: products[indexPath.row].urunAd!)) Adlı Urun Sipariş Edilmiştir")
    }
    
    //Bolum sayısı
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //SAtır sayısı product listesi uzunulugu kadar olcak deriz
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return products.count
    }
    
    //Hucre işlemleri kısmı
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Hucre oluşturulur her zamanki gibi ve bizim storyboard uzerindeki id verilir
        //oluşan hucre casting işlemi ile bizim tablehucreleri için oluşturdugumuz hucre sınıfını tipine donuşur
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        
        //hucre sınıfında ki parametreler ve degişkenler bu func yardımıyla doldurulıur
        cell.indexP = indexPath
        cell.clickProtocol = self
        
        //listedeki verilerimizde tableviewda gozuksun diye onları de ekleri
        cell.imgView.image = products[indexPath.row].urunImg!
        cell.lblPrice.text = " \(String(describing: products[indexPath.row].urunFiyat!)) ₺"
        cell.lblTitle.text =  products[indexPath.row].urunAd!
        
        //En sonda ise hucreyi return ederiz
        return cell
    }
}
