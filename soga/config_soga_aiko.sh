#!/bin/bash
echo "Config_soga_aiko"
  read -p "Node ID :" id_aiko_soga
	echo "---------------"
	read -p "Ip or Domain :" Domain_aiko_soga
	echo "---------------"

	rm -f /etc/soga/soga.conf
	if [[ -z $(~/.acme.sh/acme.sh -v 2>/dev/null) ]]; then
		curl https://get.acme.sh | sh -s email=script@github.com
		source ~/.bashrc
		bash ~/.acme.sh/acme.sh --upgrade --auto-upgrade
	fi
         cat <<EOF >/etc/soga/soga.conf
#config Aiko
type=v2board
server_type=v2ray
node_id=$id_aiko_soga
soga_key=50FuF2DfleD1qDBQfAeH7aFK6g51JBMB

api=webapi

webapi_url=https://aikocute.com
webapi_key=adminadminadminadminadmin

db_host=db.domain.com
db_port=3306
db_name=
db_user=root
db_password=

cert_file=
key_file=

cert_mode=http
cert_domain=$Domain_aiko_soga
cert_key_length=ec-256
dns_provider=dns_cf

default_dns=8.8.8.8,1.1.1.1
dns_cache_time=10
dns_strategy=ipv4_first

v2ray_reduce_memory=true
vless=
vless_flow=

proxy_protocol=false

redis_enable=false
redis_addr=
redis_password=
redis_db=0
conn_limit_expiry=60

user_conn_limit=3
user_speed_limit=0
node_speed_limit=0
check_interval=100
force_close_ssl=true
forbidden_bit_torrent=true
log_level=info

EOF
soga start