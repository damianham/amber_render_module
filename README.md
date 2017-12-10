# amber_render_module

Place all of your code for a feature in a single folder in src/modules.  E.g. for a Post module
to handle blog posts

```
src/modules/post/_form.slang
src/modules/post/edit.slang
src/modules/post/index.slang
src/modules/post/new.slang
src/modules/post/post_controller.cr
src/modules/post/post.cr
src/modules/post/show.slang
```

## Installation

Add this to your application's `shard.yml`:

```yaml
dependencies:
  amber_render_module:
    github: damianham/amber_render_module
```

## Usage

```crystal
require "amber_render_module"
```

In your controllers replace render(template_filename) with render_module(template_filename).
E.g.
```
render("index.slang") => render_module("index.slang")
```

In edit.slang and new.slang replace render(partial) with render_module(partial)
```
== render(partial: "_form.slang")
```

becomes
```
== render_module(partial: "_form.slang")
```

By default layouts will be rendered from the normal location (src/views/layouts) but you can pass a path
to render within a layout from a different location, e.g.

```
render_module("index.slang", layout = true, nil, path = "src/modules")
# render src/modules/post/index.slang in layout src/modules/layouts/application.slang

render_module("index.slang", layout = "post_layout.slang", nil, path = "src/modules")
# render src/modules/post/index.slang in layout src/modules/layouts/post_layout.slang
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

- [[your-github-name]](https://github.com/[your-github-name]) Damian Hamill - creator, maintainer
