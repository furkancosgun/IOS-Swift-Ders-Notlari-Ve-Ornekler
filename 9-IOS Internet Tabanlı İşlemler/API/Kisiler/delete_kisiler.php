<?php
$response = array();//Response adında boş array
if(isset($_POST["kisi_id"])){//Eger post methoud ile kisi_id degeri gelmişse
    $kisi_id = $_POST["kisi_id"];//Degeri degişkene atarız

    require_once __DIR__ . '/db_config.php';//conf verileri alınır
    $baglanti = mysqli_connect(DB_SERVER,DB_USER,DB_PASSWORD,DB_DATABASE);//Veritabanı baglantısı saglanır
    if(!$baglanti){//eger baglantı yoksa
        die("Hatalı baglantı: ".mysqli_connect_error());//session oldurulur ve alt satırlar okunmaz
    }
    $sqlsorgu = "delete from kisiler where kisi_id = $kisi_id";//sorgu yazılır
   
    if(mysqli_query($baglanti,$sqlsorgu)){//Sorgu çalıştırılır donen deger true ise
        $response["success"] = 1;
        $response["message"] = "succesfuly deleted";
        echo json_encode($response);
    }else{//False ise
        $response["success"] = 0;
        $response["message"] = "not deleted err..";
        echo json_encode($response);
    }
}else{
    $response["success"] = 0;
    $response["message"] = "Required filed is missing";
    echo json_encode($response);
}
mysqli_close($baglanti);
?>