# Repository Guide

## Toolchain and checks

- This is a Hugo documentation site with no package manager, test suite, linter, or formatter configured.
- Use Hugo Extended: the vendored theme compiles SCSS through Hugo Pipes. CI pins Hugo Extended `0.161.1` in `.gitea/workflows/deploy.yml`.
- Preview locally with `hugo serve`, then validate the production rendering with `hugo --minify`. The latter is the only automated build check run for pull requests.
- Do not use `./build.sh` for local verification. It converts every PNG to an ignored WebP, rewrites `.png` references throughout the working tree, and deploys with a clean destination to `/var/www/yams.media/`. It also requires `cwebp` and server filesystem access.

## Site structure

- Documentation pages live in `content/{install,config,advanced,faqs}/`; section landing pages are the corresponding `_index.md` files. Front matter `weight` controls page order.
- Top-level navigation and sidebar-enabled sections are separate settings in `config.toml`: update `menu.main` for navigation and `params.mainSections` when adding a section that needs the docs sidebar.
- Image URLs such as `/pics/foo.png` resolve from `static/pics/`. Hugo copies everything under `static/` unchanged.
- `themes/hugo-whisper-theme/` is vendored and tracked, not a git submodule. The root `layouts/partials/sub-footer.html` intentionally overrides the theme partial; prefer a root `layouts/` override over modifying the vendored theme when replacing a template.
- Production-only analytics is guarded by `hugo.IsProduction` in the theme, so it does not appear under `hugo serve`.

## Generated and deployment files

- Do not edit or commit `public/`, `resources/_gen/`, `.hugo_build.lock`, or generated `*.webp`; they are ignored build artifacts.
- Pushes and pull requests targeting `master` run `hugo --minify`. Only a push to `master` triggers the remote deploy, which pulls the repository and runs `./build.sh` on the server.
