<?php
require_once "dbtools.php";
$conn = create_connect();
$dbname = "sample01";
//chatgpt:COALESCE 函數確保即使 count 為 0，它也會顯示在結果中
$sql = "SELECT age_groups.age_group,COALESCE(COUNT(member.Age), 0) AS count
FROM (
SELECT '1-10' AS age_group
UNION SELECT '11-20'
UNION SELECT '21-30'
UNION SELECT '31-40'
UNION SELECT '41-50'
UNION SELECT '51-60'
UNION SELECT '61-70'
UNION SELECT '71-80'
UNION SELECT '81-90'
UNION SELECT '91-100'
) AS age_groups LEFT JOIN member ON age_groups.age_group = 
    CASE
        WHEN member.Age BETWEEN 1 AND 10 THEN '1-10'
        WHEN member.Age BETWEEN 11 AND 20 THEN '11-20'
        WHEN member.Age BETWEEN 21 AND 30 THEN '21-30'
        WHEN member.Age BETWEEN 31 AND 40 THEN '31-40'
        WHEN member.Age BETWEEN 41 AND 50 THEN '41-50'
        WHEN member.Age BETWEEN 51 AND 60 THEN '51-60'
        WHEN member.Age BETWEEN 61 AND 70 THEN '61-70'
        WHEN member.Age BETWEEN 71 AND 80 THEN '71-80'
        WHEN member.Age BETWEEN 81 AND 90 THEN '81-90'
        WHEN member.Age BETWEEN 91 AND 100 THEN '91-100'
        ELSE '其他'
    END
GROUP BY age_groups.age_group
ORDER BY age_groups.age_group ASC;

";
$result = execute_sql($conn, $dbname, $sql);

if (mysqli_num_rows($result) > 0) {
    $data = array();
    while ($row = mysqli_fetch_assoc($result)) {
        $data[] = $row;
    }

    echo '{"state":true,"message":"資料取得成功","data":' . json_encode($data) . '}';
} else {
    echo '{"state":false,"message":"查無資料"}';
}
mysqli_close($conn);
?>

