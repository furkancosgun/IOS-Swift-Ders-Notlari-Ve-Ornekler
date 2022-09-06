//
//  ViewController.swift
//  2-Alomefire Kullanımı
//
//  Created by Furkan on 6.09.2022.
//

import UIKit
import Alamofire//Alomefire kullanamk için file ad package denir ve alomefire git linki ile paket eklenir


class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        //select()
        //insert(Kisi_ad:"Mahmut", Kisi_tel: "05291317933")
        //update(Kisi_id: 3, Kisi_ad: "Basri", Kisi_tel: "055627876")
        //delet2db(Kisi_id: 3)
        selectLike(Kisi_ad: "f")
    }
    
    func select(){
        //ALOMEFİRE sınıfının requst methodu ile urlye get methodunda gidlir bu bize bir response doner
        AF.request("http://localhost:8888/Kisiler/tum_kisiler.php",method: .get).response{ response in
            //Eger response içindeki dataya ulaşabiliyorsak işlem başarılı demektir
            if let data = response.data{
                do{//Docatch yapsıı ile json objemize jsondecoder sınıfın decode methodu kullanılarak
                    //verdigmiz sınıf tipinden json donuşumu yaparak bize json nesnesi ile kişiler sınıfına
                    //erişim saglayabilir
                    let json = try JSONDecoder().decode(KisilerCevap.self, from: data)
                    for kisi in json.kisiler!{//kişiler cevap sınıfın kişler listesinşn uzerinde doenrek
                        print("Kisi Id:",kisi.kisi_id!)//konsola yazdırma yaparız
                        print("Kisi Ad:",kisi.kisi_ad!)
                        print("Kisi Tel:",kisi.kisi_tel!)
                    }
                }
                catch{
                    print(response.error!)
                    }
            }
        }
    }


    func insert(Kisi_ad:String,Kisi_tel:String){
        //once post methodu ile gidecek parametre degerlerini dolduruz bu dict tipinde olur
        let parameters : Parameters = ["kisi_ad":Kisi_ad,"kisi_tel":Kisi_tel]
        
        //Alomefire sınıfının yardımıyla urle post methoduyla parametre gondererek erişirz
        AF.request("http://localhost:8888/Kisiler/insert_kisiler.php", method: .post, parameters:
parameters).response{response in //Bize bu method bir cevap doner
            if let data = response.data{//Eger cevaba erşim saglayabiliyorsak urlye erişmişiz demektir
                do{//docatcah yapısıyla siteden donen degeri alırız
                    //Bu deger almak için json tipinden dict tipine donuşum saglarız
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]{
                        print(json)//Ve cevabı konsola yazdırırz
                    }
                    
                }catch{
                    print(response.error!)
                }
                
            }
        }
    }
    func update(Kisi_id:Int,Kisi_ad:String,Kisi_tel:String){
        
        //Diger işlemler gibi dict oluştrulur parameters tipinde
        let params : Parameters = ["kisi_id":Kisi_id,"kisi_ad":Kisi_ad,"kisi_tel":Kisi_tel]
        
        //post methodu ile requst atılıp parametree gonderilir
        AF.request("http://localhost:8888/Kisiler/update_kisiler.php", method: .post, parameters: params).response{ response in
            
            if let data = response.data{//Response tan dataya erişiyorsak urlye erişmişiz demektir
                do{
                    //Siteden donen datayı json a cevirirz
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]{
                        print(json)
                    }
                }catch{
                    print(response.error!)
                }
            }
        }
    }
    func delet2db(Kisi_id:Int){
        let param : Parameters = ["kisi_id":Kisi_id]
        
        AF.request("http://localhost:8888/Kisiler/delete_kisiler.php", method: .post, parameters: param).response{ response in
            if let data = response.data{
                do{
                    if let json = try JSONSerialization.jsonObject(with: data) as? [String:Any]{
                        print(json)
                    }
                }catch{
                    print(response.error!)
                }
            }
        }
    }
    
    func selectLike(Kisi_ad:String){
        
        let param : Parameters = ["kisi_ad":Kisi_ad]
        AF.request("http://localhost:8888/Kisiler/secilen_kisiler.php", method: .post, parameters: param).response{ response in
            if let data = response.data{
                do{
                    let json = try JSONDecoder().decode(KisilerCevap.self, from: data)
                        for kisi in json.kisiler!{
                            print("Kisi_id: ",kisi.kisi_id!)
                            print("Kisi_ad: ",kisi.kisi_ad!)
                            print("Kisi_tel: ",kisi.kisi_tel!)
                        }
                    
                }catch{
                    print(response.error!)
                }
            }
        }
    }
}

