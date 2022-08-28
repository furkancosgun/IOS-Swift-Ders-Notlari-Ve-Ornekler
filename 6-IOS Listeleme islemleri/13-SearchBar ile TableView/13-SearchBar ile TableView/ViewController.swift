//
//  ViewController.swift
//  13-SearchBar ile TableView
//
//  Created by Furkan on 28.08.2022.
//

import UIKit

class ViewController: UIViewController {

    //Searchbar ve tableview outlet olarak eklenir
    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    //IsSearch degeri başta false olur
    var isSearch = false
    
    //Butun degerlerimiz
    let provinces = ["Adana","Adıyaman", "Afyon", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin",
                 "Aydın", "Balıkesir","Bilecik", "Bingöl", "Bitlis", "Bolu", "Burdur", "Bursa", "Çanakkale",
                 "Çankırı", "Çorum","Denizli","Diyarbakır", "Edirne", "Elazığ", "Erzincan", "Erzurum ", "Eskişehir",
                 "Gaziantep", "Giresun","Gümüşhane", "Hakkari", "Hatay", "Isparta", "Mersin", "İstanbul", "İzmir",
                 "Kars", "Kastamonu", "Kayseri","Kırklareli", "Kırşehir", "Kocaeli", "Konya", "Kütahya ", "Malatya",
                 "Manisa", "Kahramanmaraş", "Mardin", "Muğla", "Muş", "Nevşehir", "Niğde", "Ordu", "Rize", "Sakarya",
                 "Samsun", "Siirt", "Sinop", "Sivas", "Tekirdağ", "Tokat", "Trabzon  ", "Tunceli", "Şanlıurfa", "Uşak",
                 "Van", "Yozgat", "Zonguldak", "Aksaray", "Bayburt ", "Karaman", "Kırıkkale", "Batman", "Şırnak",
                 "Bartın", "Ardahan", "Iğdır", "Yalova", "Karabük ", "Kilis", "Osmaniye ", "Düzce"]
    
    //Bulunan veiyi atcagımız liste
    var searchedData = [String]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Delegate ve datasoucre bu sınıfta diyoryz
        searchBar.delegate = self
        tableView.dataSource = self
        tableView.delegate = self
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    
    //Bolum sayısı
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Satir sayısı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if isSearch {
            return searchedData.count
        }else{
            return provinces.count
        }
    }
    
    //Hucre işlemleri
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        
        if isSearch{
            cell.textLabel?.text = searchedData[indexPath.row]
        }else{
            cell.textLabel?.text = provinces[indexPath.row]
        }
        
        return cell
    }
}

extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty{
            isSearch = false
        }else{
            isSearch = true
            searchedData = provinces.filter({$0.lowercased().contains(searchText.lowercased())})
            print(searchedData)
        }
        tableView.reloadData()
    }
}

