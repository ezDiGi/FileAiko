#!/bin/bash
echo -e "-------------------------"
echo -e "[1] Config Trojan [TLS]"
echo -e "[2] Config V2Ray"
echo -e "[3] Config V2Ray+Trojan [TLS]"
echo -e "Enter - Mặc định - V2ray-AikoCute"
echo -e "-------------------------"
read -p "Vui lòng chọn config cấu hình: " nhk_choose
if [ "$nhk_choose" == "1" ]; then

  echo -e "${green}Đặt số nút Trên Web V2Board-Trojan${plain}"
  echo ""
  read -p "Vui lòng nhập node ID :" nhk_node_id
  [ -z "${nhk_node_id}" ]
  echo "---------------------------"
  echo -e "${green}Node ID của bạn đặt là: ${nhk_node_id}${plain}"
  echo "---------------------------"
  echo ""

  echo "Tên Miền của nút Trojan 'testcode.aikocute.com'"
  echo ""
  read -p "Vui lòng Nhập domain :" nhk_domain
  [ -z "${nhk_domain}" ]
  echo "---------------------------"
  echo -e "${green}Tên miền của bạn đặt là: ${nhk_domain}${plain}"
  echo "---------------------------"

  wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/nhk/Config-Trojan.yml -O /etc/XrayR/config.yml
  sed -i "s/NodeID:.*/NodeID: ${nhk_node_id}/g" /etc/XrayR/config.yml
  sed -i "s/CertDomain:.*/CertDomain: ${nhk_domain}/g" /etc/XrayR/config.yml
elif [ "$nhk_choose" == "2" ]; then

  echo "---------------------------"
  echo -e "${green}Đặt số nút Trên Web V2Board-V2ray${plain}"
  echo ""
  read -p "Vui lòng nhập node ID :" nhk_node_id
  [ -z "${nhk_node_id}" ]
  echo "---------------------------"
  echo -e "${green}Node ID của bạn đặt là: ${nhk_node_id}${plain}"
  echo "---------------------------"
  echo ""

  wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/nhk/Config-V2ray.yml -O /etc/XrayR/config.yml
  sed -i "s/NodeID:.*/NodeID: ${nhk_node_id}/g" /etc/XrayR/config.yml

elif [ "$nhk_choose" == "3" ]; then
  read -p "Số node ID Trojan :" idtrojan
  echo "---------------"
  read -p "Số node ID Vmess :" idvmess
  echo "---------------"
  read -p "CertDomain của bạn là :" CertDomain
  echo "---------------"

  rm -f /etc/XrayR/config.yml
  if [[ -z $(~/.acme.sh/acme.sh -v 2>/dev/null) ]]; then
    curl https://get.acme.sh | sh -s email=script@github.com
    source ~/.bashrc
    bash ~/.acme.sh/acme.sh --upgrade --auto-upgrade
  fi
  cat <<EOF >/etc/XrayR/config.yml

Log:
  Level: none # Log level: none, error, warning, info, debug 
  AccessPath: # /etc/XrayR/access.Log
  ErrorPath: # /etc/XrayR/error.log
DnsConfigPath: # /etc/XrayR/dns.json # Path to dns config, check https://xtls.github.io/config/dns.html for help
RouteConfigPath: # /etc/XrayR/route.json # Path to route config, check https://xtls.github.io/config/routing.html for help
InboundConfigPath: # /etc/XrayR/custom_inbound.json # Path to custom inbound config, check https://xtls.github.io/config/inbound.html for help
OutboundConfigPath: # /etc/XrayR/custom_outbound.json # Path to custom outbound config, check https://xtls.github.io/config/outbound.html for help
ConnetionConfig:
  Handshake: 4 # Handshake time limit, Second
  ConnIdle: 10000000000 # Connection idle time limit, Second
  UplinkOnly: 2 # Time limit when the connection downstream is closed, Second
  DownlinkOnly: 4 # Time limit when the connection is closed after the uplink is closed, Second
  BufferSize: 64 # The internal cache size of each connection, kB 
