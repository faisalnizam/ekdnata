#! /bin/bash 


echo "Setup Environment" 

# Using source func/help.py


DR=/usr/local/bin/docker 
PY=/usr/bin/python 



while getopts 'p:r:n:u:h' OPT; do
  case $OPT in
    p)  profile=$OPTARG;; 
    n)  env_name=$OPTARG;;
    h)  ${PY} `func/help.py` 
	exit 
	;;
  esac
done

profile=${profile:=unknown} 
env_name=${env_name:=unknown}
