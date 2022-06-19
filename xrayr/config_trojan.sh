#!/bin/bash
echo -e "-------------------------"
echo -e "[1] Node :01 - 01.hk.aikocute.com - HK"
echo -e "[2] Node :02 - 01.sing.aikocute.com - SG"
echo -e "[3] Node :03 - 01.vn.aikocute.com - VN1"
echo -e "[4] Node :04 - 02.vn.aikocute.com - VN2"
echo -e "[5] Node :05 - 01.jp.aikocute.com - JP"
echo -e "[6] Node :06 - 01.us.aikocute.com - US"
echo -e "[7] Node :07 - 03.vn.aikocute.com - VN3"
echo -e "[8] Node :08 - 02.sing.aikocute.com - SG"
echo -e "[9] Node :09 - 04.vn.aikocute.com - VN4"
echo -e " Nhấn enter để chuyển sang chế độ nhập - Aiko"
echo -e "-------------------------"
read -p "Vui lòng chọn config cấu hình: " domain_trojan_aiko
    if [ "$domain_trojan_aiko" == "1" ]; then
    domain_trojan_aiko="01.hk.aikocute.com"
    id_trojan_aiko="1"

    elif [ "$domain_trojan_aiko" == "2" ]; then
    domain_trojan_aiko="01.sing.aikocute.com"
    id_trojan_aiko="2"

    elif [ "$domain_trojan_aiko" == "3" ]; then
    domain_trojan_aiko="01.vn.aikocute.com"
    id_trojan_aiko="3"

    elif [ "$domain_trojan_aiko" == "4" ]; then
    domain_trojan_aiko="02.vn.aikocute.com" 
    id_trojan_aiko="4"

    elif [ "$domain_trojan_aiko" == "5" ]; then
    domain_trojan_aiko="01.jp.aikocute.com"
    id_trojan_aiko="5"

    elif [ "$domain_trojan_aiko" == "6" ]; then
    domain_trojan_aiko="01.us.aikocute.com"
    id_trojan_aiko="6"

    elif [ "$domain_trojan_aiko" == "7" ]; then
    domain_trojan_aiko="03.vn.aikocute.com"
    id_trojan_aiko="7"

    elif [ "$domain_trojan_aiko" == "8" ]; then
    domain_trojan_aiko="02.sing.aikocute.com"
    id_trojan_aiko="8"

    elif [ "$domain_trojan_aiko" == "9" ]; then
    domain_trojan_aiko="04.vn.aikocute.com"
    id_trojan_aiko="9"

    else
    read -p "Nhập ID nút Trojan :"   id_trojan_aiko
    read -p "nhập domain Trojan :"  domain_trojan_aiko
    fi
          
    wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/Aiko-PemKey/key.pem -O /etc/XrayR/server.pem
    wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/Aiko-PemKey/privkey.pem -O /etc/XrayR/privkey.pem
    wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/aiko/Config-Trojan.yml -O /etc/XrayR/aiko.yml
    sed -i "s/NodeID:.*/NodeID: ${id_trojan_aiko}/g" /etc/XrayR/aiko.yml
    sed -i "s/CertDomain:.*/CertDomain: ${domain_trojan_aiko}/g" /etc/XrayR/aiko.yml
