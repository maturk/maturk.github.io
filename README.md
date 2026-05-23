# matias turkulainen website

## install and run on macos

1. Install Ruby tooling:

```bash
brew install rbenv ruby-build
echo 'eval "$(rbenv init -)"' >> ~/.zshrc
source ~/.zshrc
```

2. Use the project Ruby version:

```bash
rbenv install -s 3.3.11
rbenv local 3.3.11
```

3. Install dependencies:

```bash
gem install bundler
bundle install
```

4. Serve locally with live reload:

```bash
bundle exec jekyll serve --livereload
```

## regenerate cv.pdf

After editing `cv.html`, run:

```bash
./bin/make-cv.sh
```

Uses headless Chrome to render `cv.html` with the `.pdf` body class active.
