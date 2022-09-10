//
//  ViewController.swift
//  Sozluk App Tasarim
//
//  Created by Furkan on 31.08.2022.
//

import UIKit

class ViewController: UIViewController {

    
    
    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    
    var sozluk = [Sozluk]()//Tablview için sozluk tipinde liste
    override func viewDidLoad() {
        super.viewDidLoad()
        getAll()
        searchBar.delegate = self
        tblView.delegate = self
        tblView.dataSource = self
    
    }
   
    
    func getAll(){
        
        //Request oluştur
        let url = URL(string: "http://localhost:8888/sozluk/selectall.php")!
       
        URLSession.shared.dataTask(with: url, completionHandler: { data,response,error in
            if error != nil || data == nil{
                print(error.debugDescription)
                return
            }
            
            do {
                
                let json = try JSONDecoder().decode(SozlukCevap.self, from: data!)
                   
                if let kelimeList = json.sozluk{
                    self.sozluk = kelimeList
                    print(kelimeList.count)
                }
                
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
                

                
            } catch  {
                print(error.localizedDescription)
            }        }).resume()
        
    }
    
    func getLike(Kelime:String){
        
        var request = URLRequest(url: URL(string: "http://localhost:8888/sozluk/search.php")!)
        
        let params = "kelime_tr=\(Kelime)"
        request.httpMethod = "POST"
        
        request.httpBody = params.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request, completionHandler: { (data,response,error) in
            if data == nil || error != nil{
                print("ERROR",error.debugDescription)
                return
            }
        
            do{
                 let json = try JSONDecoder().decode(SozlukCevap.self, from: data!)
                if let kelimeler = json.sozluk{
                    self.sozluk = kelimeler
                }
                    
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
            }catch{
            print(error.localizedDescription)
              

        }
            
        }).resume()
        
        
    }

}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    //Bolum sayısı
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    //Tableview satır sayısı
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sozluk.count//liste uzunlugum kadar dedim
    }
    
    //Hucre işlemleri
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! TableViewCell
        cell.lblEnglish.text = sozluk[indexPath.row].kelime_en//liste içindeki ingilicze kelime
        cell.lblTurkish.text = sozluk[indexPath.row].kelime_tr//liste içindeki turkce kelime
        
        return cell
    }
}

extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        sozluk.removeAll()//Sozluk listemiz tamamen temizlenir
        if searchText == ""{//Searchbar boş ise
            getAll()//Butun verileri al
        }else{//Degilse
            getLike(Kelime: searchText)//Sadce secilen kelimeye gore sorgu atılır urlye
        }
       
        print(searchText)
    }
              
}
