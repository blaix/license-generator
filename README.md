# OSS License Generator

Generate an open source license for your projects.

## Installation

    gem install license-generator

## Usage:

    licgen [license]

Too see the available license templates:

    licgen list

### Please add some!

There are a lot. See <http://www.opensource.org/licenses/alphabetical>.

Simply fork, add an ERB template to the `templates` directory, and send me a
pull request.

Since it's ERB you can use ruby to include things like the current date. You
can also prompt the user for input like this:

    <%= option(:name) %>

## Credits

* Bill Evans (@thirteenpixels) for help naming the binary and pushing to make
  it not hard to add templates.
* Dayton Nolan (@daytonn) for fixes and new templates.
