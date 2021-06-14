#! /bin/bash
function checknet(){
  if ping -c 1 8.8.8.8 &> /dev/null
    then
      main
  else
    echo "[-] Connect to Internet"
    exit 0
  fi

}
function main(){
  echo -e "\n# SYSTEM WAN IP INFO\n"
  if command -v dig > /dev/null
    then
      echo "- Using dig"
      ipv4=`dig -4 TXT +short o-o.myaddr.l.google.com @ns1.google.com|tr -d '"'`
      ipv6=`dig -6 TXT +short o-o.myaddr.l.google.com @ns1.google.com|tr -d '"'`
      echo "[+] ipv4 : $ipv4"
      echo "[+] ipv6 : $ipv6"
      exit 0
  elif command -v curl > /dev/null
    then
      echo "- Using curl"
      ipv4=`curl ipv4.icanhazip.com 2>/dev/null`
      ipv6=`curl ipv6.icanhazip.com 2>/dev/null`
      echo "[+] ipv4 : $ipv4"
      echo "[+] ipv6 : $ipv6"
      exit 0
  fi
}

## Main ##
checknet


