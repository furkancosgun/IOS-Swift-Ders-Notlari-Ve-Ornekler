//
//  ViewController.swift
//  10-CollectionView Kullanimi
//
//  Created by Furkan on 26.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var sehirler = ["Adana","Adıyaman", "Afyon", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin",
                   "Aydın", "Balıkesir","Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale",
                   "Çankırı", "Çorum","Denizli","Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum ", "Eskişehir",
                   "Gaziantep", "Giresun","Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir",
                   "Kars", "Kastamonu", "Kayseri","Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya ", "Malatya",
                   "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya",
                   "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon  ", "Tunceli", "Şanlıurfa", "Uşak",
                   "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt ", "Karaman", "Kırıkkale", "Batman", "Şırnak",
                   "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük ", "Kilis", "Osmaniye ", "Düzce"]
    override func viewDidLoad() {
        super.viewDidLoad()
        //Tasarım işlemleri için nesne oluşturduk
        let design = UICollectionViewFlowLayout()
        
        //Ekrana orantılı işlemler yapmak için collection viewin genişligini aldık
        let width = self.collectionView.frame.width
        
        //Ekranın koşelerinden boşluk vermek //Her koşeden 10ar px boşluk verdik
        design.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        //Hucrelerin genişligini belirlemek
        //Genişlik ve uzunlukları ekran alanının genişlgiinin 30 eksisinin 3 bolusu
        //30 eksi bize hucre ve koşe alanların boşlugundan dolayı gelir
        //3 ise bir satırda 3 hucre gormek istedigmiz için verdik
        //Boyutunuda aynı şekilde yaptık
        design.itemSize = CGSize(width: (width - 30) / 3, height:  (width - 30) / 3)
        //          ____
        //          |  |
        //          |--|
        //          |__|
        //Hucreler arasındak yatay boşlguu belirleme Yani |
        design.minimumInteritemSpacing = 5 //Her hucre arası için 5 verdik
        
        //Hucrelerin altındaki ve ustundeki boşluk alanı dikey boşluk alanı belirleme  -
        design.minimumLineSpacing = 5
        
        //Yapılan tasarımı collectionviewa verme
        collectionView.collectionViewLayout = design
        collectionView.dataSource = self
        collectionView.delegate = self
    }


}
extension ViewController:UICollectionViewDelegate,UICollectionViewDataSource{
   //Bolum sayısı
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    //Item sayısı
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sehirler.count
    }
    
    //Hucre işlemleri
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CollectionViewCell
        
        cell.lblText.text = sehirler[indexPath.row]
        
        
        //Border color ve width
        cell.layer.borderColor = UIColor.black.cgColor
        cell.layer.borderWidth = 5
        return cell
    }
    
    //Hucre secilirse
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        print(sehirler[indexPath.row])
    }
}

