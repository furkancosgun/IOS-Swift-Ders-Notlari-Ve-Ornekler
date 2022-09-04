<?php
$response = array();//Response adında boş array
if(isset($_POST["kisi_ad"]) && isset($_POST["kisi_tel"])){//Eger post methoud ile degerler gelmişse
    $kisi_ad = $_POST["kisi_ad"];//Degeri degişkene atarız
    $kisi_tel = $_POST["kisi_tel"];//Degeri degişkene atarız

    require_once __DIR__ . '/db_config.php';//conf verileri alınır
    $baglanti = mysqli_connect(DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE);//Veritabanı baglantısı saglanır
    if(!$baglanti){//eger baglantı yoksa
        die("Hatalı baglantı: ".mysqli_connect_error());//session oldurulur ve alt satırlar okunmaz
    }
    $sqlsorgu = "insert into kisiler (kisi_ad,kisi_tel) values ('$kisi_ad','$kisi_tel')";
   
    if(mysqli_query($baglanti,$sqlsorgu)){
        $response["success"] = 1;
        $response["message"] = "succesfuly deleted";
        echo json_encode($response);
    }else{
        $response["success"] = 0;
        $response["message"] = "not deleted err..";
        echo json_encode($response);
    }
}else{
    $response["success"] = 0;
    $response["message"] = "Required filed(s) is missing";
    echo json_encode($response);
}
mysqli_close($baglanti);
?>