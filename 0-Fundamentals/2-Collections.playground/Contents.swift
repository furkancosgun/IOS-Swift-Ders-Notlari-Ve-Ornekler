import UIKit

//Array işlemleri
//Array tanımlama işlemleri //Array tanımlama işlemlerinde tip tanımı yapmak tavsiye edilir
var dizi1 = [Int]() //Boş dizi tanımlaması
var dizi2 = [1,2,3] //Baştan deger verilmiş dizi
var dizi3 : [Float] = [10.0,20.1,30.2] //Baştan deger verilmiş diiz
var dizi4 = [Int](repeating: 1, count: 3) //Varsayılan degerleri baştan vermek içinde 3 adet 1 vardır


var meyveler : [String] = ["Elma","Armut","Muz"]
//Array içine erişmek
for meyve in meyveler {
    print(meyve) //elma , armut , muz
}
//Index ile birlikte almak
for (index , meyve) in meyveler.enumerated() {
    print("Index : \(index) Eleman:\(meyve)")
}
//Eleman ekleme
meyveler.append("Kivi") //: ["Elma", "Armut", "Muz", "Kivi"]
print(meyveler)

//Eleman ekleme
meyveler += ["Karpuz"] //: ["Elma", "Armut", "Muz", "Kivi", "Karpuz"]
print(meyveler)

//Elemen ekleme
meyveler.insert("Cilek", at: 1) //1.indexi bir saga kaydırarak  araya cilek degerini ekledil
print(meyveler) //:["Elma", "Cilek", "Armut", "Muz", "Kivi", "Karpuz"]

//Eleman değiştirme
meyveler[1] = "Kavun" //Cilek yerine artık kavun koyduk
print(meyveler) //: ["Elma", "Kavun", "Armut", "Muz", "Kivi", "Karpuz"]

//Eleman ozelliklerine erişmek
meyveler.isEmpty //Dizi boş mu
meyveler.count //Dizide kaç eleman var
meyveler.first //Dizideki ilk elemanı veriir
meyveler.last //Dizideki son elelamnı verir
meyveler.contains("Kavun") //Dizi içinde varmı varsa true deger doner
meyveler.max() //Dizi içindeki en buyuk elemanı veir
meyveler.min() //Dizi içindeki en kucuk elemanı veir
meyveler.reverse() //Diziyi ters çevirir
meyveler.remove(at: 0) //Dizideki i. elemanı siler
meyveler.sort() //Diziyi kucukten buyuge sıralar
meyveler.removeAll() //Butun diziyi siler


//Array filtreleme işlemleri
var sayilar = [1,2,3,4,5,6,7,8,9]

//$0 dizimizdeki her bir elemanı temsil eder
var sonuc = sayilar.filter({$0 > 7}) //7 den buyuk olanaları alır
print(sonuc)
sonuc = sayilar.filter({$0 < 7}) //7 den kucuk olanalrı alır
print(sonuc)
sonuc = sayilar.filter({$0 > 3 && $0 < 8}) //3ten buyuk 8 den kucuk olan degerleri verir
print(sonuc)


//Set İşlemleri
//Ozellikler içine eklenen degerler rastegele yerleşir index takibi zordur aynı degerden birdaha bulunmaz içinde

//Set tanımlama
var set1 = Set <Int>() //Boş int set
var set2 : Set = ["bursa","ankara","adana"] //Degeri basta atanmış set
var set3 :Set<Float> = [1.10,2.3,4.5] //Başta degeri ve tipi atanmış set
//Geriye kalan işlemler diziler ile aynıdır append yerine insert kullanılır aynı degerden bir daha bulunmaz index ile erişmek mantıksızdır index kullanılmaz

//Set yapısına ozgu metodlar
let cifteler : Set<Int> = [0,2,4,6,8]
let tekler : Set<Int> = [1,3,5,7,9]
let asal : Set<Int> = [2,3,5,7]

//Iki set yapısını birleştirir ve bize dizi verir
var deger = tekler.union(cifteler).sorted()
print(deger)

//Kesişimi bize dizi olarak verir
deger = tekler.intersection(cifteler).sorted()
print(deger)

//Kesişimi kendilerinden çıkarır geriye kalanı veirr
deger = tekler.symmetricDifference(asal).sorted()
print(deger)

//Farkını verir
deger = tekler.subtracting(asal).sorted()
print(deger)



//Dictionary kullanımı
//Boş dict [:] Temsil edilir
//Javadaki hashmapin aynısıdır
//Key value ilişkisi vardir

//Dict oluşturma yontemleri
var dic1 = [Int:String]() //Boş oluşturma key int value string dedik
var dic2 = [3.14:"Pi",2.71:"e"] //Direkt deger vererek oluşturma degerlere gore tiplerini ayarlar
var dic3 : [Int:String] = [1:"Bir",2:"Ikı",3:"Uc"] //hem tiplerini verip hem degerlerini vererek oluşturma

//Veri ekleme
var iller = [Int:String]()
iller[50] = "Nevşehir"
iller[01] = "Adana"
iller[34] = "Istanbul"
print(iller)

//Veri guncelleme
iller[34] = "Ankara" //Deger guncelleme
print(iller)
iller.updateValue("Istanbul", forKey: 34) //deger guncelleme
print(iller)

//Veri çekme / Dongu ilişkiisi
for (key,value) in iller {
    print("Key :\(key) Value :\(value)") //Bu şekilde dict(Sozluk) içinden degerleri key valueye gore de alabiliriz
}

//Veri silmne
iller.removeValue(forKey: 01) //01 key olan degeri sildik
print(iller)

//Diğer funcs
iller.isEmpty //Dict boş mu
iller.first //ilk key degerini alır
iller.count //kac adet degerimiz oldugunu verir
var ters = iller.reversed() //Dicti ters cevirir
print(iller)
print(ters)

//İki farkli diziyi dict haline getirme
var plaka = [01,02,03,04,05,06,07,08,09,10]
var sehirad = ["Adana","Adıyaman", "Afyon", "Ağrı", "Amasya", "Ankara", "Antalya", "Artvin","Aydın", "Balıkesir"]

iller = Dictionary(uniqueKeysWithValues: zip(plaka, sehirad))//Dictioanry fonksionu ile zip haline iki diziyi bir dict yapabilriiz
print(iller)

//Dict Filtreleme
var val = iller.filter({$0.key > 5 }) //Key degeri 5 ten buyuk olanlar
print(val)
val = iller.filter({$0.value == "Ankara"}) //Value degeri ankara olanları verir
print(val)
val = iller.filter({$0.key > 3 && $0.key < 8}) //key degeri 3 ten buyuk ve 8 ten kucuk olanalrı listeler
print(val)
