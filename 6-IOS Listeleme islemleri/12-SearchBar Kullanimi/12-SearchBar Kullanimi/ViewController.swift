//
//  ViewController.swift
//  12-SearchBar Kullanimi
//
//  Created by Furkan on 28.08.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
       
    
        //searchbar scope başlık degisme
        searchBar.scopeButtonTitles = ["Birinci","Ikinci"]
        
        searchBar.delegate = self
    }


}
extension ViewController : UISearchBarDelegate{
    
    //Searchbara her karakter girildiginde calisir
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)//Girilen karakterler searchtext içinde bulunur
    }
    
    //Searchbarın yanındaki aktif ettigimiz cancel butonuna basılınca ne olcagi
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("Cancel clicked")
    }
    
    //Searchbarın altındaki scopebuttona basılınca ne olcagı
    func searchBar(_ searchBar: UISearchBar, selectedScopeButtonIndexDidChange selectedScope: Int) {
        if selectedScope == 0{
            print("Scope 1 Seçildi")
        }else{
            print("Scope 2 Seçildi")
        }
    }
}
