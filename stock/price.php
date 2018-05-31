<?php

date_default_timezone_set('PRC');

require_once 'HttpUtil.php';

$stocks = [
    'sh600740'=>'山西焦化', 
    "sz300618"=>'寒锐钴业'
   ];

function getQueryUrl($stockCode) {
    $d = date("Y-m-d");
    $hour = date("H");
    $stockInfoUrl = sprintf('http://web.ifzq.gtimg.cn/appstock/app/fqkline/get?param=%s,day,%s,%s,640,hfq', $stockCode, $d, $d);
    return $stockInfoUrl;
}


foreach ($stocks as $stock => $name) {
    $url = getQueryUrl($stock);
    $data = HttpUtil::get($url, [], true, 30);
    if ($data !== false) {
        $jsonData = $data;
        $price = $jsonData['data'][$stock]['day'][0];

        $open = $price[1];
        $close = $price[2];
        $high = $price[3];
        $low = $price[4];

        print "日期: ". $price[0]. ", 股票代码: ". $name. "\n";
        printPrice($close);
        print "\n\n";
    }
}

function printPrice($close) {
    $levels = [ 10, 9, 8, 7, 6, 5, 4, 3, 2, 1, 0, -1, -2, -3, -4, -5, -6, -7, -8, -9, -10];
    foreach ($levels as $level) {
        $p = sprintf("%.2f", $close * ((100 + $level)/100));
        $message = sprintf("涨幅%4d 时，价格为：%s", $level, $p);
        print $message . "\n";
        
    }
}
