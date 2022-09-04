//
//  ViewController.swift
//  3-Bildiirm oluşturma
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
            
            let content = UNMutableNotificationContent()//Bildiirm içerigi oluşturulur
            content.title = "Notify Title"//Bildirim başlıgı
            content.subtitle = "Notify subtitle"//Bildirim alt başlıgı
            content.body = "Notify Body"//Bildiirm govdesi
            content.badge = 1 //Uygulama ikonundaki badge (bildirim ikonu)
            content.sound = UNNotificationSound.default//Bildirim sesi varsayılan ses seçilir
            
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
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.banner,.sound,.badge])
    }
}