Nodes:
  -
    PanelType: "V2board" # Panel type: SSpanel, V2board, PMpanel, Proxypanel
    ApiConfig:
      ApiHost: "https://nhkvpn.net"
      ApiKey: "nhkservervpnnhkservervpn"
      NodeID: $idtrojan
      NodeType: Trojan # Node type: V2ray, Trojan, Shadowsocks, Shadowsocks-Plugin
      Timeout: 30 # Timeout for the api request
      EnableVless: false # Enable Vless for V2ray Type
      EnableXTLS: false # Enable XTLS for V2ray and Trojan
      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable
      DeviceLimit: 2 # Local settings will replace remote settings, 0 means disable
      RuleListPath: # ./rulelist Path to local rulelist file
    ControllerConfig:
      ListenIP: 0.0.0.0 # IP address you want to listen
      SendIP: 0.0.0.0 # IP address you want to send pacakage
      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.
      EnableDNS: false # Use custom DNS config, Please ensure that you set the dns.json well
      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy
      DisableUploadTraffic: false # Disable Upload Traffic to the panel
      DisableGetRule: false # Disable Get Rule from the panel
      DisableIVCheck: false # Disable the anti-reply protection for Shadowsocks
      DisableSniffing: true # Disable domain sniffing 
      EnableProxyProtocol: false # Only works for WebSocket and TCP
      EnableFallback: false # Only support for Trojan and Vless
      FallBackConfigs:  # Support multiple fallbacks
        -
          SNI: # TLS SNI(Server Name Indication), Empty for any
          Path: # HTTP PATH, Empty for any
          Dest: 80 # Required, Destination of fallback, check https://xtls.github.io/config/fallback/ for details.
          ProxyProtocolVer: 0 # Send PROXY protocol version, 0 for dsable
      CertConfig:
        CertMode: dns # Option about how to get certificate: none, file, http, dns. Choose "none" will forcedly disable the tls config.
        CertDomain: "$CertDomain" # Domain to cert
        CertFile: ./cert/node1.test.com.cert # Provided if the CertMode is file
        KeyFile: ./cert/node1.test.com.key
        Provider: cloudflare # DNS cert provider, Get the full support list here: https://go-acme.github.io/lego/dns/
        Email: test@me.com
        DNSEnv: # DNS ENV option used by DNS provider
          CLOUDFLARE_EMAIL: nhkservervpn@gmail.com
          CLOUDFLARE_API_KEY: 20ddd8957fa907c2c3ac6f49497fb05ab40e7
  -
    PanelType: "V2board" # Panel type: SSpanel, V2board, PMpanel, Proxypanel
    ApiConfig:
      ApiHost: "https://nhkvpn.net"
      ApiKey: "nhkservervpnnhkservervpn"
      NodeID: $idvmess
      NodeType: V2ray # Node type: V2ray, Trojan, Shadowsocks, Shadowsocks-Plugin
      Timeout: 30 # Timeout for the api request
      EnableVless: false # Enable Vless for V2ray Type
      EnableXTLS: false # Enable XTLS for V2ray and Trojan
      SpeedLimit: 0 # Mbps, Local settings will replace remote settings, 0 means disable
      DeviceLimit: 2 # Local settings will replace remote settings, 0 means disable
      RuleListPath: # ./rulelist Path to local rulelist file
    ControllerConfig:
      ListenIP: 0.0.0.0 # IP address you want to listen
      SendIP: 0.0.0.0 # IP address you want to send pacakage
      UpdatePeriodic: 60 # Time to update the nodeinfo, how many sec.
      EnableDNS: false # Use custom DNS config, Please ensure that you set the dns.json well
      DNSType: AsIs # AsIs, UseIP, UseIPv4, UseIPv6, DNS strategy
      DisableUploadTraffic: false # Disable Upload Traffic to the panel
      DisableGetRule: false # Disable Get Rule from the panel
      DisableIVCheck: false # Disable the anti-reply protection for Shadowsocks
      DisableSniffing: true # Disable domain sniffing 
      EnableProxyProtocol: false # Only works for WebSocket and TCP
      EnableFallback: false # Only support for Trojan and Vless
      FallBackConfigs:  # Support multiple fallbacks
        -
          SNI: # TLS SNI(Server Name Indication), Empty for any
          Path: # HTTP PATH, Empty for any
          Dest: 80 # Required, Destination of fallback, check https://xtls.github.io/config/fallback/ for details.
          ProxyProtocolVer: 0 # Send PROXY protocol version, 0 for dsable
      CertConfig:
        CertMode: none # Option about how to get certificate: none, file, http, dns. Choose "none" will forcedly disable the tls config.
        CertDomain: "$CertDomain" # Domain to cert
        CertFile: ./cert/node1.test.com.cert # Provided if the CertMode is file
        KeyFile: ./cert/node1.test.com.key
        Provider: cloudflare # DNS cert provider, Get the full support list here: https://go-acme.github.io/lego/dns/
        Email: test@me.com
        DNSEnv: # DNS ENV option used by DNS provider
          CLOUDFLARE_EMAIL: nhkservervpn@gmail.com
          CLOUDFLARE_API_KEY: 20ddd8957fa907c2c3ac6f49497fb05ab40e7
EOF

else

  echo "---------------------------"
  echo -e "${green}Đặt số nút Trên Web V2Board-Trojan+V2ray${plain}"
  echo ""
  read -p "Vui lòng nhập node ID :" nhk_node_id
  [ -z "${nhk_node_id}" ]
  echo "---------------------------"
  echo -e "${green}Node ID của bạn đặt là: ${nhk_node_id}${plain}"
  echo "---------------------------"
  echo ""

  echo "Tên Miền của nút Trojan 'testcode.aikocute.com'"
  echo ""
  read -p "Vui lòng Nhập domain :" nhk_domain
  [ -z "${nhk_domain}" ]
  echo "---------------------------"
  echo -e "${green}Tên miền của bạn đặt là: ${nhk_domain}${plain}"
  echo "---------------------------"

  wget https://raw.githubusercontent.com/AikoCute/Aiko-Config/nhk/Config-Trojan%2BVmess.yml -O /etc/XrayR/config.yml
  sed -i "s/NodeID:.*/NodeID: ${nhk_node_id}/g" /etc/XrayR/config.yml
  sed -i "s/CertDomain:.*/CertDomain: ${nhk_domain}/g" /etc/XrayR/config.yml
fi
