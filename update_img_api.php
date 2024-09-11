<?php
 
    //cho $_FILES['file']['name'];
    //cho '<br>';
    //cho $_FILES['file']['type'];
    //cho '<br>';
    //cho $_FILES['file']['tmp_name'];
    //cho '<br>';
    //cho $_FILES['file']['error'];
    //cho '<br>';
    //cho $_FILES['file']['size'];
    //cho '<br>';

    //$location = 'upload/' .substr(hash('sha256', uniqid(time())), 0, 10).'_'.$_FILES['file']['name'];

    //ove_uploaded_file($_FILES['file']['tmp_name'], $location);

    //input:　file(png or jpeg)

    //output: 
    //{"state": true, "message" : "檔案上傳成功", "dataInfo" : "檔案相關訊息name/type/tmp_name/error/size"}
    //{"state": false, "message" : "檔案上傳失敗", "dataInfo" : "檔案相關訊息name/type/tmp_name/error/size"}
    //{"state": false, "message" : "檔案不存在"}
    //{"state": false, "message" : "檔案不符合規定(png or jpeg)"}

    if(isset($_FILES['file']['name']) && $_FILES['file']['name'] != ""){
        if($_FILES['file']['type'] == 'image/jpeg' || $_FILES['file']['type'] == 'image/png'){
            
           
            
            $img=substr(hash('sha256', uniqid(time())), 0, 10) . '_' . $_FILES['file']['name'];
            $location = 'img/product/' . $img;

            move_uploaded_file($_FILES['file']['tmp_name'], $location);

            $datainfo = array();
            $datainfo["location_name"] = $location ;
            $datainfo["origin_name"] = $_FILES['file']['name'];
            $datainfo["type"] = $_FILES['file']['type'];
            $datainfo["size"] = $_FILES['file']['size'];
            $datainfo["tmp_name"] = $_FILES['file']['tmp_name'];
            $datainfo["img"] = $img;

            echo '{"state": true, "message" : "檔案上傳成功", "dataInfo" : '.json_encode($datainfo).'}';
        }else{
            echo '{"state": false, "message" : "檔案不符合規定(png or jpeg)"}';
        }
    }else{
        echo '{"state": false, "message" : "檔案不存在"}';
    }
?>