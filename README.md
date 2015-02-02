[![Stories in Ready](https://badge.waffle.io/levibostian/betterbuster.png?label=ready&title=Ready)](https://waffle.io/levibostian/betterbuster)
[![Build Status](https://travis-ci.org/levibostian/betterBuster.svg?branch=master)](https://travis-ci.org/levibostian/betterBuster)
[![Coverage Status](https://coveralls.io/repos/levibostian/betterBuster/badge.png?branch=coveralls)](https://coveralls.io/r/levibostian/betterBuster?branch=coveralls)

# NOTE: README out of date. Program works great, but this README is a little outdated with what this can do and this is for Python, not Ruby. 

BetterBuster
============

Super simple, Totally awesome, Brute force **static site generator for**
[Ghost](http://ghost.org).

~~Start with a clean, no commits Github repository.~~

*Generate Static Pages. Preview. Deploy to Github Pages.*

*Note: BetterBuster acts as a replacement for the original buster, so the script/executable is still
named 'buster' instead of 'betterBuster' as all of the original functionality of buster exists with
more features and added UX components.*

## The interface

*Don't forget to first edit your blog site in the sites-config.js file. (if file does not exist,
run ```buster``` by itself and one will be generated)*

```setup```
Whips out directory location, creates and configures new git repo, adds new site to sites-config.json.

```add```
Adds new site to sites-config.json.

```remove```
Removes existing site from sites-config.json

```generate```
Generates static pages from locally running Ghost instance.

```preview```
Preview what's generated on ```localhost:9000```.

```deploy```
Commits and deploys changes static files to Github repository.

```add-domain```
Adds CNAME file to local directory where site is located.

## The Installation

~~Installing Buster is easy with pip:~~
~~$ pip install buster~~
*Currently not in pip.*

You'll then have the wonderful ```buster``` command available.

You could also clone the source and use the ```buster.py``` file directly.

## Requirements

* wget: Use ```brew install wget``` to install wget on your Mac.
  *Available by default on most linux distributions.*

The following python packages would be installed automatically when
installed via ```pip```:

* [docopt](https://github.com/docopt/docopt): Creates beautiful command line interfaces easily.
* [GitPython](https://github.com/gitpython-developers/GitPython) - Python interface for GIT.

## Ghost. What?

[Ghost](http://ghost.org/features/) is a beautifully designed, completely customisable and completely [Open Source](https://github.com/TryGhost/Ghost) **Blogging Platform**. If
you haven't tried it out yet, check it out. You'll love it.

The Ghost Foundation is not-for-profit organization funding open source software and trying to completely change the world of online publishing.
Consider [donating to Ghost](http://ghost.org/about/donate/).

## Better Buster?

[The original Buster](https://github.com/axitkhurana/buster) is inspired by THE GhostBusters.

![Ghost Buster Movie Poster](http://upload.wikimedia.org/wikipedia/en/c/c7/Ghostbusters_cover.png)

[This project](https://github.com/levibostian/betterBuster)
is inspired from the original buster. When I was looking to use Ghost with Github pages, buster was exactly what I
was looking for. Great piece of software I give lots of credit but I was simply enjoying my continuous Github repo
always being scratched every blog update I created and writing long command-line instructions when I wanted to use it.

## Contributing

If you are hoping to add an even better experience to betterBuster, check out the existing
[issues](https://github.com/levibostian/betterBuster/issues) or simply
fork the repo, make some edits, and make a pull request.

If you are looking to add more solid features to the original buster project, check out it's [issues](https://github.com/axitkhurana/buster/issues)
page and contribute there as well.


*Made with* [jugaad](http://en.wikipedia.org/wiki/Jugaad) *in*
[Dilli](http://en.wikipedia.org/wiki/Delhi).
