password=${1}
channel=${2:-6}

sudo nmcli c add type wifi ifname wlan0 con-name hotspot ssid malina-wifi
sudo nmcli c modify hotspot 802-11-wireless.mode ap ipv4.method shared
sudo nmcli c modify hotspot 802-11-wireless.band bg 802-11-wireless.channel $channel
sudo nmcli c modify hotspot wifi-sec.key-mgmt wpa-psk wifi-sec.proto rsn
sudo nmcli c modify hotspot wifi-sec.psk $password
sudo nmcli c up hotspot

# sudo nmcli c down hotspot
# sudo nmcli -f NAME,UUID,TYPE -t c
# sudo nmcli c del <uuid>
