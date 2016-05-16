# Donatallo donations database

[![Build Status](https://travis-ci.org/Donatallo/donatallo-database.svg?branch=master)](https://travis-ci.org/Donatallo/donatallo-database)

This is a database of FLOSS projects accepting donations for
[Donatallo](https://github.com/Donatallo) project.

## Data

We store basic project info (name, short description and URL),
donation info (donation page URL and list of donation methods) and
detection info (package names). The original idea was to store
all donation credentials (e.g. BitCoin wallet hashes, PayPal IDs
etc.), but it is believed that it's safer to just store URLs of
upstream donation pages, because credentials are subject to change
and there's no guarantee that up to date database is always used,
which may lead to donations lost or went to wrong recipient.

## Policy

There's no clear policy on what projects may or may not be added
to the database for now, though it's likely to be made up later.
Author reserves the right to moderate the database based on his
own judgment. The rule of thumb is that the project should be
[free software](https://en.wikipedia.org/wiki/Free_software) or
other kind of free cultural work (data, knowledge, hardware, etc.).
Among software, cross-platform projects are strongly preferred.

## Schema

Database consists of ```meta.yml``` file which contains schema
version and a list of data files. Each data file is an array of
entries with following fields:

* ```name``` - name of the project
* ```comment``` - short (up to 70 chars) project description
* ```url``` - project home page
* ```donations``` - (optional) address of dedicated donations page
* ```location``` - (optional) home country of the project (for example, where NPO was registered in)
* ```methods``` - list of donation methods (see below)
* ```detection``` - ways to detect that user (see below)
* ```added``` - date in YYYY-MM-DD format of when the project was added to the database
* ```last_checked``` - date of when the project data was verified last time

### Donation methods

* ```amazon``` - [Amazon Payments](https://payments.amazon.com/)
* ```anoncoin``` - [Anoncoin](https://anoncoin.net/) privacy-centric cryptocurrency
* ```bank_transfer``` - Bank transfer
* ```bitcoin``` - [Bitcoin](https://bitcoin.org/) cryprocurrency
* ```bountysource``` - [BountySource](https://www.bountysource.com/) funding platform for open-source software
* ```cheque``` - Check/cheque
* ```clickandpledge``` - [Click&Pledge](https://clickandpledge.com/) fundraising service
* ```credit_card``` - Credit card
* ```dash``` - [Dash](https://dash.org/) cryptocurrency
* ```dwolla``` - [Dwolla](https://www.dwolla.com/) online payment system
* ```flattr``` - [Flattr](https://flattr.com/) microdonation service
* ```hardware``` - Hardware donations
* ```litecoin``` - [Litecoin](https://litecoin.org/) cryptocurrency
* ```merchandise``` - Possible to donate through purchasing merchandise
* ```monero``` - [Monero](https://getmonero.org/) cryptocurrency
* ```patreon``` - [Patreon](https://www.patreon.com/) crowdfunding platform
* ```paypal``` - [PayPal](https://www.paypal.com/) online payments system
* ```pledgie``` - [Pledgie](https://pledgie.com/) online fundraising service
* ```stripe``` - [Stripe](https://stripe.com/) web and mobile payments service
* ```tibit``` - [tibit](https://tibit.com/) micro-rewards, micro-payments, online tipping service
* ```webmoney``` - [WebMoney](http://www.wmtransfer.com/) online payment solution
* ```western_union``` - [Western Union](https://westernunion.com/) money transfers
* ```yandex_money``` - [Yandex.Money](https://money.yandex.ru/) (Russian: Яндекс.Деньги) electronic payment service

### Detection ways

Desktop applications working with donatallo database may use this
info to filter project relevant to specific user.

* ```always``` - always matches (used for testing purposes)
* ```file-in-etc``` - check for existence of specific file in /etc
* ```opsys``` - check operating system type
* ```pkgnames``` - list of package names to look for among locally installed packages
* ```uname-s``` - check against ```uname -s``` output

## Validation

YAML schemas may be validated with [kwalify](http://www.kuwata-lab.com/kwalify/).
Install kwalify and run ```make``` to perform schema validation.

## Author

* [Dmitry Marakasov](https://github.com/AMDmi3) <amdmi3@amdmi3.ru>

## License

[![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)

This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
