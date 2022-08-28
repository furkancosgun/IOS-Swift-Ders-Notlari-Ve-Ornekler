//
//  ViewController.swift
//  5-TableView Basit kullanımı
//
//  Created by Furkan on 24.08.2022.
//

import UIKit


class ViewController: UIViewController {

    var sehirler = ["Adana","Adıyaman", "Afyon", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin",
                   "Aydın", "Balıkesir","Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale",
                   "Çankırı", "Çorum","Denizli","Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum ", "Eskişehir",
                   "Gaziantep", "Giresun","Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir",
                   "Kars", "Kastamonu", "Kayseri","Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya ", "Malatya",
                   "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya",
                   "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon  ", "Tunceli", "Şanlıurfa", "Uşak",
                   "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt ", "Karaman", "Kırıkkale", "Batman", "Şırnak",
                   "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük ", "Kilis", "Osmaniye ", "Düzce"]
    @IBOutlet weak var tableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.delegate = self
    }

  
    
}


//Moduler yapı için viewcontroller sınıfına extensions uygulandı
//Extension yapısı aynı sınıfta olmalıdır
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    //Kolon sayısı
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Kac satir veri olcak
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sehirler.count
    }
    
    //Yazılacak hucre //Satır sayısı kadar çalışır oluştrudugumuz hucrenin içini doldurmak için kullanılır
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //Satır oluştruduk burdaki tvCell bizim tableview içinbdeki oluştrudugumuz hucrenin idsi id verilemsi şarttır
        //indexpath ise bize hangi satırda oldugumzuu verir yani o an ki satır numaramız
        let cell = tableView.dequeueReusableCell(withIdentifier: "tvCell", for: indexPath)
        
        cell.textLabel?.text = String(indexPath.row + 1) + "." + sehirler[indexPath.row] //cell uzerine her seferinde ulkler listesinden veri yazarız
        
        return cell //Bizden uıtableviewcell donmemizi istedi bizde donduk
    }
    
    //Herhangi bir satır secildiginde ne olcagı
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print(sehirler[indexPath.row])
    }

    //Hucrelere Action  verme //Sağa sola kaydırma ile
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        //Delete Action
        let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
            (contexttualAction,view,boolValue) in
            
            self.sehirler.remove(at: indexPath.row)//Will deleted to sehirler list in selected row
            tableView.reloadData()//Table View Refresh
        }
        
        //Print Action
        let printAction = UIContextualAction(style: .normal, title: "Print"){
            (contexttualAction,view,boolValue) in
            print(self.sehirler[indexPath.row])
            
        }
        
        return UISwipeActionsConfiguration(actions: [deleteAction,printAction])
    }
}
