# mitchellallain.com

Personal blog for Mitchell Allain, deployed at https://mitchellallain.com via Cloudflare Pages.

## Stack

- **SSG**: Zola 0.22.1 (Rust, single binary, Tera templates, built-in Sass)
- **CSS**: Tufte CSS ported to Sass (`sass/tufte.scss`, `sass/style.scss`)
- **Hero**: Three.js r128 vendored at `static/js/three.min.js` — traveling wireframe wave
- **Fonts**: ET Book, vendored at `static/fonts/et-book/`
- **Hosting**: Cloudflare Pages — build command `zola build`, output `public/`
- **Dev**: Nix flake with `pkgs.zola` — run `nix develop` then `zola serve`

## Development

```bash
cd /home/mallain/dev/mitchellallain.com
nix develop
zola serve        # preview at http://localhost:1111
zola build        # build to public/
```

Outside the devshell: `nix run nixpkgs#zola -- serve`

## Project structure

```
content/          # Markdown posts and pages (Zola TOML frontmatter +++ ... +++)
  _index.md       # Homepage section (sort_by = "none")
  about.md
  contact.md
  posts/
    _index.md     # Posts section (sort_by = "date")
    *.md
sass/
  tufte.scss      # Tufte CSS port — ET Book fonts, sidenotes, sepia #fffff8
  style.scss      # Site-specific overrides — imports tufte.scss
static/
  fonts/et-book/  # ET Book font files
  js/three.min.js # Three.js r128 (vendored, no npm)
templates/
  base.html       # Nav, footer, GA (G-N9G5289DKX)
  index.html      # Homepage: wave hero + about blurb + post list
  post.html       # Blog post
  page.html       # Generic page (about, contact)
  posts/
    section.html  # Writing listing
  shortcodes/
    sidenote.html
    marginnote.html
```

## Key design decisions

- **Body layout**: Tufte's `body { width: 87.5%; padding-left: 12.5% }` is moved to `article` in style.scss so the hero and footer can be full-bleed
- **Font sizes**: Base reduced from Tufte's 15px to 13px; article body text at 1.2rem
- **Syntax highlighting**: `github-light` theme (Zola 0.22 uses Giallo library — different theme names from old syntect)
- **Feed**: `atom.xml` (uses Zola's built-in Atom template)
- **Post slugs**: Zola collapses multiple hyphens in anchor IDs (e.g. `+` and ` - ` both become single `-`)

## Adding a post

Create `content/posts/YYYY-MM-DD-slug.md` with TOML frontmatter:

```toml
+++
title = "Post Title"
date = YYYY-MM-DD
+++
```

## Deployment

Cloudflare Pages watches the `master` branch. Push to deploy.
Environment variable: `ZOLA_VERSION = 0.22.1`
