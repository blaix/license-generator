# OSS License Generator

Generate an open source license for your projects.

## Usage:

    lickjen [license] [options]

I thought a phonetic spelling would be easy to remember. My apologies to
anyone named Jennifer.

## Supported licenses:

* [The BSD License](http://www.opensource.org/licenses/bsd-license.php)

        lickjen bsd --name=[your name] --organization=[your organization]

### Please add some!

There are a lot. See <http://www.opensource.org/licenses/alphabetical>.

1. Fork the project
2. Create a branch for your new license.
3. Add a cucumber feature for your license: see `features/bsd_license.feature` for an example.
4. Add a spec for your new license task to `spec/app_spec.rb`. Use the others as reference.
5. Add your license task to `lib/license-generator/app.rb` and license template to `templates/[license].erb`. Use the others as reference.
6. Add your new license to this README under "Supported licenses".
7. Push it and send a pull request.
8. I will pull it, bump the version number, and add you to the credits for fame and glory.

## Credits

* Justin Blake <justin@hentzia.com>
* Bill Evans (help naming the binary)