# Middleman styleguide template

Middleman styleguide template is a starting point for building a static HTML styleguide with the aid of KSS, Markdown and Middleman. Great for creating design guidelines, too.

## Installation

Clone the repository:

	git clone git://github.com/Darep/middleman-styleguide-template.git

And remove the .git directory

	cd middleman-styleguide-template
	rm -rf .git

And then execute:

	bundle

And start Middleman:

	middleman

Now you can start working on your styleguide!

## Usage

Place the CSS/SCSS/SASS/Less with KSS comments into `source/stylesheets/external/`.

Then add the HTML required to render the style block(s) into `source/styleblocks`. Style block templates need to start with an _, e.g. _buttons.html.erb.

After this, you can render a style block on any page and anywhere by writing:

	<%= styleblock 'buttons', section: '1.1' %>

If you don't want to add the KSS information to the style block, and simply just render the HTML in the template file, leave the section parameter out:

	<%= styleblock 'buttons' %>

See [source/index.html.erb](https://github.com/Darep/middleman-styleguide-template/blob/master/source/index.html.erb), [source/styleguide.erb](https://github.com/Darep/middleman-styleguide-template/blob/master/source/styleguide.erb) and [source/styleblocks/_buttons.html.erb](https://github.com/Darep/middleman-styleguide-template/blob/master/source/styleblocks/_buttons.html.erb) for exmaples! 

## License

Licensed under the MIT license.

Copyright (c) 2013 Antti-Jussi Kovalainen and Solita Oy

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
