#!/bin/sh -e
#
# This is a script for reproducible payment method icons retrieval
#
# Requires:
# - wget (for fetching images)
# - convert (utility from ImageMagick package, for format conversion)
# - optipng (for png optimization)
#

echo "===> Paypal"
wget http://paypal.com/favicon.ico -qO paypal.png # not really and ICO

echo "===> BitCoin"
wget https://upload.wikimedia.org/wikipedia/commons/4/46/Bitcoin.svg -qO- | convert -size 32x32 -depth 8 -background transparent svg:- bitcoin.png

echo "===> Flattr"
wget https://flattr.com/images/favicons/favicon-32x32.png -qO flattr.png

echo "===> Yandex.Money"
wget https://money.yandex.ru/favicon.ico -qO- | convert 'ico:-[2]' yandex_money.png

echo "===> Cheque"
# cc-by
wget http://icons.iconarchive.com/icons/fatcow/farm-fresh/32/cheque-icon.png -qO cheque.png

echo "===> WebMoney"
wget http://www.wmtransfer.com/favicon.ico -qO- | convert 'ico:-[0]' webmoney.png

echo "===> Western Union"
wget https://www.westernunion.com/etc/designs/wu/favicon.ico -qO- | convert 'ico:-' western_union.png

echo "===> Optimizing"
optipng -q -o99 *.png
