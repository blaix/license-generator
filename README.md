# OSS License Generator

Generate an open source license for your projects.

## Installation

    gem install license-generator

## Usage:

    licgen <license> [<author1>, [<author2> ...]]

Too see the available license templates:

    licgen list

## Available licenses

They are provided in the gem as [templates](templates/).

### Please add some!

There are a lot. See <http://www.opensource.org/licenses/alphabetical>.

Simply fork, add an ERB template to the `templates` directory, and send me a
pull request.

Since it's ERB you can use ruby to include things like the current date. You
can also prompt the user for input like this:

    <%= option(:name) %>

Since author name will be needed for almost all templates, a special template
variable is provided:

    <%= authors %>

If authors are not specified on the command line, it will prompt the user.
