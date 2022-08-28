import UIKit

//Değişkenler
var ad = "furkan"
var soyad = "cosgun"
var yas = 19
var boy = 1.80
var ad_bas = "f"

//Print methodu
print(ad,soyad,yas,boy,ad_bas)
print(ad,soyad,yas,boy,ad_bas, separator: "-")
print("Adım \(ad) soyadım \(soyad)")

//Değişken oluşturma farkl tip
var isim  :String? //Başlangıç değeri atamadan
// print(isim!) //Bu şekilde çalıştırırsak hatab verir deger null oldugu için

var sayi1 = 10,sayi2 = 20 , sayi3 = 30, kelime = "Elma" //Tek sırada çoklu oluşturma
print(kelime)

//Değişken değerini sonradan değiştirme
kelime = "Armut"
print(kelime)

//Aritmetik işlemler
var toplam = sayi1 + sayi2 + sayi3
print(toplam)

//Type safety
var bir_sayi = 1
// bir_sayi = "asd" //Bir değişkene başta hangi tip atıldıysa onun kullanılması gerekir
// bir_sayi = 1.0  //değişkenin tipine başta int attıgımız için artık sadce int degerler atcaktıkr
print(type(of: bir_sayi))

//Global local kavrami
class Kisi{
    
    //Global 2 adet değişkenimiz vardır bu değişkenlere hem fonkisyonlar içinden hemde
    //normal alandan erişebilirz
    var isim = "Furkan"
    var soyisim = "Coşgun"
    
    //Fonksiyon
    func kisi_yazdir(){
        var isim = "Gizem"//Aynı değişken adında tekrar değişken oluşturup değer atadık
                         //Ve bu deger fonksyon içinde oluşan degerler local degişken diye gecer
                        //Local değişkenler her zaman global değişkendne daha ustundur
        print(isim , soyisim , separator: " ")
    }
    
}

var kisi1 = Kisi() //Out : Gizem Coşgun
kisi1.kisi_yazdir()


// Constants sabitler sabit değişkenler
//Sabit değişkenler degeri sonradan değişmeyen degişkenlerdir
//Ve normal değişkenlerden daha az bellek tuketir
let tc_numarasi = "12345678910" //Tc numaramız gibi düşünebilriz sonradan değişmezler
print(tc_numarasi)


//Kaçış Karakteri "    \    "
var deger = "furkan\\"
print(deger) // Out : furkan\

deger = "fur\tkan"
print(deger) // Out : fur   kan

deger = "fur\nkan"
print(deger) // Out : fur
            //        kan

deger = "\"furkan\""
print(deger)// Out : "furkan"

deger = "\'furkan\'"
print(deger)// Out : 'furkan'


//Yorum satırı bu
/* Açıklama satırı da bu  */


//Aritmetik operatorler + - * /
var s1 = 10 , s2 = 20 ,s3  = 30, top : Int?
print(s1 + s2)
print(s1 - s2)
print(s1 * s2)
print(s1 / s2)

top = s1 + s2
print(top!)
top = s1 - s2
print(top!)
top = s1 * s2
print(top!)
top = s1 / s2
print(top!)

s3 += s1
print(s3)
s3 -= s1
print(s3)
s3 *= s1
print(s3)
s3 /= s1
print(s3)


//Tür dönüşümleri
var i : Int = 10
var d : Double = 10.0
var f : Float = 10
var m1 : String = "50"
var m2 : String = "50.12"

//Sayısaldan Sayısala
var sonuc1 = Int(d) //Double deger int e
var sonuc2 = Double(i) //int deger double
var sonuc3 = Float(i) //int deger floata
var sonuc4 = Int(f) //float deger int e

//Sayısaldan Metine
var sonuc5 = String(d)
var sonuc6 = String(i)
var sonuc7 = String(f)

//Metinden Sayısala
var sonuc8 = Int(m1)
var sonuc9 = Double(m2)
var sonuc10 = Float(m2)


//Tuples
//Verileri tutan yapıdır liste ve hashmap karışımı gibi düşünebiliriz

//Veri okuma
var ad_soyad = ("Ahmet","Kaya")
ad = ad_soyad.0 //Tupleın 0. indexi liste mantıgında ahmet olur
soyad = ad_soyad.1
print(ad,soyad)

//Veri atama
//Degerleri daha sonradan değiştirebilriiz
ad_soyad.0  = "Hasan"
print(ad_soyad)

var kordinat = (x:10,y:200)
kordinat.x = 100
print(kordinat.x,kordinat.y, kordinat , separator: " \t ")

var hata = (404,"Not Found") //Tuple oluşturduk sıradan
var (kod,mesaj) = hata //2 adet değişken oluşturulur ve bunlara herhangi bir tip atanmadan
                      //içi dolu değişkenşmiz veirirz
print(kod)
print(mesaj)

//iç içe Tupels
//Bir tip oluşturdugumuzu  varsayalım ve 3 deger alıyor bu tip
//0.indexte int deger ogrenci no olarak duşunebiliriz
//1.indexte ise 2 deger isteriz o gun dersi varmı ve adı olarak duşunebilirz
//bunlara deger ataması yaparız
var ogrenci : (Int,(Bool,String)) = (100,(true,"Ali"))

print(ogrenci.0)//Int
print(ogrenci.1)//bool ve string aynı anda
print(ogrenci.1.0)//bool degeri
print(ogrenci.1.1)//string degeri

//Başta değişkeni oluştrup daha sonradan deger ataması yapabiliriz
var ogrenci2 : (Int,(Bool,String))
ogrenci2.0 = 100
ogrenci2.1.0 = false
ogrenci2.1.1 = "Hasan"

print(ogrenci2)



