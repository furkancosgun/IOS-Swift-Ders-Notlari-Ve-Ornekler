//
//  ViewController.swift
//  KisilerUygulamaTasarimi
//
//  Created by Furkan on 30.08.2022.
//

import UIKit
import CoreData

let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {
    

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tblView: UITableView!
    
    var kisiList = [Kisiler]()
    let context = appDelegate.persistentContainer.viewContext
    override func viewDidLoad() {
        super.viewDidLoad()
        tblView.dataSource = self
        tblView.delegate = self
        searchBar.delegate = self
        ReadDB()
    }
    override func viewWillAppear(_ animated: Bool) {
        ReadDB()
        tblView.reloadData()
    }
  
    func ReadDB(){
        do {
            //Do catch yapısı ile kisi listemize context yani tablo içinden kişileri alcagımızı soyledik
            kisiList =  try context.fetch(Kisiler.fetchRequest())
        } catch {
            print("ERROR")
        }
    }
    
    func DeleteData(index:Int){
            //Kisilerimiz bir listede tutuldugu için  index numarası belirterek
            let kisi  = kisiList[index]
            //O kisiyi silebiliriz
            context.delete(kisi)
            //Daha sonra tabloyu kayıt ederiz silinmiş şekli ile
            appDelegate.saveContext()
            
            ReadDB()
            tblView.reloadData()
    }
    
    func UpdateData(kisi:Kisiler){
        performSegue(withIdentifier: "goUpdate", sender: kisi)
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let kisi = sender as? Kisiler{
            if segue.identifier == "goUpdate" {
                let screenUpdate = segue.destination as! ViewControllerUpdate
                screenUpdate.kisi = kisi
            }
        }
        
    }
}

extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return kisiList.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = kisiList[indexPath.row].kisi_ad
        return cell
    }
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
          
          //Delete Action
          let deleteAction = UIContextualAction(style: .destructive, title: "Delete"){
              (contexttualAction,view,boolValue) in
              self.DeleteData(index: indexPath.row)
          }
          
          //Update Action
          let updateAction = UIContextualAction(style: .normal, title: "Update"){
              (contexttualAction,view,boolValue) in
              self.UpdateData(kisi: self.kisiList[indexPath.row])
              self.tblView.reloadData()
          }
          
          return UISwipeActionsConfiguration(actions: [deleteAction,updateAction])
      }
}

extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
   
        if searchText.isEmpty{
            self.ReadDB()
        }else{
            //Bu kısım liste tarzında çalışır ve herseferinde liste içerigini azaltır
            //Yanlış yazdıgınızda search texti temizlemeniz gerkmektedir
            kisiList = kisiList.filter({$0.kisi_ad!.lowercased().contains(searchText.lowercased())})
            
            
            /* Bu kısım ise Core data kullanır search text ve db içindeki text aynı olmadan listeleme yapmaz
            Tercihe gore kullanılabilir ben yukarıyı daha hoş buldum
               let fetchReq : NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
           fetchReq.predicate = NSPredicate(format: "kisi_yas == %@",searchText)
               do {
                   kisiList = try context.fetch(fetchReq)
               } catch  {
                   print("Err")
               }
          */
        }
        self.tblView.reloadData()
    }
}
