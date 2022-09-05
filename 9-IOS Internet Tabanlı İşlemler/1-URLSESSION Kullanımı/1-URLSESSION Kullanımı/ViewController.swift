//
//  ViewController.swift
//  1-URLSESSION Kullanımı
//
//  Created by Furkan on 5.09.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
      
    }

    @IBAction func btnRun(_ sender: Any) {
        //insert(Kisi_ad: "Furkan", Kisi_Tel: "04321321213")
        //delete2db(Kisi_id: 5)
        //update(Kisi_ad: "Furkans", Kisi_tel: "05432109876", Kisi_id: 1)
        select()
        //likeSelect(Kisi_ad: "Fur")
    }
    
    
    func insert(Kisi_ad:String,Kisi_Tel:String){
        //Once istek oluşturulur
        var request = URLRequest(url: URL(string: "http://localhost:8888/Kisiler/insert_kisiler.php")!)
     
        //Linke hangi methodla gitcegimizi belirtiyoruz
        request.httpMethod = "POST"
        
        //Gidecek veri tipi bu şekilde yazılmadılı kolonadı=veri şeklinde
        let postData = "kisi_ad=\(Kisi_ad)&kisi_tel=\(Kisi_Tel)"
        
        //Gondercegimiz veri tipini utf-9 formatına cevirir ve requset içine ekleriz
        request.httpBody = postData.data(using: .utf8)
        
        //Daha sonra ise requesti gonderme işlemi yaparız ve donuşleri yakalarız
        URLSession.shared.dataTask(with: request){ (data,response,error) in//Bu fonk bize 3 parametre doner
                            //data bizim json objemiz response cevabimiz error eger hata alırsak gelir
            
            if error != nil || data == nil{//Eger herhangi bir hata veya json boş donerse
                print("Erorr!!!",error!)//hata mesajı verirz
                return//Ve işlemleri bititirz
            }
            
            do{//Do catch yapısı ile hata gelirse yakalarız
                
                //eger json degeri boş olursa kod hiç çalışmaz
                //requestten donen datayı json objesine cevirirerk upcasting yaparak dictionay tipine cevirirz
                if let json = try JSONSerialization.jsonObject(with: data!,options: []) as? [String:Any]{
                    print(json)//Ve erkana donen json objesini yazdırırz
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()//Request işlemini saglamlaştırır ve requesti çalıştrıır
    }
    
    func delete2db(Kisi_id:Int){
        var request = URLRequest(url: URL(string: "http://localhost:8888/Kisiler/delete_kisiler.php")!)

        request.httpMethod = "POST"
        
        let postData = "kisi_id=\(Kisi_id)"
        
        request.httpBody = postData.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            
            if data == nil || error != nil{
                print("Error",error!)
                return
            }
            
            do{
                
            
            if let json = try JSONSerialization.jsonObject(with: data!) as? [String:Any]{
                print(json)
            }
            }catch{
                print(error.localizedDescription)
            }
            
        }.resume()
    }

    func update(Kisi_ad:String,Kisi_tel:String,Kisi_id:Int){
        var request = URLRequest(url: URL(string: "http://localhost:8888/Kisiler/update_kisiler.php")!)
        
        request.httpMethod = "POST"
        
        let postData = "kisi_ad=\(Kisi_ad)&kisi_tel=\(Kisi_tel)&kisi_id=\(Kisi_id)"
        
        request.httpBody = postData.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            if data == nil || error != nil{
                print("Error",error.debugDescription)
                return
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data!) as? [String:Any]{
                    print(json)
                }
            }catch{
                print(error.localizedDescription)
            }
            
            
        }.resume()
        
    }
    
    func select(){
        let request = URLRequest(url: URL(string: "http://localhost:8888/Kisiler/tum_kisiler.php")!)
        
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            if error != nil || data == nil{
                print(error.debugDescription)
                return
            }
            do{
                if let json = try JSONSerialization.jsonObject(with: data!) as? [String:Any]{
                    //print(json)
                    
                    if let kisiler = json["kisiler"] as? [[String:Any]]{//Artık benim kisiler diye bir json arrayim var
                        
                        for kisi in kisiler{//Array içinde donerek
                            print("Kisi_id : \(kisi["kisi_id"]!)")//Sadece array içinden kisi idlerini alabilirim
                            print("Kisi_ad : \(kisi["kisi_ad"]!)")//Sadece array içinden kisi adlarını alabilirim
                            print("Kisi_tel : \(kisi["kisi_tel"]!)")//Sadece array içinden kisi tellerini alabilirim
                            //Eger benim bitane daha json nesnem olsaydı
                            /*
                             if let eş = kisi["eş"] as? [String:Any]{
                             print(eş["ad"])//şeklinde eşin adına erişim saglayabilirdim
                             }
                             
                             
                             */
                        }
                    }
                }
            }catch{
                print(error.localizedDescription)
            }
        }.resume()
    }
    
    func likeSelect(Kisi_ad:String){
        var request = URLRequest(url: URL(string: "http://localhost:8888/Kisiler/secilen_kisiler.php")!)

        request.httpMethod = "POST"
        
        let postData = "kisi_ad=\(Kisi_ad)"
        
        request.httpBody = postData.data(using: .utf8)
        
        URLSession.shared.dataTask(with: request){ (data,response,error) in
            if data == nil || error != nil{
                print(error.debugDescription)
                return
            }
            
            do{
                if let json = try JSONSerialization.jsonObject(with: data!) as? [String:Any]{
                    print(json)
                }
            }catch{
                print(error.localizedDescription)
            }
            
            
        }.resume()
    }
}

