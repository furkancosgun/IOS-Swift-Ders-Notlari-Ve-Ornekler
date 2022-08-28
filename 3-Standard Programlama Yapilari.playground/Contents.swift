import UIKit

//If yapısına ilk hangşi şart saglanırsa o işlem yapılır diger if blokları kontrol edilmez
//True false deger alma
var a = 10, b=20
print(a == b) //a b  ye eşit mi
print(a < b) //a küçükmü b den
print(a <= b) //a küçük veya eşit mi  b ye
print(a > b) //a buyuk mu b den
print(a >= b) //a buyuk veya eşit mi b ye
print(a != b)//a b ye eşit değilmi

print(a < b || a == 100) //A kucuk mu b den (veya) a eşit mi 100 e
print(a < b && a == 100) //A kucuk mu b den ve  a eşit mi 100 e

//if else  ve else if yapısı
var not = 100

if(not >= 85){
    print("AA Aldınız")
}else if(not >= 70){
    print("BB Aldınız")
}else if(not >= 60){
    print("CC Aldınız")
}else if(not >= 50){
    print("DD Aldınız")
}else{
    print("FF Aldınız")
}

//Parantez kullnamadan
var kulad = "Admin"
var sifre = "1234"
if kulad == "Admin" && sifre == "4321"{
    print("Sisteme giriş başarılı")
}else{
    print("Kullanıcı adı veya şifre yanlış")
}

//Ternary gosterimi
var s1 = 10
var s2 = 20

s1 == s2 ? print("Sayi1 ile Sayi2 Eşittir") : print("Sayi1 ve Sayi2 eşit değildir")


//Switch Yapısı
let gun = 1
switch gun{
case 1 :
    print("Gunlerden Pazartesi")
    break
case 2 :
   print("Gunlerden Sali")
    break
case 3 :
   print("Gunlerden Çarşamba")
    break
case 4 :
   print("Gunlerden Perşembe")
    break
case 5 :
   print("Gunlerden Cuma")
    break
case 6 :
   print("Gunlerden Cumartesi")
    break
case 7 :
    print("Gunlerden Pazar")
    break
default :
    print("Haftanın gunleri 1 - 7 arasında olmalı")
    break//Defaulta konulmasada olur zaten son seçim oldugu için istesede istemesede donguden cıkacaktır
}

//For Döngusu kullanımı
for i in 1...20{
    print(i) //1 ile 20 arasını ekrana basar
}

//1 ile 20 arasında 5 er 5 er artan sayıları bas
var bas = 1
var bit = 20
var art = 5
//Stride fonksiyonu ile aralık ve artış belirleyebilriiz
for i in stride(from: bas, to: bit, by: art){
    print(i)
}


//While Dongusu
var sayi = 1
while sayi < 10{
    print(a)
    sayi+=1//Şart diye koydumuz alanı kesinlikle kontrol altına
    //almaluız aksi takdirde sonsuz donguye griebilir
}

var deger = "furkan"
for i in "Furkan" {
    print(i)
}

for i in 0...deger.count{//0 ile deger uzunlugu kadae dongu kurduk
    print(i)
}

for _ in 0...deger.count{
    print(deger)
}

var index = 5

while index > 0 {
    print("\(index).Veri")
    index -= 1
}

//Break ve continue
//break ve continue ifadeleri butun dongu işlemlerinde vardır loop while for vb.

var index2 = 0
while index2 < 10{ //Donguyu biz 10 dan buyuk olursa durdur dedik ama break ifadesi ile istedigimiz durumda durdurabiliriz
    if index2 == 5 { //5 . indexte dongu break ifadesi ile kırıldı ve sonlandı
        break
    }
    index2 += 1
    if index2 == 3 {
        continue //Continue ifadesi de aşağıdaki kod satırını okutmadan dongunun başına atar
    }
    print(index2,".dongu")
}
// while ile 10a kadar bir dongu kurduk ama bu donguyu 5 oldugunda durdurduk daha sonra kacıncı dongude anladıgımızı
//ogrenmek için ekrana yazdırdık ama 3.donuşte o ifadeyi de ekrana yazdırmadık


//Rastgele sayı uretmek
var sayi1 : Int?
//10 kez doncek bir for dongusu kurduk her seferinde random sayı urettik ve uretilen sayı 5 ise donguden çık dedik
for i in 0...10{
    sayi1 = Int(arc4random_uniform(10)) //0 ile fonk içine verilen deger arasındaki herhangi bir sayıyı veriir
    print("Deneme: \(i) Sayi:\(sayi1!)")
    if sayi1 == 5 {
        break
    }
}

//Tarihsel işlemler
let tarih = Date() //Tarih objesi oluştturduk

let takvim = Calendar.current //Takvim objesi oluşturduk

let yil = takvim.component(.year, from: tarih)//Takvim objesinin componnent fonksiyonu ile(.neyi alacagimizi , nerden alcagımızı belirttik)

let ay = takvim.component(.month, from: tarih)

let gn = takvim.component(.day, from: tarih)

let saat = takvim.component(.hour, from: tarih)

let minute = takvim.component(.minute, from: tarih)

let second = takvim.component(.second, from: tarih)

print(gn,ay,yil,separator: "/") //Gunun tarihini gun ay yil olarak aldık
print(saat,minute,second,separator: ".") //Gunun saatini saat dakika saniye olarak aldık


//ölçü birimleri
let metre = Measurement.init(value: 50, unit: UnitLength.meters) //50 metre oluşturduk
let km = Measurement.init(value: 1, unit: UnitLength.kilometers) //1 kilometre oluşturduk

let sonuc = metre + km //Herhangi bir toplama işleminde her zaman en duşuk olan birime gore işlem yapılır orn: m + km = m
print(sonuc)
//Dönüşüm işlemi de yapabilriiz
//iki turde de  donuşum işlemi yapılabilir
let sonuc1 = sonuc.converted(to: UnitLength.kilometers)
let sonuc2 = sonuc.converted(to: .miles)
print(sonuc1)
print(sonuc2)

let sicaklik = Measurement.init(value: 35, unit: UnitTemperature.celsius)
print(sicaklik.converted(to: .fahrenheit))//35 celcius 94 fahrenheit


//Optional
var isim : String? //Herhangi bir deger atamadıgım için deger nil(null)
isim = "furkan" //Deger artık nil(null) degil deger ataması yaptık
if isim != nil {
    print("Deger nil(null) degil degisken degeri:\(isim!)")
}

//Optional binding
var str : String?

str = "furkan"

if let temp = str {//Mantıgı şu eger içinde deger varsa str nin temp içine atar bu kadars
    print(temp)
}
