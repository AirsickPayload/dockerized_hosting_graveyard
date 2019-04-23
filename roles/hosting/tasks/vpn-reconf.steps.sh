#!/usr/bin/env bash

echo "Type your domain, for example [myvpn.mydomain.com]: "
read domain
docker volume create --name vpnvolume
docker run -v vpnvolume:/etc/openvpn --rm kylemanna/openvpn ovpn_genconfig -u udp://$domain
docker run -v vpnvolume:/etc/openvpn --rm -it kylemanna/openvpn ovpn_initpki
docker run -v vpnvolume:/etc/openvpn --rm -it kylemanna/openvpn easyrsa build-client-full alanclient nopass
