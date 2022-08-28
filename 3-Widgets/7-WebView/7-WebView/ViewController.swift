//
//  ViewController.swift
//  7-WebView
//
//  Created by Furkan on 20.08.2022.
//

import UIKit
import WebKit//webView kullanımı için gerekli olan webkit kutuphanesi
class ViewController: UIViewController {

    @IBOutlet weak var webView: WKWebView!//Webkit webview outlet olarak tanımlandı
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let url = URL(string: "https://www.google.com.tr")!
        //url degişkenine URL fonksyonu ile o degiskeni url nesnesine ceviririz
        //sondaki ! işareti unvrap yapaar string parametre artıkk UrL nesnesi oldugu için gerekldiir
        
        webView.load(URLRequest(url: url))//webviewin load methodunu kullanırız bizden urlrequest ister
        //url request gondermek için oluşturudugumuz url nesnesini veririrz
    }


}

