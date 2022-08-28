//
//  CollectionViewCell.swift
//  11-Detaylı CollectionView
//
//  Created by Furkan on 27.08.2022.
//

import UIKit


//Hucre classı

//Protcol oluştuduk tek fonksyonlu ve indexpath degeri isteyen
protocol UICollectionViewCellButtonProtocol{
    func getClickedItem(indexPath:IndexPath)
}
class CollectionViewCell: UICollectionViewCell {
    
    //Label ve imgviewimiz
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!

    //Protocolu referans alan boş bir obje //Bu objeler viewcontroller içinden doldulur ve classta calistirilir sadece
    var cellButton : UICollectionViewCellButtonProtocol? = nil
    //Boş indexpath objesi
    var iPath : IndexPath?
    
    //Buton action
    @IBAction func btnToCart(_ sender: Any) {
        
        //Protocol objesi içinden fonksion cagrilir ve olşturulan index path degiskeni verilir
        cellButton?.getClickedItem(indexPath: iPath!)
    }
}
