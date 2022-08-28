//
//  TableViewCell.swift
//  9-Detaylı TableView Kullanımı
//
//  Created by Furkan on 25.08.2022.
//

import UIKit

//Button işlevi için protocol
protocol UITableViewClickProtocol{
    func clickMehtod(indexPath:IndexPath)
}

class TableViewCell: UITableViewCell {

    //Urun katalogu için urun ad fiyat ve reism istedik ve bu alan ile de doldurma işlemi yapacagız sayfalar arası geciste doldurma işlemi yapdıgı gibi
    @IBOutlet weak var lblPrice: UILabel!
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var imgView: UIImageView!
    var clickProtocol : UITableViewClickProtocol?
    var indexP : IndexPath? 
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    //Buttona tıklanırsa
    @IBAction func btnOrder(_ sender: Any) {
        clickProtocol?.clickMehtod(indexPath: indexP!)//Protocol fonksyonu çalışır
    }
    
}
