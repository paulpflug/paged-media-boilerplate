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

### Table of contents
Put a div with the ID `toc` anywhere and call `window.generateTOC()` on load.
This will create a TOC based on the headings you used.
Links and a pdf specific toc are inclusive and free ;)
Association:
```
h2 - Chapter
h3 - Section
h4 - Subsection
```

`h5` will create a heading with a horizontal line

### Figures
```jade
figure#horses.pull-left
  img(src="../resources/images/horses.JPG")
  figcaption Horses
```
will put a left-floating image in the document
To make a reference use:
```jade
a.fig(href="#horses")
```

### Data
You can put arbitrary data in the `index.json` and access it within your `index.jade`
```json
{
  "stuff" : "specific string"
}
```
will be accessible like this:
```jade
p=stuff
```
and result in this
```html
<p>specific string</p>
```
### Scripts
You can write your own scripts to manipulate your text/style/whatever.
All `.coffee` files in docs directory are compiled to `.js`, don't forget to wire up the js files in the `index.jade`.
If you don't want to use coffeescript, just put your js files in the `resources` directory or write a grunt-copy task for copying the js files from `docs` to `docs_compiled` (the `docs` folder will not be served to the browser).

Or use existing scripts.
If you found something with bower support you want to use, just run
`bower install "name-of-awesome-script"` to download and extract it and `grunt bowerInstall` to wire it up (doesn't work with some scripts, but will print an error message if not working).

A script without bower support is best stored in the `resources` folder. Don't use npm for client side scripts, as the `node_modules` folder is not shared with the browser.

### Style
You can fully customize the style. The current style is located in `docs/index.styl`.

All installed fonts can be used by their name. If you want to make them portable, put them in the `resource` directory and wire them up in the `index.styl` (an example is included).

## Usefull stuff
Here a very usefull script for hyphenation:
[hyper](https://github.com/bramstein/hypher) (no bower support)
Note, that it will slow compilation down, so ideally include it only during finalization.





## Release History

 - *v0.0.1*: First Release

## License
Copyright (c) 2014 Paul Pflugradt
Licensed under the MIT license.
