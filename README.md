betterBuster
============

betterBuster allows you to connect the amazing blogging platform [ghost](http://ghost.org) to [GitHub pages](https://pages.github.com/) to make your entire blogging experience open source. 

Create a git repo from scratch or add an existing setup to betterBuster. 

*Generate Static Pages. Preview. Deploy to Github Pages.*

# The interface

`setup`
Use if you currently do not have a git repo created on your machine. `setup` creates a git repo for you adds site to the sites config to use later. 

`add`
Like `setup` but use this if you already have a git repo created.

`remove`
Removes existing site from your site config file. 

`generate`
Generates static HTML files from your locally running Ghost instance so you can then push up to GitHub pages.

`preview`
Before deploying to GitHub pages, preview your changes locally on `localhost:9000`.

`deploy`
Commits and pushes git changes to GitHub repository on the appropriate branch. *Make sure to run `generate` before this.*

`add-domain`
Adds CNAME file to local directory where site is located to allow a custom domain on your ghost blog.

## Installation

1. Clone the repo: `git clone git@github.com:levibostian/betterBuster.git` 
2. Go into the root of betterBuster: `cd betterBuster`. 
3. Install ruby dependencies: `bundler install`
4. Now run the program. Use this command to check out what betterBuster can do: `ruby lib/main.rb -h` 

## Requirements

* wget: Use `brew install wget` to install wget on your Mac.
  *wget is available by default on most linux distributions.*
  
* [bundler](http://bundler.io/)

## Ghost. What?

[Ghost](http://ghost.org/features/) is a beautifully designed, completely customisable and completely [Open Source](https://github.com/TryGhost/Ghost) **Blogging Platform**. If
you haven't tried it out yet, check it out. You'll love it.

The Ghost Foundation is not-for-profit organization funding open source software and trying to completely change the world of online publishing.
Consider [donating to Ghost](http://ghost.org/about/donate/).

## *better*Buster? What is so much better then the original?

[The original Buster](https://github.com/axitkhurana/buster) is inspired by THE GhostBusters.

![Ghost Buster Movie Poster](http://upload.wikimedia.org/wikipedia/en/c/c7/Ghostbusters_cover.png)

[This project](https://github.com/levibostian/betterBuster)
is inspired from the original buster. When I was looking to use Ghost with Github pages, buster was exactly what I
was looking for. Great piece of software I give lots of credit but there were a few things about buster that I wanted, well, done better.    

## Contributing

If you are hoping to add an even better experience to betterBuster, check out the existing
[issues](https://github.com/levibostian/betterBuster/issues) or simply
fork the repo, make some edits, and make a pull request.

If you are looking to add more solid features to the original buster project, check out it's [issues](https://github.com/axitkhurana/buster/issues)
page and contribute there as well.


*Made with* [jugaad](http://en.wikipedia.org/wiki/Jugaad) *in*
[Dilli](http://en.wikipedia.org/wiki/Delhi).
