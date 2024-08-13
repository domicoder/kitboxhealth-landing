#!/bin/bash

SRC_DIR="assets"
DIST_DIR="dist"

mkdir -p $DIST_DIR
mkdir -p $DIST_DIR/$SRC_DIR

minify_css() {
    local file=$1
    npx clean-css-cli -o "$2" "$file"
}

minify_js() {
    local file=$1
    npx uglifyjs "$file" -o "$2"
}

minify_html() {
    local file=$1
    html-minifier --collapse-whitespace --remove-comments --remove-redundant-attributes --use-short-doctype --minify-css true --minify-js true -o "$2" "$file"
}

find $SRC_DIR -type f | while read -r file; do
    dest_file="$DIST_DIR/$SRC_DIR/${file#$SRC_DIR/}"

    mkdir -p "$(dirname "$dest_file")"

    if [[ $file == *.min.css || $file == *.min.js ]]; then
        cp "$file" "$dest_file"
    else
        if [[ $file == *.css ]]; then
            minify_css "$file" "$dest_file"
        elif [[ $file == *.js ]]; then
            minify_js "$file" "$dest_file"
        elif [[ $file == *.html ]]; then
            minify_html "$file" "$dest_file"
        else
            cp "$file" "$dest_file"
        fi
    fi
done

INDEX_HTML_FILE_NAME="index.html"
ABOUT_HTML_FILE_NAME="about.html"
CONTACT_HTML_FILE_NAME="contact.html"
html-minifier --collapse-whitespace $INDEX_HTML_FILE_NAME -o dist/$INDEX_HTML_FILE_NAME
html-minifier --collapse-whitespace $ABOUT_HTML_FILE_NAME -o dist/$ABOUT_HTML_FILE_NAME
html-minifier --collapse-whitespace $CONTACT_HTML_FILE_NAME -o dist/$CONTACT_HTML_FILE_NAME