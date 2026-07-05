#!/bin/bash

# Create the embeddednext.github.io directory two levels up
mkdir -p ../../embeddednext.github.io

# Loop through all directories in current folder
for dir in */; do
    if [ -d "$dir" ]; then
        echo "Processing directory: $dir"
        cd $dir
        mkdocs build -t material -d ../../embeddednext.github.io/$dir
        cd ..
    fi
done

# Copy local.html to ../../embeddednext.github.io/index.html
cp local.html ../embeddednext.github.io/index.html

# Change to ../../embeddednext.github.io directory
cd ../embeddednext.github.io

# Start a simple HTTP server on localhost:8000
python -m http.server 8000 --bind 127.0.0.1

