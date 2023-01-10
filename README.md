yams.media
==========

This are the source files for https://yams.media.

## Dependencies

- hugo.
- cwebp (development only).

## To run

### For development

``` sh
git clone git@gitlab.com:rogs/yams.media.git
cd yams.media
ln -s $(pwd)/pre-commit $(pwd)/.git/hooks # for pre-commit hooks
hugo serve
```
And open http://localhost:1313 to see the site.

#### About the pre-commit hooks and MacOS

If you are in MacOS you might have problems because of the `sed` command. If you are having problems, just change `sed -i` for `sed -i ''` and you'll be good to go! Please do not commit this change into the repository.

### For production

``` sh
git clone git@gitlab.com:rogs/yams.media.git
cd yams.media
hugo
```

Your files will be on the ``./public` folder, ready to upload to a server.
