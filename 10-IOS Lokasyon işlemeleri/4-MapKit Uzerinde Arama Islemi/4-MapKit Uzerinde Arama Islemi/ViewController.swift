//
//  ViewController.swift
//  4-MapKit Uzerinde Arama Islemi
//
//  Created by Furkan on 11.09.2022.
//

import UIKit
import MapKit
class ViewController: UIViewController {

    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var searchBar: UISearchBar!
 
    //Her arama işlemi bir requeste tekabul eder
    let istek = MKLocalSearch.Request()
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        mapView.delegate = self
        
        //Konum bilgisi enlem boylam
        let konum = CLLocationCoordinate2D(latitude: 50.114, longitude: 8.673)
        
        //Harita buyutma işlemi
        let span = MKCoordinateSpan(latitudeDelta: 0.05, longitudeDelta: 0.05)
        
        //Bolge secilir konum ve yakınlık bilgisi ile
        let bolge = MKCoordinateRegion(center: konum, span: span)
        
        //Bolge mapview uzerine yansıtılır
        mapView.region = bolge
        mapView.showsUserLocation = true
        
    }


}

extension ViewController:UISearchBarDelegate,MKMapViewDelegate{
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        //Istek nesnesi ile searchbar degeri ile sorgu atılır
        istek.naturalLanguageQuery = searchBar.text!
        
        //Bu işleme gerk duyulma sebebi her arama işleminde pinlerin silinmesi gerektigindendir
        if mapView.annotations.count > 0 {//Harita uzerinde herhangi bir pin var ise
            mapView.removeAnnotations(mapView.annotations)//Butun pinler silinir
        }
        
        //Mapkit objesine request atılır ve sadece degerlerinin alınması kalır
        let arama = MKLocalSearch(request: istek)
        
        //Arama işlemindne donen degerler yakalnaır bu fonk bize 2 parametre doner cevap ve hata şeklinde
        arama.start(completionHandler: { response,error in
            if error != nil{//Hata varsa
                print("Error",error.debugDescription)
            }else if response?.mapItems.count == 0{//Eger hata yok ve mekan bulunmadıysa
                print("Mekan bulunamadı")
            }else{//Hata yok mekanda var ise
                for mekan in response!.mapItems{
                    if let ad = mekan.name,let tel = mekan.phoneNumber{
                        //Konsola gelen degerlerin bilgileri yazdırlır
                        print("Ad:\(ad)")
                        print("Tel:\(tel)")
                        print("Enlem: \(mekan.placemark.coordinate.latitude)")
                        print("Boylam: \(mekan.placemark.coordinate.longitude)")
                        
                        //Pin ekleme
                        let pin = MKPointAnnotation()//Pin oluştur
                        pin.coordinate = mekan.placemark.coordinate//pin için kordinat degeri
                        pin.title = mekan.name//pin başlıgı
                        pin.subtitle = mekan.phoneNumber//pin altbasligi
                        self.mapView.addAnnotation(pin)//pini mapview icine ekleme
                        
                    }
                }
                
            }
        })
        
    }
}

