//
//  ViewController.swift
//  2-MapKit Kullanimi
//
//  Created by Furkan on 11.09.2022.
//

import UIKit

import MapKit

//Mapkit kullanımı için framework eklenir general kısmından
//Daha sonra ise Capablities alanından general sekmesinde o alandan maps için erişim verilir
class ViewController: UIViewController {

    //Mapview gorunumu koda baglanır
    @IBOutlet weak var mapView: MKMapView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //Enlem ve boylam bilgisi degiskene atanır
        let konum = CLLocationCoordinate2D(latitude: 41.03, longitude: 28.9)
        
        //Yakınlaştırma işlemi
        //Deger ne kadar kucukse o kadar buyutme yapılır
        //Deger ne kadar buyukse o kadar kuculte uygulanır
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        //Gosterilecek bolge degerler eklenir
        let bolge = MKCoordinateRegion(center: konum,span: span)
        
        //Mapview içine eklenir
        mapView.setRegion(bolge, animated: true)
        
        //Pin koyma yani konum belirteci
        let pin = MKPointAnnotation()
        
        //Pin kordinati
        pin.coordinate = konum
        
        //pin başlıgı
        pin.title = "Taksim"
        
        //pin altbaslgii
        pin.subtitle  = "Konum bilgisi"
        
        mapView.addAnnotation(pin)
        
        
    }


}

