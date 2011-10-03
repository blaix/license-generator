# OSS License Generator

Generate an open source license for your projects.

## Installation

    gem install license-generator

## Usage:

    lickjen [license]

Too see the available license templates:

    lickjen list

### Please add some!

There are a lot. See <http://www.opensource.org/licenses/alphabetical>.

Simply fork, add an ERB template to the `templates` directory, and send me a
pull request.

Since it's ERB you can use ruby to include things like the current date. You
can also prompt the user for input like this:

    <%= option(:name) %>

## Credits

* Justin Blake <justin@hentzia.com>
* Bill Evans (help naming the binary and pushing to make it not hard to add
  templates).