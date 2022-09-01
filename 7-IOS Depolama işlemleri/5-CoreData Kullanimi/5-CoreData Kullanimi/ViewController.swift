//
//  ViewController.swift
//  5-CoreData Kullanimi
//
//  Created by Furkan on 30.08.2022.
//

import UIKit

//Coredata kısmından tablo oluşturduktan sonra import işlemleri yapılır
import CoreData

//Global olarak bir uygulama nesnesi oluşturduk
let appDelegate = UIApplication.shared.delegate as! AppDelegate

class ViewController: UIViewController {

    //Tablodan gelen verileri tutacak olan kisiler listesi oluştruduk boş bir şekilde
    var kisiList = [Kisiler]()
    var kisiDict : [String:Int16] = ["Hasan":21,"Ali":35,"Ayse":19,"Fatma":20,"Ela":23,"Husein":25]
    
    
    //Core data işlemlerini yapmamız için kullancagimiz yapı
    let context = appDelegate.persistentContainer.viewContext

    override func viewDidLoad() {
        super.viewDidLoad()
       /* for (name,age) in kisiDict {
            Save(KisiAd: name, KisiYas: age)
        }
        Save(KisiAd: "Furkan", KisiYas: 19) */
        // Read()
       // Arrange()
        Filter()
    }
    
    //Listeleme
    func Read() {
        do {
            //Do catch yapısı ile kisi listemize context yani tablo içinden kişileri alcagımızı soyledik
            kisiList =  try context.fetch(Kisiler.fetchRequest())
        } catch {
            print("ERROR")
        }
        
        //Kisileri konsola yazdırdık
        for kisi in kisiList {
            print("Kisi Ad: \(kisi.kisi_ad!) - Kisi Yas: \(kisi.kisi_yas)")
        }
    }
    
    //Kaydetme
    func Save(KisiAd : String,KisiYas : Int16) {
        //Tabloya veri eklemk için once tablo tipinde bir nesne oluşturulur
        let kisi = Kisiler(context: context)
        
        //Daha sonra ise nesne doldurulur
        kisi.kisi_ad = KisiAd
        kisi.kisi_yas = KisiYas
        
        //Appdelegate nesnesi yardımı ile de kayıt işlemi yaparız
        appDelegate.saveContext()
        print("Kisi Eklendi")
    }
    
    //Silme
    func Delete() {
        //Kisilerimiz bir listede tutuldugu için  index numarası belirterek
        let kisi  = kisiList[1]
        
        //O kisiyi silebiliriz
        context.delete(kisi)
        
        //Daha sonra tabloyu kayıt ederiz silinmiş şekli ile
        appDelegate.saveContext()
    }
    
    //Guncelleme
    func Update(){
        //Kisiler listesinden guncellenecek index alınır
        let kisi = kisiList[1]
        
        //Degerleri degistirilir
        kisi.kisi_ad = "Gizem"
        kisi.kisi_yas = 21
        
        //Ve geri kaydedilir
        appDelegate.saveContext()
    }
    
    //Sıralama
    func Arrange(){
        //Kisilerini listesini alan bir request(istek) oluştururz
        let fetchRequest : NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
        
        //Kisiler tablosunun kisi_ad kolonunu referans alarak sıralama yapan bir nesne oluştururz
        //ascending = true -> Küçükten buyuge
        //ascending = false -> Buyukten kucuge
        let sort = NSSortDescriptor(key: #keyPath(Kisiler.kisi_ad), ascending: true)
        
        //Kişiler requetimizin sıralama işlemine oluşturdugumuz sıralama nesnemizi veriyoruz
        fetchRequest.sortDescriptors = [sort]
        
        do {
            //Kisi listemize tablodan veri çekiyoruz oluşturdugumuz requeste gore verilerimiz bize geliyor
            kisiList = try context.fetch(fetchRequest)
        } catch {
            print("Error")
        }
        
        for k in kisiList{
            print("Kisi Ad: \(k.kisi_ad!) Kisi Yas: \(k.kisi_yas) ")
        }
        
        //Kisi listemizi isime gore a..z ye gore sıraladık
        
    }
    
    //Filtreleme
    func Filter(){
        //Kisiler listesini almak için request oluşturduk
        let fetchReq : NSFetchRequest<Kisiler> = Kisiler.fetchRequest()
        
        //@ = String ifadeler için || i = Int ifadeler için kullanılır
        //Tablomuzda yaşı 20 olan kisi varmı ona bakıyoruz
        fetchReq.predicate = NSPredicate(format: "kisi_yas == %i",20)
        
        //Kisi listesi içine tablo içinden sorgu attık oluştrudugumuz rquest ile
        do {
            kisiList = try context.fetch(fetchReq)
        } catch  {
            print("Err")
        }
        
        for k in kisiList{
            print("Kisi Ad: \(k.kisi_ad!) Kisi Yas: \(k.kisi_yas) ")
        }
        //Kisi tablosunda yaşı 20 olanları getirecek sadece
    }
}
