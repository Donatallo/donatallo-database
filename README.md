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
own judgment.

## Validation

YAML schemas may be validated with [kwalify](http://www.kuwata-lab.com/kwalify/).
Install kwalify and run ```make``` to perform schema validation.

## Author

* [Dmitry Marakasov](https://github.com/AMDmi3) <amdmi3@amdmi3.ru>

## License

[![Creative Commons License](https://i.creativecommons.org/l/by-sa/4.0/88x31.png)](http://creativecommons.org/licenses/by-sa/4.0/)

This work is licensed under a Creative Commons Attribution-ShareAlike 4.0 International License.
