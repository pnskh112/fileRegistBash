#!/bin/bash
export DISPLAY='unix:0.0'
#*******************************************************************************
#
#  zipファイルを解凍し、配置後に都度バッチ実行する
#
#*******************************************************************************
# エラーハンドリングのために必要。
# -e: エラーが発生したら（exit statusが0以外だったら）スクリプトの実行を終了する
# -o pipefail: パイプラインの途中でエラーが発生してもスクリプトの実行を終了する
set -e -o pipefail

dir="/home/clbdynac/data/tmp/Dcat_Link_kyakusu_doko/backup"
zipfile="IMP_CUSTOMER_TREND.ZIP"
csvfile="IMP_CUSTOMER_TREND.CSV"

for filepath in ${dir}/*; do
  echo ${filepath}
  if [ -d ${filepath} ] ; then
    echo ${filepath}/${zipfile}
    unzip -o -d ${filepath} ${filepath}/${zipfile}
    cp ${filepath}/${csvfile} ${filepath}/../../
    /usr/local/bin/php /home/clbdynac/batch/daily_imp_bt_salesdata_total_trend.php
    # break;
  fi
done

exit 0

