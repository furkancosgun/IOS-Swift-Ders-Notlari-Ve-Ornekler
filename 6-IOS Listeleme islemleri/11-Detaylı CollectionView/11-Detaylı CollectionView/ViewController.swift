//
//  ViewController.swift
//  11-Detaylı CollectionView
//
//  Created by Furkan on 27.08.2022.
//

import UIKit

class ViewController: UIViewController, UICollectionViewCellButtonProtocol {
    
    //tasarımı Yaplımış collection view eklenir
    @IBOutlet weak var collectionView: UICollectionView!

    //Moives classından boş bir liste açılır
    var Filmler = [Movies]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Movies classsından filmler uretilir
        let m1 = Movies(Id: 1, Title: "The Pianist", Price: 13.5, Img: UIImage(named: "thepianist")!)
        let m2 = Movies(Id: 2, Title: "Bir Zamanlar Anadolu", Price: 11.2, Img: UIImage(named: "anadolu")!)
        let m3 = Movies(Id: 3, Title: "Django", Price: 17.8, Img: UIImage(named: "django")!)
        let m4 = Movies(Id: 4, Title: "Inception", Price: 26.2, Img: UIImage(named: "inception")!)
        let m5 = Movies(Id: 5, Title: "Interstellar", Price: 21.0, Img: UIImage(named: "interstellar")!)
        let m6 = Movies(Id: 6, Title: "The Hateful Eight", Price: 8.9, Img: UIImage(named: "thehate")!)
        
        //Ve liste doldurlur
        Filmler = [m1,m2,m3,m4,m5,m6]
        
        //Tasarım işlemleri için obje oluşturulur
        let design = UICollectionViewFlowLayout()
        
        //collection view boyutu alınır
        let Width = self.collectionView.frame.width
        
        //Section inset her koşeden boşluk verilir
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        //Itemsize ile de hucrenin boyutu ayarlanır
        design.itemSize = CGSize(width: (Width - 30)/2, height: (Width - 30))
        
        //Hucrelerin biribirlerine olan alt ve ust boşlugu
        design.minimumLineSpacing = 10
        
        //Hucreelerin yan yana olan boşlugu
        design.minimumInteritemSpacing = 10
        
        //Collectionview içine layoutu için tasarım objemiz eklenir
        collectionView.collectionViewLayout = design
        
        collectionView.delegate = self
        collectionView.dataSource = self
    }


}

extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
    
    //Bolum sayısı
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //Hucre sayısı
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Filmler.count
    }
    
    //Hucre işlemleri
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //Hucre değişkeni oluşturulur ve bizim storyboard uzerinden sectigimiz id ile eşleşir
        //Ama biizm hucreler için oluşturdugumuz class ile casting işlemi olur
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        //Hucre içindeki başlık labelı
        cell.lblTitle.text = Filmler[indexPath.row].title
        
        //Hucre içindeki fiyat labeli
        cell.lblPrice.text = String(Filmler[indexPath.row].price!)
        
        //Hucre içindeki imgView
        cell.imgView.image =  Filmler[indexPath.row].img
        
        //Hucrenin kenarlık kalınlıgı
        cell.layer.borderWidth = 1
        
        //Hucrenin kenarlık rengi
        cell.layer.borderColor = UIColor.gray.cgColor
        
        //Hucre sınıfı içindeki protocolu bu kısımda işleme alacgımız için bu sınıf(self) diyerek gosteririz
        cell.cellButton = self
        
        //Hucre sınıfı için hangi hucreye tıklandıgı bilgisini almak için indexpath objemizi gonderirirz
        cell.iPath = indexPath
        
        //Hucre return edilrir
        return cell
    }
    
    //Hucre içindeki butona tıklama işlemleri
    //Bu fonk bizim hucreişlemleri için oluşturdugumuz classın protocolu içindeki fonksyondur
    //Bizden indexpath parametresi ister bu ksıımda fonksyon doldurulur hucre classında çalıştırılır
    func getClickedItem(indexPath: IndexPath) {
        print("\(String(describing: Filmler[indexPath.row].title!)) Adlı film Sepete Eklenmiştir")
    }
}

