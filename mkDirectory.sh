#!/bin/bash
export DISPLAY='unix:0.0'
#*******************************************************************************
#
#  フォルダを作成する
#
#*******************************************************************************
# エラーハンドリングのために必要。
# -e: エラーが発生したら（exit statusが0以外だったら）スクリプトの実行を終了する
# -o pipefail: パイプラインの途中でエラーが発生してもスクリプトの実行を終了する
set -e -o pipefail

dir="/home/clbdynac/data/tmp/Dcat_Link_kyakusu_doko/backup"

num='01'

for i in {1..31}; do
  subDir=`printf %02d $i`
  sleep 1s
  echo ${dir}/${subDir}
  mkdir ${dir}/${subDir}
done

