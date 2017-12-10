# amber_render_module

**Amber** is a web application framework written in [Crystal](http://www.crystal-lang.org) inspired by Kemal, Rails, Phoenix and other popular application frameworks.  Normally with Amber artifacts for a feature live in directories for the type of artifact, e.g.

```
src/controllers/post_controller.cr
src/models/post.cr
src/views/post/_form.slang
src/views/post/edit.slang
src/views/post/index.slang
src/views/post/new.slang
src/views/post/show.slang
```

Which is fine and dandy but with large code bases it is better to place all artifacts for a module of code that implements a feature in the same folder. E.g. for a Post module to handle blog posts

```
src/modules/post/_form.slang
src/modules/post/edit.slang
src/modules/post/index.slang
src/modules/post/new.slang
src/modules/post/post_controller.cr
src/modules/post/post.cr
src/modules/post/show.slang
```

Use this shard to add a macro to ApplicationController so you can
place all of your code for a feature in a single folder in src/modules
(or src/features or however you want to organise your feature modules).

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  amber_render_module:
    github: damianham/amber_render_module
```

## Usage

Add the following to `config/application.cr`:

```crystal
require "amber_render_module"
require "../src/modules/**"
```

In controllers in src/modules/<feature> replace render(template_filename) with render_module(template_filename).
E.g.
```crystal
render("index.slang") => render_module("index.slang")
```

In edit.slang and new.slang in src/replace render(partial) with render_module(partial)
```crystal
== render(partial: "_form.slang")
```

becomes
```crystal
== render_module(partial: "_form.slang")
```

By default layouts will be rendered from the normal location (src/views/layouts) but you can pass a path
to render within a layout from a different location, e.g.

```crystal
render_module("index.slang", layout = true, nil, path = "src/modules")
# render src/modules/post/index.slang in layout src/modules/layouts/application.slang

render_module("index.slang", layout = "post_layout.slang", nil, path = "src/modules")
# render src/modules/post/index.slang in layout src/modules/layouts/post_layout.slang
```

You need to add src/modules to the amber watch command so that changes to your module artifacts cause a re-compilation
```crystal
amber watch -w "./config/**/*.cr" -w "./src/views/**/*.slang" -w "./src/modules/**/*.slang" -w "./src/modules/**/*.cr"
```
## Development

TODO: create a generator for the CLI similar to scaffold to generate the module artifacts in the same folder.

## Contributing

1. Fork it ( https://github.com/damianham/amber_render_module/fork )
2. Create your feature branch (git checkout -b my-new-feature)
3. Commit your changes (git commit -am 'Add some feature')
4. Push to the branch (git push origin my-new-feature)
5. Create a new Pull Request

## Contributors

- [damianham](https://github.com/damianham) Damian Hamill - creator, maintainer
