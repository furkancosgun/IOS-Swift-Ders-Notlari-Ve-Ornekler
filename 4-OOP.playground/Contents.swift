import UIKit
import Darwin

//Oop class ve structre kullanımı
//Strcutrelar init metoduna ihityaç duymazlar ve deinit methodunu kullanamzlar

class Urun{
    var ad: String?
    var fiyat : Double?
}

var sut = Urun()
sut.ad = "İçim sut"
sut.fiyat = 14.90

print(sut.ad!)
print(sut.fiyat!)

struct Araba{
    var marka : String?
    var fiyat : Double?
}

var bmw = Araba()
bmw.marka = "BMW"
bmw.fiyat = 150000.00

print(bmw.marka!)
print(bmw.fiyat!)

//Araba mitolojisi edilebilirlik
class Araba2{
    var marka:String?
    var hiz : Int?
    var calisiyormu:Bool?
    
    init(){
        print("Araba Oluşturuldu")
    }
    
    func arabayi_calistir(){
        print("Araba çalıştı")
    }
    
    func arabayi_durdur(){
        print("Araba durdu")
    }
    
    func hizlan(kac_km : Int){
        hiz! += kac_km
    }
    
    func yavasla(kac_km : Int){
        hiz! -= kac_km
    }
    func bilgi_ver(){
        print(marka!,hiz!,calisiyormu!,separator: " \t ")
    }
    
    deinit{
        print("Deinit calisti")
    }
}

var ford = Araba2()
ford.marka = "Ford"
ford.hiz = 120
ford.calisiyormu = true

ford.arabayi_calistir()
ford.arabayi_durdur()
ford.hizlan(kac_km: 100)
ford.yavasla(kac_km: 50)
ford.bilgi_ver()


//Lazy Yapısı
//Lazy sadecec gecici deger verilcekse kullanılır depolama için ilk silinen verilerden birisdir kalıcı veriler tutulmaz
//lazy yapısı depolama alanında 2.plandadır ve silinmeye mahkumdur
class Ogrenci{
    lazy var no : Int = 100
}
var furkan = Ogrenci()
print(furkan.no)


//Hesaplama işlemleri
class Math{
    var x = 10
    var y = 20
    
    var total : Int{ //Suslu parantezli işlemlere clouser yapısı adı verilir / metodların yaptıgı işlemleri yapmaktadır
        get{
            return x + y
        }
    }
}

var toplam = Math()

print(toplam.total)




class Maas{
    var maas = 10000
    var bonus = 1.2
    
    var toplam_maas : Double{ //Double degeri olan bir değişken ve içerisinde işlem yapılabiliyor
        get{
            return Double(maas) * bonus
        }
    }
    
    var set_bonus : Double{//Double degeri olan bir değişken ve biz bu değişkene deger ataması yapabiliyoruz
        get{
            return bonus
        }
        set(Yeni_bonus){
            self.bonus = Yeni_bonus
            
        }
    }
  
}

var hasan = Maas()
print(hasan.toplam_maas)
hasan.set_bonus = 2.3
print(hasan.toplam_maas)


//Fonksiyonlar
func selamla(){ //Herhangi bir deger dondurmeyen ve parametre almayan fonksiyon
    print("Selam kullanıcı")
}

selamla() //Bu şekilde çağırım yaparız

func selamla2(isminiz : String) -> String{//Paramaetre alan ve string deger donderen fonksiyon
    return "Selam \(isminiz)"
}

print(selamla2(isminiz: "Furkan")) //String deger donderdigi için gormek için print içerisine yazdık



//Overloading
//Aynı isimde birden fazla metodun olması ve farklı parametreler ile oluşmasına overloading(Asiri yukleme) denir
class Matematik{
    func topla(s1 : Int,s2 : Int){
        
    }
    func topla(s1 : Double,s2 : Double){
        
    }
    func topla(s1 : Int,s2 : Double){
        
    }
    func topla(s1 : Double,s2 : Int){
        
    }
}


//Variadic parametre
func topla(sayilar:Int...) -> Int{ //Variadic parametre pararametre adını yazdıktan sonra tiopini belirtip 3 nokta konmasına denir
                                  //islevi ise virgul kullanılarakj istenildigi kadar parametre almasını saglar
    var toplam=0
    for s in sayilar{
        toplam += s
    }
    return toplam
}

