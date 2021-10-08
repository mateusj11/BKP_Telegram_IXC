###Envio de backups IXC Telegram
## https://github.com/mateusj11/BKP_Telegram_IXC

#!/bin/bash

#Busca Informações para envio das mensagens do Telegram
source ./telegram.sh

##Declarando Variaveis de Data###
	var_dia=`date +%d`
	var_mes=`date +%m`
	var_ano=`date +%Y`
	var_hora=`date +%H:%M:%S`

##Declara nome do Backup para envio
nome_bkp_para_envio=`ls -lt /var/www/bkp | grep BKP* | awk '{ print $9}'| sort | head -1  `

##Declara caminho do Backup que sera enviado
caminho_bkp_para_envio=/var/www/bkp/$nome_bkp_para_envio


##Envia o Backup
curl -F document=@"${caminho_bkp_para_envio}" -F caption="BKP $nome_bkp_para_envio $var_data, envio as $var_hora" "https://api.telegram.org/bot${TOKEN}/sendDocument?chat_id=$CHAT_ID" &>/dev/null