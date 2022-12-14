<?php
$response = array();//Boş array oluşturduk
require_once __DIR__ . '/db_config.php';//Conf verileri alındı
$baglanti = mysqli_connect(DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE);//Veritabına baglanıldı
if(!$baglanti){//Eger baglantı yoksa
    die("Hatalı baglantı: ".mysqli_connect_error());//Hata mesaji ver
}
$sqlsorgu = "select * from music";//Sorguy oluşturuldu
$result = mysqli_query($baglanti,$sqlsorgu);//Sorgu çalıştırıldı
if(mysqli_num_rows($result)>0){//Sorgudan donen deger sayısı buyukse 0 dan 
    $response["Music"] = array();//Array içine kişiler keyine ait bir dizi oluşturduk
    while($row = mysqli_fetch_assoc($result)){//her bir deger row içine gelir
        $music = array();
        $music["music_id"] = $row["music_id"];
        $music["music_ad"] = $row["music_ad"];
        $music["music_url"] = $row["music_url"];
        $music["music_img"] = $row["music_img"];
        array_push($response["Music"],$music);
    }
    $response["success"] = 1;//İşlem başarı degeri
    echo json_encode($response);//ekrana json dosyası olarak yazdırırız
}else{
    $response["success"] = 0;
    $response["message"] = "No data found";
    echo json_encode($response);
}
mysqli_close($baglanti);//Baglantı kapatılır
?>
