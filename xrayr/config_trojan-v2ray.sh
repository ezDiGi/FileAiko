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
echo -e " Nhấn enter để chuyển sang chế độ nhập - Vmess"
echo -e "-------------------------"
read -p "Vui lòng chọn config cấu hình: " choose_node

if [ "$choose_node" == "1" ]; then
      # Đặt số nút
      node_id="1"
      domain="01.hk.aikocute.com"

      #Ghi file
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/HK-01/01.hk.pem -O /etc/XrayR/server.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/HK-01/01.hk-privkey.pem -O /etc/XrayR/privkey.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/aiko/Config-Trojan%2BVmess.yml -O /etc/XrayR/config.yml
      sed -i "s/NodeID:.*/NodeID: ${node_id}/g" /etc/XrayR/config.yml
      sed -i "s/CertDomain:.*/CertDomain: ${domain}/g" /etc/XrayR/config.yml

elif [ "$choose_node" == "2" ]; then
      node_id="2"
      domain="01.sing.aikocute.com"

      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/SG-01/01.sing.pem -O /etc/XrayR/server.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/SG-01/01.sing-privkey.pem -O /etc/XrayR/privkey.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/aiko/Config-Trojan%2BVmess.yml -O /etc/XrayR/config.yml
      sed -i "s/NodeID:.*/NodeID: ${node_id}/g" /etc/XrayR/config.yml
      sed -i "s/CertDomain:.*/CertDomain: ${domain}/g" /etc/XrayR/config.yml

elif [ "$choose_node" == "3" ]; then
      node_id="3"
      domain="01.vn.aikocute.com"

      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/VN-01/01.vn.pem -O /etc/XrayR/server.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/VN-01/01.vn-privkey.pem -O /etc/XrayR/privkey.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/aiko/Config-Trojan%2BVmess.yml -O /etc/XrayR/config.yml
      sed -i "s/NodeID:.*/NodeID: ${node_id}/g" /etc/XrayR/config.yml
      sed -i "s/CertDomain:.*/CertDomain: ${domain}/g" /etc/XrayR/config.yml

elif [ "$choose_node" == "4" ]; then
      node_id="4"
      domain="02.vn.aikocute.com"

      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/VN-02/02.vn.pem -O /etc/XrayR/server.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/VN-02/02.vn-privkey.pem -O /etc/XrayR/privkey.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/aiko/Config-Trojan%2BVmess.yml -O /etc/XrayR/config.yml
      sed -i "s/NodeID:.*/NodeID: ${node_id}/g" /etc/XrayR/config.yml
      sed -i "s/CertDomain:.*/CertDomain: ${domain}/g" /etc/XrayR/config.yml

elif [ "$choose_node" == "5" ]; then
      node_id="5"
      domain="01.jp.aikocute.com"

      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/JP-01/01.jp.pem -O /etc/XrayR/server.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/JP-01/01.jp-privkey.pem -O /etc/XrayR/privkey.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/aiko/Config-Trojan%2BVmess.yml -O /etc/XrayR/config.yml
      sed -i "s/NodeID:.*/NodeID: ${node_id}/g" /etc/XrayR/config.yml
      sed -i "s/CertDomain:.*/CertDomain: ${domain}/g" /etc/XrayR/config.yml

elif [ "$choose_node" == "6" ]; then
      node_id="6"
      domain="01.us.aikocute.com"

      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/US-01/01.us.pem -O /etc/XrayR/server.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/US-01/01.us-privkey.pem -O /etc/XrayR/privkey.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/aiko/Config-Trojan%2BVmess.yml -O /etc/XrayR/config.yml
      sed -i "s/NodeID:.*/NodeID: ${node_id}/g" /etc/XrayR/config.yml
      sed -i "s/CertDomain:.*/CertDomain: ${domain}/g" /etc/XrayR/config.yml

elif [ "$choose_node" == "7" ]; then
      node_id="7"
      domain="03.vn.aikocute.com"

      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/VN-03/03.vn.pem -O /etc/XrayR/server.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/VN-03/03.vn-privkey.pem -O /etc/XrayR/privkey.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/aiko/Config-Trojan%2BVmess.yml -O /etc/XrayR/config.yml
      sed -i "s/NodeID:.*/NodeID: ${node_id}/g" /etc/XrayR/config.yml
      sed -i "s/CertDomain:.*/CertDomain: ${domain}/g" /etc/XrayR/config.yml

elif [ "$choose_node" == "8" ]; then
      node_id="8"
      domain="02.sing.aikocute.com"

      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/SG-02/02.sing.pem -O /etc/XrayR/server.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/SG-02/02.sing-privkey.pem -O /etc/XrayR/privkey.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/aiko/Config-Trojan%2BVmess.yml -O /etc/XrayR/config.yml
      sed -i "s/NodeID:.*/NodeID: ${node_id}/g" /etc/XrayR/config.yml
      sed -i "s/CertDomain:.*/CertDomain: ${domain}/g" /etc/XrayR/config.yml

elif [ "$choose_node" == "9" ]; then
      node_id="9"
      domain="04.vn.aikocute.com"

      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/VN-04/04.vn.pem -O /etc/XrayR/server.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Certificate/aiko/Pem/VN-04/04.vn-privkey.pem -O /etc/XrayR/privkey.pem
      wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/aiko/Config-Trojan%2BVmess.yml -O /etc/XrayR/config.yml
      sed -i "s/NodeID:.*/NodeID: ${node_id}/g" /etc/XrayR/config.yml
      sed -i "s/CertDomain:.*/CertDomain: ${domain}/g" /etc/XrayR/config.yml

else
      read -p "Vui lòng nhập node ID :" aiko_node_id
      [ -z "${aiko_node_id}" ]
      echo -e "${green}Node ID của bạn đặt là: ${aiko_node_id}${plain}"
      echo -e "-------------------------"

      wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/aiko/Config-V2ray.yml -O /etc/XrayR/config.yml
      sed -i "s/NodeID:.*/NodeID: ${aiko_node_id}/g" /etc/XrayR/config.yml
fi