var top = topla(sayilar: 1,2,3,4,5,6,7,8,8,9,10,0,0,43,1,31,24,4,213,4,25,42,5) //Ben bir parametre tanımlamama ragmen istedigim kadar parametre verebilrim
print(top)


//Birden fazla donus degeri olan fonksionlar
func Aritmetik(sayilar: [Int])->(toplam:Int,cikarma:Int,carpma:Int,Bolme:Int){
    //Fonksion parametre olarak bir int listeesi ister bizden
    var toplam = 0
    var cikarma = 0
    var carpma = 0
    var bolme = 0
    //işlem sonunda dondurcegimiz degerleri onceden tanımladık
    for s in sayilar{
        toplam += s
        cikarma -= s
        carpma *= s
        bolme /= s
    }
    //işlemleri tamamladık
    return (toplam,cikarma,carpma,bolme)
    //ve degerleri parantez içine alarak dondurduk
}

var sayilar = [1,2,3,4,5] //Int deger listesini oluşturduk
var sayi = Aritmetik(sayilar: sayilar)//degisken olusturduk ve fonksyona eşitledik fonk içibne de listemizi verdik
print(sayi.toplam)
print(sayi.carpma)
print(sayi.cikarma)
print(sayi.Bolme)


//Donus degerini optional(null(nil)) yapabilriiz
func ikiye_carp(x:Int)-> Int?{ //Eger degerimizin null gelme ihitmali varsa bunu nullable yapabilirz
    return x*2
}

var sayim = ikiye_carp(x: 60)
print(sayim!)

//Global ve local parametreler
//Asagıdaki fonksiondaki Sayi1 ve Sayi2 bizin Global parametrelerimiz onları fonksionu cagıırrken kullanırız
//Yanlarındaki x ve y ise de fonksiyon içerisinde o adla kullancagımız parametreleer olur
//Bir nevi kısaltma veya acıklama olarak anlayabilriiz
func ikisini_topla(Sayi1 x:Int,Sayi2 y:Int) -> Int{
  return x+y
}

var x = ikisini_topla(Sayi1: 10, Sayi2: 20)
print(x)


//Inıt ve constructor
//Inıt metodlar classı oluştururken işlem yapmamıza olanak saglayan metodlardır
class Insan{
    var ad : String?
    var soyad : String?
    var tc : String?
    
    init(Adı: String,Soyadi:String,Tc:String){
        self.ad = Adı
        self.soyad = Soyadi
        self.tc = Tc
    }
}

var ali = Insan(Adı: "ALi", Soyadi: "Ak", Tc: "12345678910")
print(ali.ad!)


/*Class ve Struct arasındaki farkalr
class referans tiplidir
struct deger tiplidir
Yani şoyle ki ali ve ahmet aynı dosyayı kullanıyor ali dosyada degisiklik yaparsa ahmetin dosyasi da degisir ve bu referans tip olur
ama ali ve ahmetin farklı dosyasyı olursa bu deger tipldiri*/

//Referans tip ornek
class Hayvan{
    var ad : String?
    init(adi:String){
        self.ad = adi
    }
}
var kopek1 = Hayvan(adi: "Cake")
var kopek2 = kopek1 //Bu referans tipli bir değişim oldu
print(kopek2.ad!)
kopek2.ad = "Finn"
print(kopek1.ad!) //Biz kopek2 nin adını değişmemize ragmen kopek1 inde adı değişmiş oldu


//Deger tip ornek
struct Hayvan1{
    var ad : String?
    init(adi:String){
        ad = adi
    }
}

var kpk1 = Hayvan1(adi: "Finn")
var kpk2 = kpk1
kpk2.ad = "Jake"//kopk2 nin adi degismesine ragmen kopek1 in adı degismedi
print(kpk1.ad!)


//Static yapisi
//Static ketywordu ile classı oluşturmadan direk class ismi ile o degiskene veya fonksiona erişebilriiz
class Sinif{
    static var a = 10
    static func carp2ile() -> Int{
        return a * 2
    }
}

