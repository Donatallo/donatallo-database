#!/bin/sh -e
#
# This is a script for reproducible payment method icons retrieval
#
# Requires:
# - wget (for fetching images)
# - convert (utility from ImageMagick package, for format conversion)
# - optipng (for png optimization)
#

maskargs="mask.png -alpha Off -compose CopyOpacity -composite"

for file in "$@"; do
	echo "===> $file"
	case $file in
	paypal.png)
		wget http://paypal.com/favicon.ico -qO- | convert 'ico:-[0]' $file
		;;
	bitcoin.png)
		wget https://upload.wikimedia.org/wikipedia/commons/4/46/Bitcoin.svg -qO- | convert -size 32x32 -depth 8 -background transparent svg:- $file
		;;
	flattr.png)
		wget https://flattr.com/images/favicons/favicon-32x32.png -qO $file
		;;
	yandex_money.png)
		wget https://money.yandex.ru/favicon.ico -qO- | convert 'ico:-[2]' $file
		;;
	cheque.png)
		wget http://icons.iconarchive.com/icons/fatcow/farm-fresh/32/cheque-icon.png -qO $file
		;;
	webmoney.png)
		# also may use https://www.webmoney.ru/img/wmkeeper_32x32.png, not sure which is more recognizable
		wget https://www.webmoney.ru/img/icons/wmlogo_32.png -qO $file
		;;
	western_union.png)
		# crap
		#wget https://www.westernunion.com/etc/designs/wu/favicon.ico -qO- | convert 'ico:-' $file
		;;
	clickandpledge.png)
		# ugly 16x16 px crap
		#wget https://clickandpledge.com/favicon.ico -qO- | convert 'ico:-' clickandpledge.png
		# convert gives blurry image
		#wget https://forums.clickandpledge.com/core/avatars/0/0/1/7/4/5/avatar1_8.png -qO- | convert -channel rgba -resize 32x32 'png:-' $file
		;;
	amazon.png)
		wget http://www.amazon.com/favicon.ico -qO- | convert 'ico:-[1]' $file
		;;
	patreon.png)
		wget https://s3.amazonaws.com/patreon_public_assets/favicons/favicon-96x96.png -qO- | convert -channel rgba -resize 32x32 'png:-' $file
		;;
	litecoin.png)
		wget https://litecoin.org/images/favicon/favicon-32x32-72a26c12.png -qO $file
		;;
	stripe.png)
		wget https://stripe.com/favicon.ico -qO- | convert 'ico:-[1]' $maskargs $file
		;;
	bountysource.png)
		#wget https://www.bountysource.com/favicon.ico -qO- | convert 'ico:-' bountysource.png
		wget https://cloudinary-a.akamaihd.net/bountysource/image/upload/d_noaoqqwxegvmulwus0un.png,c_pad,w_100,h_100,b_white/caxnpzz0uhmvxk9jfmz4.png -qO- | convert -channel rgba -resize 32x32 -depth 8 png:- $maskargs $file
		;;
	dash.png)
		wget https://www.dash.org/wp-content/uploads/2016/04/cropped-dash_icon_l-e1460606172897-1-32x32.png -qO $file
		;;
	anoncoin.png)
		wget https://anoncoin.net/anoncoin-logo@2x.png -qO- | convert -channel rgba -resize 32x32 'png:-' $file
		;;
	monero.png)
		wget https://getmonero.org/favicon-96x96.png -qO- | convert -channel rgba -resize 32x32 'png:-' $file
		;;
	tibit.png)
		wget https://tibit.com/favicon.ico -qO- | convert 'ico:-[0]' $maskargs $file
		;;
	*)
		echo "$1 not supported, likely was crafted by hand"
		;;
	esac

	optipng -q -o99 $file
done
