<?php
$response = array();//Boş array oluşturduk
if( isset($_POST["kisi_ad"])){
    $kisi_ad = $_POST["kisi_ad"];
    require_once __DIR__ . '/db_config.php';//Conf verileri alındı
    $baglanti = mysqli_connect(DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE);//Veritabına baglanıldı
    if(!$baglanti){//Eger baglantı yoksa
        die("Hatalı baglantı: ".mysqli_connect_error());//Hata mesaji ver
    }
    $sqlsorgu = "select * from kisiler where kisi_ad like '%$kisi_ad%' ";//Sorguy oluşturuldu
    $result = mysqli_query($baglanti,$sqlsorgu);//Sorgu çalıştırıldı
    if(mysqli_num_rows($result)>0){//Sorgudan donen deger sayısı buyukse 0 dan 
        $response["kisiler"] = array();//Array içine kişiler keyine ait bir dizi oluşturduk
        while($row = mysqli_fetch_assoc($result)){//her bir deger row içine gelir
            $kisiler = array();//kisiler adında boş array
            $kisiler["kisi_id"] = $row["kisi_id"];//key value mantıgında degerler oluştrulur
            $kisiler["kisi_ad"] = $row["kisi_ad"];
            $kisiler["kisi_tel"] = $row["kisi_tel"];
            array_push($response["kisiler"],$kisiler);//Array içine kişiler keyine gore degerler eklenir
        }
        $response["success"] = 1;//İşlem başarı degeri
        echo json_encode($response);//ekrana json dosyası olarak yazdırırız
    }else{
        $response["success"] = 0;
        $response["message"] = "No data found";
        echo json_encode($response);
    }
}else{
    $response["success"] = 0;
    $response["message"] = "Required filed(s) is missing";
    echo json_encode($response);
}


mysqli_close($baglanti);//Baglantı kapatılır
?>