print(Sinif.carp2ile())



//Enum yapısı
//Yazılımcının işini kolaylaştıran degerleri akılda tutmaya degil kodda tutmaya yarayan yapı
enum Renkler{
    case Beyaz
    case Siyah
}
var renk = Renkler.Beyaz

switch renk{
case .Beyaz:
    print("Deger Beyaz")
case .Siyah:
    print("Deger Siyah")
}

enum Boyut{//Enumaration oluşturuldu
    case buyuk
    case orta
    case kucuk
}

func ucert_al(boyut:Boyut){//fonksiyon yazıldı ve parametre olarak enum istendş
    switch boyut{ //enuma eşit olan degere gore
    case .buyuk:
        print("Buyuk boy seçildi")
        break
    case .orta:
        print("Buyuk boy seçildi")
        break
    case .kucuk:
        print("Buyuk boy seçildi")
        break
    }
}

ucert_al(boyut: .orta)//Fonksiyonu çalıştırdık



//Composition kullanımı
//compostion kullaınımı classların iç içe kullanımıdır  başka bir class başka bir classın propertysi(degiskeni olabilir)
class Adres{
    var il : String?
    var ilce : String?
    init(Il:String,Ilce:String){
        self.il=Il
        self.ilce=Ilce
    }
}

class kisi{
    var ad : String?
    var soyad : String?
    var adres : Adres?
    init(Ad:String,Soyad:String,Adres:Adres){
        self.ad = Ad
        self.soyad = Soyad
        self.adres = Adres
    }
}

var kisi1 = kisi(Ad: "Furkan", Soyad: "Coşgun", Adres: Adres(Il: "Nevsehir", Ilce: "Merkez"))


//Kalitim (Inheritance)
//Kalıtımda alt sınıf ust sınıflara erişebilir ust sınıflar alt sınıflara erişemez
class Arac{ //Arac super class
    var renk : String?
    var vites : String?
    
    init(Renk : String,Vites:String){
        self.renk = Renk
        self.vites = Vites
    }
}

class ZAraba : Arac{ //zaraba sub class / Arac classının init parametrelerini bu class içinden doldururz ve super keywordu ile ust classa erişebilriz
    var marka : String?
    var model : String?
    init(Marka:String,Model:String,Renk: String, Vites: String) {
        self.marka = Marka
        self.model = Model
        super.init(Renk: Renk, Vites: Vites)
    }
}

var fiat = ZAraba(Marka: "Fiat", Model: "Egea", Renk: "Lacivert", Vites: "Manuel")
print(fiat)//Clasların çalışma yapısı super classtan sub clasa dogrudur


//Override işlemi
//Override ust sınıfın fonksiyonlarını ezerek alt sınıfta degistirmesidir ve o sınıfa ozgudur dige classlarımn içinde ezilmez
class Hayvan2{
    func ses_cikar(){
        print("Sesim yok")
    }
}

class Memeli : Hayvan2 {
    override func ses_cikar(){
        print("Sesim yok")
    }
}

class Kedi : Memeli {
    override func ses_cikar() {
        print("Miyaw Miyaw")
    }
}
class Kopek : Memeli{
    override func ses_cikar() {
        print("Haw Haw")
    }
}

var kedi = Kedi()//Ust classlarda da aynı isimde method bulunmasına ragmen override ettigimiz için classın içinde son ezilen metod çalışmaktadır
kedi.ses_cikar()

//Polymorphism
/*
Polymorphism olması için iki class arasında kalıtım ilişkisi olmalıdır
Daha kapsayiic bir kullanim saglar
Methodlarin parametrelerinde polymorphism kullanilarak daha kapsayici veriler alinabilir
superclass gibi gorunup subclass gibi davranir
 */
//Ornek
var kedi2 : Hayvan2 = Kedi() //Hayvan class tipinde ama kedi classının ozelliklerine sahip
kedi2.ses_cikar()


//Tip donuşumleri
var kedi3 = Kedi()

if kedi is Kedi{ //is kullanarak tip donuşmlerini kontrol ederiz
    print("Bu bir kedi")
}else{
    print("Bu bir kedi değil")
}

