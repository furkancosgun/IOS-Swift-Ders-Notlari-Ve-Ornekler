//
//  ViewController.swift
//  3-Firebase kullanımı
//
//  Created by Furkan on 8.09.2022.
//

import UIKit
import Firebase

//Firebase database kurulum adımları firebase sitesinde yazmaktadır
class ViewController: UIViewController {


    var ref : DatabaseReference?
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //firebasede realtime databasei referans alır
        ref = Database.database().reference()//oraya baglanır gibi duşunebilirz
        //delete2DB()
        //update2DB()
        select2DB()
    }

    func save2DB() {
        //girilen degerler ile kisi objesi oluştruulur
        let person = Kisiler(Kisi_ad: "Furkan", Kisi_tel: "0572873138")
        
        //Kişi objesi dict tipine cevrilir kayı işlemleri obje tipi ile olmuyor ios ta
        let dict : [String:Any] = ["kisi_ad":person.kisi_ad!,"kisi_tel":person.kisi_tel!]
        
        //Kişiler tablosu oluşturur ve onun her degeri için unique deger atar diyebiliriz
        let newRef = ref?.child("kisiler").childByAutoId()
        
        //Kayıt işlemi set value ile yapılır ve kişiler kolonu altına işlemler kayıt edielir
        newRef?.setValue(dict)
        
        
        //Alert verilri
        let alertController = UIAlertController(title: "Kayıt ok!", message: "Kişi kaydedildi", preferredStyle: .alert)
        let ok = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(ok)
        self.present(alertController, animated: true)

    }
    
    func delete2DB(){
        //Silme işlemi kayıt yapılan degerin unique oluşturulan alanı ile yapılır
        ref?.child("kisiler").child("-NBT58e2_q2eK9cfJIBw").removeValue()

        //Kişiler tablosunun unique alanının kisi_ad degerini sil dedik
        //        ref?.child("kisiler").child("-NBT58e2_q2eK9cfJIBw").child("kisi_ad").removeValue()
    }
    
    func update2DB(){
        //Dict tipinde deger oluştrulur guncellencek alan için
        let dict : [String:Any] = ["kisi_ad":"hasan","kisi_tel":"0571249428"]
        
        //kişiler tablosunun unique alanını guncelle deriz ve dict degerimizi verince o dict degerine gore
        //guncelleme yapar
        ref?.child("kisiler").child("-NBT58e2_q2eK9cfJIBw").updateChildValues(dict)
    }
    
    func select2DB(){
        //Kisiler tablosunu gozelte degere gore bi degisklik olursa degerleri tekrardan işler
        //Ve bize parametre oalrak snapshot verir bu fonksyon
        ref?.child("kisiler").observe(.value,with: { snapshot in
            
            //Gelen verileri snapshot.value deriz ve dict tipine cevriirz
            //String key alan Any deger alanı olcak şekilde
            if let gelenVeriler = snapshot.value as? [String:AnyObject]{
                
                //Gelen verilerin uzerinde dongu kurarız
                for gelenSatir in gelenVeriler{
                    
                    //Gelen satırların degerlerini dict adlı degiskene atarız nsdcit tipine cevirerek
                    if let dict = gelenSatir.value as? NSDictionary{
                        
                        //Key degeri gelen satır içinde tutulut bu db deki uniqu key alanına denktir
                        let key = gelenSatir.key
                        
                        //Kisi ad ve tel alanlarını dict degiskeninden stringe cevrirrek alabilirz
                        //Eger cevirme veya deger boş ise varsayılan olarak boş deger ataması  yaparız
                        let kisi_ad = dict["kisi_ad"] as? String ?? ""
                        let kisi_tel = dict["kisi_tel"] as? String ?? ""
                        
                        //Ekrana yazdırma işlemi yaptrdık
                        print(key,kisi_ad,kisi_tel)
                        
                    }
                }
            }
        })
    }
    
    func selectEqual2DB(){
        //sorgu degiskenine kisiler tablosunun kisi_ad alanına furkan gelcek şekilde sorgu atılır
        let sorgu = ref?.child("kisiler").queryOrdered(byChild: "kisi_ad").queryEqual(toValue: "furkan")
        
        //let sorgu2 = ref?.child("kisiler").queryLimited(toLast: 5) //son 5 veriyi verir
        //let sorgu3 = ref?.child("kisiler").queryOrdered(byChild: "kisi_tel").queryStarting(atValue: 1).queryEnding(atValue: 10) //kisi_tel aralıgı 1 ile 10 arasında olan kayıtlar gelir
        
        //Ve select burda çalıştırlı
        sorgu!.observe(.value,with: { snapshot in
            
            //Gelen verileri snapshot.value deriz ve dict tipine cevriirz
            //String key alan Any deger alanı olcak şekilde
            if let gelenVeriler = snapshot.value as? [String:AnyObject]{
                
                //Gelen verilerin uzerinde dongu kurarız
                for gelenSatir in gelenVeriler{
                    
                    //Gelen satırların degerlerini dict adlı degiskene atarız nsdcit tipine cevirerek
                    if let dict = gelenSatir.value as? NSDictionary{
                        
                        //Key degeri gelen satır içinde tutulut bu db deki uniqu key alanına denktir
                        let key = gelenSatir.key
                        
                        //Kisi ad ve tel alanlarını dict degiskeninden stringe cevrirrek alabilirz
                        //Eger cevirme veya deger boş ise varsayılan olarak boş deger ataması  yaparız
                        let kisi_ad = dict["kisi_ad"] as? String ?? ""
                        let kisi_tel = dict["kisi_tel"] as? String ?? ""
                        
                        //Ekrana yazdırma işlemi yaptrdık
                        print(key,kisi_ad,kisi_tel)
                        
                    }
                }
            }
        })
    }
    
}
