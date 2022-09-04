//
//  ViewController.swift
//  4-Tekrarlı Bildirim ve action
//
//  Created by Furkan on 3.09.2022.
//

import UIKit
import UserNotifications//Bildirim işlemleri sinifi
class ViewController: UIViewController {

    var mesPermission = false//Bildirim izni başta false olarak verilir
    override func viewDidLoad() {
        super.viewDidLoad()
       
        //Bildirimi on planda çalıştırmak
        UNUserNotificationCenter.current().delegate = self
        
        
        //Bildirim istegi oluşturulur istenen izinler[alert(popup),ses,ikon]
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.sound,.badge], completionHandler: { (granted,error) in//granted : Bildirim izni , Hata
          
            self.mesPermission = granted //Bildirim izin degeri guncellenir
            
            if granted {
                print("Notify permission was taked")
            }else{
                print("Notify permission not was taken")
            }
        })
    }

    @IBAction func btnCreateNotify(_ sender: Any) {
        if mesPermission{//Eger bildirim izni alınmışsa
            
            //Bildirimlere action oluşturma
            let yes = UNNotificationAction(identifier: "yes", title: "YES", options: .foreground)
            let no = UNNotificationAction(identifier: "no", title: "NO", options: .foreground)
            //idye gore işlemleri yakalarız options kısmı yazıların renk ayarıdır destructice kırmızı
            //Foregroun uygulamanın ikincil rengidir
            let del = UNNotificationAction(identifier: "del", title: "DELETE", options: .destructive)
            //Actionları tutcak bir kategoriye ihtiyacımız var
            let category = UNNotificationCategory(identifier: "cat", actions: [yes,no,del], intentIdentifiers: [], options: [])

            //Bildirim alanımıza categorimizi ekliyoruz
            UNUserNotificationCenter.current().setNotificationCategories([category])
            
            let content = UNMutableNotificationContent()//Bildiirm içerigi oluşturulur
            content.title = "Notify Title"//Bildirim başlıgı
            content.subtitle = "Notify subtitle"//Bildirim alt başlıgı
            content.body = "Notify Body"//Bildiirm govdesi
            content.badge = 1 //Uygulama ikonundaki badge (bildirim ikonu)
            content.sound = UNNotificationSound.default//Bildirim sesi varsayılan ses seçilir
            //Aynı şekilde içerik içine de kategorimizi eklememiz gerekmektedir
            content.categoryIdentifier  = "cat"//Kategoriyi id ile ekleriz
            
            /*
            //Zamana dayalı bildirim oluşturma
            var dateTime = DateComponents()
            dateTime.minute = 30
            dateTime.hour = 12
            //Hergun saaat 12.30 da bildirim gonderme işlemi yapar
            let triggerTimer = UNCalendarNotificationTrigger(dateMatching: dateTime, repeats: true)
            //Eğer bildirimi tekrarlı yapmak istersek minimum 60 saniye vermemiz gereklidir
             */
            
            //Bir tane trigger oluşturduk 5 saniye sonra tetiklencek ve tekrarsız şekilde
            let trigger = UNTimeIntervalNotificationTrigger(timeInterval: 5, repeats: false)
            
            //Bildirim istegi oluşturuldu //id verdik birtane //icerik verdik //tetikleyicimizi verdik
            let notifyRequest = UNNotificationRequest(identifier: "id", content: content, trigger: trigger)
            
            //Bildirimi oluşturma işlemini requestimizi vererek tanımladık herhangi bir action olmadıgı için nil dedik
            UNUserNotificationCenter.current().add(notifyRequest,withCompletionHandler: nil)
            
            //Bildiirmin çalışıp çalışmadıgını anlamak için uygulamadan çıkmak gereklidir bu kodlama sadece arkaplan bildirimleri için gecerlidir
        }
    }
}

//Bildirimi onplanda çalışmasını aktif etmek
extension ViewController:UNUserNotificationCenterDelegate{
    //Bildirimin on planda çalışması
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        
        //Onplandaki olan işlemin izinleri 
        completionHandler([.banner,.sound,.badge])
    }
    
    //Bildirimden action seciminin yakalanması
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse, withCompletionHandler completionHandler: @escaping () -> Void) {
        
        //Respoonse objesinin action id si ile bizim action id ler eşleşirse işlem yapılır
        if response.actionIdentifier == "yes"{
            print("Yes butonu seçildi")
        }else if response.actionIdentifier == "no"{
            print("No butonu seçildi")
        }else if response.actionIdentifier == "del"{
            print("Sil butonu seçildi")
        }
        completionHandler()//Bildirim yaklama işlemi tetiklenir
    }
    
}

