//
//  ViewController.swift
//  Muzik Calar
//
//  Created by Furkan on 10.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tblView: UITableView!
    @IBOutlet weak var searchBar: UISearchBar!
    var muzikler = [Music]()
    override func viewDidLoad() {
        super.viewDidLoad()
        getAll()
       // searchBar.delegate = self
        tblView.delegate = self
        tblView.dataSource = self
    }
    func getAll(){
        let url = URL(string: "http://localhost:8888/music/selectall.php")!
    
        URLSession.shared.dataTask(with: url, completionHandler: {data,response,error in
            if data == nil || error != nil{
                print(error.debugDescription)
                return
            }
            do {
                let json = try JSONDecoder().decode(MusicCevap.self, from: data!)
                
                if let musics  = json.Music{
                    self.muzikler = musics
                }
                DispatchQueue.main.async {
                    self.tblView.reloadData()
                }
                
            } catch  {
                print(error.localizedDescription)
            }
          
            
        }).resume()
    }

   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "go2player"{
            let music = sender as! Music
            let player = segue.destination as! ViewControllerPlayer
            player.music = music
            
        }
   }
    
}
    
    
extension ViewController:UITableViewDelegate,UITableViewDataSource{
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return muzikler.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = muzikler[indexPath.row].music_ad
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "go2player", sender: muzikler[indexPath.row])
    }
  
}

extension ViewController:UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        print(searchText)
    }
}
