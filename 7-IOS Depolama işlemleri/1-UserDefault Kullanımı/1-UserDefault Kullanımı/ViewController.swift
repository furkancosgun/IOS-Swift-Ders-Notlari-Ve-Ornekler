//
//  ViewController.swift
//  1-UserDefault Kullanımı
//
//  Created by Furkan on 28.08.2022.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Userdefaults created
        let user = UserDefaults.standard
        
        //Data writing
        user.set("furkan", forKey: "name")
        user.set(19, forKey: "age")
        user.set(true, forKey: "isWorking")
        user.set(1.80, forKey: "height")
        let friends = ["Elon","Tims","Carl"]
        user.set(friends, forKey: "friends")
        let dayList = ["Monday":"1","Tuesday":"2","Wednesday":"3"]
        user.set(dayList, forKey: "dayList")
        
        //Data Reading
        user.string(forKey: "name")
        user.integer(forKey: "age")
        user.bool(forKey: "isWorking")
        user.double(forKey: "height")
        let List = user.stringArray(forKey: "friends") as? [String] ?? [String]()
        let days = user.dictionary(forKey: "dayList") as? [String:String] ?? [String:String]()
        
        //Data Deleting
        user.removeObject(forKey: "name")
        
        //Data Updating
        user.set("new name", forKey: "name")
    }


}

