//
//  ViewController.swift
//  14-Tab bar controller giris
//
//  Created by Furkan on 20.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        
        //Ana sayfadan ikinci sayfanın tab barını yonetmek için
        if let tabBars = tabBarController?.tabBar.items{
            //Tabcontroller içinden tabbar larin itemlarını degiskene at bu bize liste verir
            
            tabBars[1].badgeValue = "Mainden eriştik"
            //0. index ana ekran ilk eklenen tab barı temsil eder biz ikinciye eriştik
            //eger işlemleri sadece o sayfa ile ilgili yapcaksak self.tabbaritem kullanılabilir
        }
      
    }
//Tab bar controlleri kullanmak için
    //main storyboard uzerine ilk sayfaya embed in diyerek tab bar eklenir
    //daha sonra main uzerine ikinci bir ekran oluşturulur viewcontroller ile
    //tab bar controller suruklenerek ikinci ekran uzerine bırakılır ve
    //relation segue secilir

}

