# menulator

<a href="http://travis-ci.org/spadin/menulator">
  <img src="https://secure.travis-ci.org/spadin/menulator.png?branch=master" />
</a> 
<a href="https://codeclimate.com/github/spadin/menulator">
  <img src="https://codeclimate.com/badge.png" />
</a>

menulator takes a menu and calculates every combination of menu items
possible given a target price.

## Usage

    $ cd menulator
    $ bin/menulator [--file ./menu.txt] [--target-price 15.05]

## Menus

The following menu format is expected.

* First line must be the target price.
* Item name and item price must be comma-delimited
* No whitespace on either side of the delimiter.

Example:

    $15.05
    mixed fruit,$2.15
    french fries,$2.75
    side salad,$3.35
    hot wings,$3.55
    mozzarella sticks,$4.20
    sampler plate,$5.80


## Running Specs

    $ bundle install
    $ rake