if kedi is Kopek{
    print("Bu bir kopke")
}else{
    print("Bu bir kopke degildir")
}

//Upcasting / ust classi alt class olarak gosterme
//var memeli : Memeli = Kedi as Memeli

//Downcasting /Alt classi ust class oalrak gosterme
//var kopek2 : Kopek = Memeli as Kopek


//Ornek polymorphism - Tip donuşumu - Tip kontrolu
class Personel{
    func iseAlindi(){
        print("Personel Mutlu")
    }
}
class Mudur : Personel{
    func ise_al(p:Personel){//Kapsam genişletildi personel statusunde bir şirkette birden cok departman ve kisi olabailir
        p.iseAlindi()//içeri gelen parametreyi p ile gosterdiigmiz için onun methodalrına erişebilriz
    }
    
    func terfi_ettir(p:Personel){
        if p is Ogretmen{
        (p as! Ogretmen).maas_arttir() //Down casting yapmıs olduk herhangi bir personel statusunden gelen objeyi ogretmen statusune yukselttik
        }
        else{
            print("Sadece ogretmen statusu terfi alabailir")
        }
    }
    
}

class Isci : Personel{
    
}

class Ogretmen : Personel{
    func maas_arttir(){
        print("Maas artti ogretmen mutlu")
    }
}

var mudur = Mudur()

//Polymorphism yapısı kullanarak personel statusunde isci objesi urettık
var isci : Personel = Isci()
var ogretmen : Personel = Ogretmen()
mudur.ise_al(p: isci) //Bu durumda mudur classının methodu bizden personel objesi istemesine ragemn biz ona personel tipinde ogretmen ve isci objesi gonderedik
mudur.ise_al(p: ogretmen)
mudur.terfi_ettir(p: ogretmen)//Ogretmeni olustururken personel tipinde oluşturmuştuk artık ogretmen tipine gecmis oldu
mudur.terfi_ettir(p: isci)//isci statusu terfi alamasın diye sartladık



//Extension kullanımı
//Degerleri metreye cevirme
extension Double{ //Extension yaratıldı //Girilen degerin sonuna nokta ile istedigimiz olcu birimini metreye cevirir
    var km : Double { return self*1000.0 }
    var m : Double { return self }
    var cm : Double { return self / 100 }
    var mm : Double { return self / 1000}
}

print("10 km \(10.km) Metredir")
print("10 m \(10.m) Metredir")
print("10 cm \(10.cm) Metredir")
print("10 mm \(10.mm) Metredir")

//Extension method kullanımı
extension String{ //Stringlerin uzerinde method olıuştuturuz
    func harf_degis(eski_harf : String ,yeni_harf : String)-> String{//harf degis adında 2 parametre alan ve string deger donduren method
        return self.replacingOccurrences(of: yeni_harf, with: eski_harf)//sistemşn methodunu kullanarak kendimiz işlem yapmış gibi  deger dondururuz
    }
}

let str = "Furkan".harf_degis(eski_harf: "u", yeni_harf: "a")//Methodun kullanımı
print(str)


//Protocol kullanımı (Interface)
protocol Protocol{//Protocol oluşturduk
    var degisken : Int { get set } //Degisken tanımlaması int turunde getter ve setter parametreleri olan
    
    func method1()//Void method
    func method2()-> String //Return eden method
}

class SinifA : Protocol{//Protocol kullanımı
    //Protocolde yazılan herşey class içinde tanımlanması gerekir
    var degisken = 10
    func method1() {
        print("Protocol Voi")
    }
    func method2() -> String {
        return "Protocol String donus"
    }
}


//Ornek protocol kullanımı
//2 adet protocol oluşturduk sescikarabilir ve ucabilir adında içlerinde 1 er adet method bulunmakta
protocol Sescikarabilir{
    func ses_cikar() -> String
}

protocol ucabilir{
    func uc_bakalim()
}

//Aslan classı sescikarabilir oldugu için bu prtocolu kullanıyoruz ucamadigi icin
class Aslan : Sescikarabilir {
    func ses_cikar() -> String {
        return "Waooow"
    }
}

