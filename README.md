# Paged media boilerplate

A simple boilerplate to create book-quality pdfs by writing in [Jade](http://jade-lang.com/), [Stylus](https://learnboost.github.io/stylus/) and
[Coffeescript](http://coffeescript.org/)
and converting with [Prince][prince]

## Getting Started
### Requirements
* [Prince][prince_dl]
* [Node & NPM](http://nodejs.org/)
* Grunt (`npm install -g grunt-cli`)
* Bower (`npm install -g bower`)

### Setting up prince 

Download and install prince from their [page][prince_dl].

Make sure `prince` is accessible from your `PATH` (Try `prince ` in your Terminal). 

### Install

clone repository or download ZIP and extract

run
```
npm install
bower install
```

[prince]: http://www.princexml.com/
[prince_dl]: http://www.princexml.com/download/

## Documentation
`grunt` will compile Jade/Stylus/Coffeescript to HTML/CSS/JS and watch for changes.
 
The document is served to `localhost:9000`.

HTML/CSS/JS will also be converted to `compiled.pdf` by [Prince][prince], which supports the required CSS 3 features.

***Note:*** Several CSS 3 features are not supported by any browser. (Margins, Pagesize, ...)



## Release History

 - *v0.0.1*: First Release

## License
Copyright (c) 2014 Paul Pflugradt
Licensed under the MIT license.
