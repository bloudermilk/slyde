# Slyde

Slyde is a Markdown-based slide authoring and presentation tool written in Ruby
and JavaScript.

**Warning:** Slyde is currently in a very alpha state. It's semi-broken and
lacking some pretty fundamental features. Please see the [issues][issues] page
for more information.

[issues]: https://github.com/bloudermilk/slyde/issues

## How it works

Slyde takes normal markdown files and parses them into indavidual slides by
using first, second, and third-level headers as page breaks. Then it serves
those slides over HTTP using a simple Sinatra backend. 

## Why use Slyde?

* **Rapid content development:** Creating a new presentation is as easy as
  writing some Markdown and running `rackup`. No more bloated WYSIWYG!
* **Collaborative content:** Traditional slide presentation tools like
  PowerPoint and Keynote make it nearly impossible to collaborate on
  presentations. By using Markdown as the basis for slide content, authors can
  use Git or any version control system to collaborate on a single
  presentation effectively.
* **Portability:** Since presentations are witten in Markdown, one can use any
  number of Markdown-based tools to distribute content. 

## Installation

Install the latest verison of Slyde:

```bash
$ gem install slyde
```

Start a new presentation using the `slyde` command:

```bash
$ slyde my_new_presentation
```

Change directories into your new project:

```bash
$ cd my_new_presentation
```

Start a Rack server:

```bash
$ rackup
```

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## License

Slyde is an open source software project released under the MIT license. See
`MIT-LICENSE.txt` in the project root for more details.