class Kus : ucabilir , Sescikarabilir{//Kus classi ucabilir ve ses cikarabilir oldugu içinde 2 protocolude implemenet ediyoruz
    func ses_cikar() -> String {
        return  "Cik Cik"
    }
    func uc_bakalim() {
        print("Suan ucuyor")
    }
}


//Clouser yapısı
//Suslu parantezler ile bir objeye veya degiskene fonksiyonalite katmaktır
let ifade = {//ifade adlı degiskene print fonksyonu ekledik
    print("Ifade cagrildi")
}
ifade()

let islem = {//islem adlı degiskene de 2 parametre alan ve geri donus degeri ınt olan bir method yazdık
    (x:Int,y:Int)->Int in//method yazıldıktan sonra geri donus degerinden sonra in yazıp kodlama islemine baslayabiliriz
    return x + y
}

print(islem(110,20))//islem degiskenini bir fonksiyon gibi kullanıp deger dondurup ekrana yazdırıyoruz



//Closure ile şart yazma
var sayilar1:[Int] = [1,2,3,4,5,6,7,8,9]
var siralama = sayilar1.sorted(by: {n1 , n2 in n1 < n2}) //Kucukten buyuge sıralama
print(siralama)
siralama = sayilar1.sorted(by: {sayi1 , sayi2 in sayi1 > sayi2})//Buyukten kucuge sıralama
print(siralama)
siralama = sayilar1.sorted(by: {$0 < $1})//Kcuutken buyuge sırlama
print(siralama)
siralama = sayilar1.sorted(by: > )//Buyukten kcuuge siralama
print(siralama)



//Guard kullanımı
//if yapilarina cok benzer ozelliktedir tek farklari if sart saglanirsa calisir guarda ise sart saglanmazsa calisir
//Ornek
func kisi_tanima(isim : String){//donus degeri olmaayan bir parametre alan bir fonksyon olusturduk
    guard isim == "Furkan" else {//if isim furkana eşit degilse
        print("Tanınmayan kişi")
        return //Fonksyonu bitirp cikar
    }
    print("Merhaba furkan")//Eger foksyon bitmeden devam ettiyse Deger istenildigi gibi gelmşştirq
}
kisi_tanima(isim: "Furkan")

//Ornek2
func buyuk_harfyap(kelime : String?){//fonksyon acılır 1 parametre alan
    guard let temp = kelime else { //Gelen parametre nullable oldugu için bir degiskene atarız eger ki atama işlemi yapılmıyorsa bu ksıım çalışır
        print("Deger hala null(nil)dir buyuk harf yapılmaz")
        return
    }
    print(temp.uppercased())//Eger atama işlemi yapıldıysa ve guard gecildiyse işlem biter
}

buyuk_harfyap(kelime: "asdfghj")




//Do Try Catch Throw kullanımı
enum Hatalar : Error{//Enumaration yazıldı hata sınfıından miras alınarak
    case sifiraBolunmeHatasi
}

func bolme(x:Int,y:Int) throws -> Int{//fonksyon oluşturduk hata verebilme ozelligi olan throws diyerek
    if y == 0{//Eger fonksyona verilen 2.parametre 0 ise o  zmn hata gondercez
        throw Hatalar.sifiraBolunmeHatasi
    }
    return x / y
}

do{
    let sonuc = try bolme(x: 10, y: 0) //Oluşturdugum fonskyon hata fırlattıgı için fonksyonu try ile birlikte kullanmamız gerekir
    print(sonuc)//işlemde bir hata yoksa
}catch Hatalar.sifiraBolunmeHatasi{//Ama firlatilan hata catch degerine esitse
    print("Deger sıfıra bolunmez")//ekrana yazar
}


let sonuc = try? bolme(x: 10, y: 0)//eger try? kullanırsak işlemin sonucunda bize hehrnagi bir hata gelirse işlemin sonuc null  doner





//Multi Thread kullanimi
let queue = DispatchQueue(label: "Multi")
queue.async {//Async yapı sırasız işlem yapar sync yapı bir işlem biter diger işleme gecer
    for i in 0...50{
        print("Multi thread:",i)
    }
}

for i in 0...50{//Main thread //Her zaman daha once gelir
    print("Main thread:",i)
}
