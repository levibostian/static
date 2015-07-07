# static

Static website generator to push dynamic website to GitHub pages for static hosting.

*Generate Static Pages from existing static/dynamic website. Preview. Deploy to GitHub Pages.*

![logo](logo.png)

# The interface

`setup`
Use if you currently do not have a git repo created on your machine. `setup` creates a git repo for the website to push up to GitHub pages. 

`add`
Like `setup` but use this if you already have a git repo created.

`remove`
Removes existing site from your site config file. Does not delete content, just removes website from static's site list.

`generate`
Generates static HTML files from your locally running website so you can then push up to GitHub pages.

`preview`
Before deploying to GitHub pages, preview your changes locally on `localhost:9000`.

`deploy`
Commits and pushes git changes to GitHub repository on the appropriate branch. *Make sure to run `generate` before this.*

`add-domain`
Adds CNAME file to local directory where site is located to allow a custom domain on your website.

## Installation

First, make sure you follow the [requirements](#requirements) section before continuing on!

1. Clone the repo: `git clone git@github.com:levibostian/static.git` 
2. Go into the root of static: `cd static`. 
3. Install ruby dependencies: `bundler install`
4. Now run the program. 
Use this command to check out what static can do: `ruby lib/main.rb -h` 

## Requirements

* [the ruby programming language](https://www.ruby-lang.org/en/documentation/installation/)
* wget: Use `brew install wget` to install wget on your Mac. There are ways to get wget on Windows, I just don't know how and have never tested it. If you figure out a way, make a pull request in here on how to do it. 
  *wget is available by default on most linux distributions.*
  
* [bundler](http://bundler.io/)

## Contributing

If you are hoping to add an even better experience to static, check out the existing
[issues](https://github.com/levibostian/static/issues) or simply
fork the repo, make some edits, and make a pull request.
