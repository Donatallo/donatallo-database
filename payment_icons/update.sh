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
wget http://paypal.com/favicon.ico -qO paypal.png # not really an ICO

echo "===> Bitcoin"
wget https://upload.wikimedia.org/wikipedia/commons/4/46/Bitcoin.svg -qO- | convert -size 32x32 -depth 8 -background transparent svg:- bitcoin.png

echo "===> Flattr"
wget https://flattr.com/images/favicons/favicon-32x32.png -qO flattr.png

echo "===> Yandex.Money"
wget https://money.yandex.ru/favicon.ico -qO- | convert 'ico:-[2]' yandex_money.png

echo "===> Cheque"
wget http://icons.iconarchive.com/icons/fatcow/farm-fresh/32/cheque-icon.png -qO cheque.png # cc-by

echo "===> WebMoney"
# also may use https://www.webmoney.ru/img/wmkeeper_32x32.png, not sure which is more recognizable
wget https://www.webmoney.ru/img/icons/wmlogo_32.png -qO webmoney.png

echo "===> Western Union"
wget https://www.westernunion.com/etc/designs/wu/favicon.ico -qO- | convert 'ico:-' western_union.png

echo "===> Click & Pledge"
wget https://clickandpledge.com/favicon.ico -qO- | convert 'ico:-' clickandpledge.png

echo "===> Amazon"
wget http://www.amazon.com/favicon.ico -qO- | convert 'ico:-[1]' amazon.png

echo "===> Patreon"
wget https://s3.amazonaws.com/patreon_public_assets/favicons/favicon-96x96.png -qO- | convert -channel rgba -resize 32x32 'png:-' patreon.png

echo "===> Litecoin"
wget https://litecoin.org/images/favicon/favicon-32x32-72a26c12.png -qO litecoin.png

echo "===> Stripe"
wget https://stripe.com/favicon.ico -qO- | convert 'ico:-[1]' stripe.png

echo "===> Bountysource"
#wget https://www.bountysource.com/favicon.ico -qO- | convert 'ico:-' bountysource.png
wget https://cloudinary-a.akamaihd.net/bountysource/image/upload/d_noaoqqwxegvmulwus0un.png,c_pad,w_100,h_100,b_white/caxnpzz0uhmvxk9jfmz4.png -qO- | convert -channel rgba -resize 32x32 -depth 8 png:- bountysource.png

echo "===> Optimizing"
optipng -q -o99 *.png
