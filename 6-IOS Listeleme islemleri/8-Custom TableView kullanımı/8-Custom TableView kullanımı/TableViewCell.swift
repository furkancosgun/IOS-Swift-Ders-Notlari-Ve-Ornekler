//
//  TableViewCell.swift
//  8-Custom TableView kullanımı
//
//  Created by Furkan on 25.08.2022.
//

import UIKit

//Butona tıklayınca işlem yapmak için bi protocol(Interface) Oluşturumamzı gerekir
protocol UITableViewClickProtocol{//protoclu oluşturduk ve buna bir fonksyon yazdık
    func clickFunc(indexPath:IndexPath)//Fonksyon parametre istemekte indexpath turunde bunu hangi satırda basıldıgını bulmak için istedik
}

class TableViewCell: UITableViewCell {

    @IBOutlet weak var lblTel: UILabel!
    @IBOutlet weak var lblAd: UILabel!
    @IBOutlet weak var lblId: UILabel!
    
    //Boş proctocol ve indexpath yarattık
    var TableViewClickProtocol : UITableViewClickProtocol?
    var iPath : IndexPath?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    //Butonun actionu
    @IBAction func btnYazdir(_ sender: Any) {
        //Tıklanınca protocolun içindeki fonksyon tetiklenecek bunu da viewcontroller sınıfından yapıyoruz
        TableViewClickProtocol?.clickFunc(indexPath: iPath!)//Protocl içindeki fonksyonu calistirdik
    }
}
