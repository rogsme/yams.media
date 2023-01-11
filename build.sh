#!/bin/bash

find ./ -type f -name '*.png' -not -path '*/.git/*' -exec sh -c 'cwebp -lossless $1 -o "${1%.png}.png"' _ {} \;
find . -type f -not -path '*/.git/*' \( ! -iname ".gitignore" ! -iname "pre-commit" \) -exec sed -i -e 's/\.png/\.png/g' {} \;
hugo -s . -d /var/www/yams.media/
