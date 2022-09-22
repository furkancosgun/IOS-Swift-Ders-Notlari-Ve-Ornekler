//
//  ViewController.swift
//  Animations
//
//  Created by Furkan on 22.09.2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var txtLabel: UILabel!
    @IBOutlet weak var Cardview: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        Cardview.layer.cornerRadius = 25
        txtLabel.text = "❤️"
        //alphaAnim()
        //scaleAnim()
        //rotateAnim()
        //transfromAnim()
        //repeatScaleAnim()
        //scaleRotateAnim()
        ardiskAnim()
    }

    func alphaAnim(){
        //Duration :ne kadar zamana yayılsın
        //Delay: Ne kadar sure sonra tetiklensin
        //Animations: Animasyon işlemi
        //Completion: Anim işlemi bitince ne olsun
        //Degerleri ters girersek bu sefer terse dogru yapar
        Cardview.alpha = 0
        UIView.animate(withDuration: 5, delay: 1, animations: {
            self.Cardview.alpha = 1
        },completion: { value in
            print(value)//İşlem bitince deger true doner
        })
    }

    func scaleAnim(){
        UIView.animate(withDuration: 5, animations: {
            //X yatay
            //Y dikey degerlere gore kucultur
            self.Cardview.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
        })
    }
    
    func rotateAnim(){
        //pi / 2 : 90 derece
        //pi : 180 derece
        //pi * 3 / 2 : 270 derece
        //pi * pi : 360 derece
        UIView.animate(withDuration: 5, animations: {
            self.Cardview.transform = CGAffineTransform(rotationAngle: .pi * 3 / 2)
        })
    }

    func transfromAnim(){
        //Yatayda 50. noktaya gittik
        UIView.animate(withDuration: 5, animations: {
            self.Cardview.transform = CGAffineTransform(translationX: 50, y: 0)
        })
    }
    
    func repeatScaleAnim(){
        //Cureve linear animasyon şekli hızı
        //Repeat Tekrar etmesi
        UIView.animate(withDuration: 5, delay: 1,options: [.repeat,.curveLinear], animations: {
            //X yatay
            //Y dikey degerlere gore kucultur
            self.Cardview.transform = CGAffineTransform(scaleX: 0.5, y: 0.5)
        })
    }
    
    func scaleRotateAnim(){
        UIView.animate(withDuration: 5, animations: {
            self.Cardview.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
            self.Cardview.transform = CGAffineTransform(rotationAngle: .pi / 2)
        })
    }
    
    func ardiskAnim(){
        UIView.animate(withDuration: 5, animations: {
            self.Cardview.transform = CGAffineTransform(rotationAngle: .pi / 2)
            self.txtLabel.text = "Senin"
        },completion: { val1 in
            UIView.animate(withDuration: 5, animations: {
                self.txtLabel.transform = CGAffineTransform(rotationAngle: .pi * 3 / 2)
                self.txtLabel.text = "Anneni"
            },completion: { val1 in
                UIView.animate(withDuration: 5, animations: {
                    self.Cardview.transform = CGAffineTransform(scaleX: 0.1, y: 0.1)
                    self.txtLabel.text = "Yerim"
                })
            })
        })
    }
}

