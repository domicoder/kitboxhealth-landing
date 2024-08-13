# First time use

```bash
chmod u+x build.sh

./build.sh
```

## Deploy on vercel

In your deployment you need to add the following commands:

```bash
# Build Command
npm install -g clean-css-cli uglify-js -g html-minifier && chmod u+x build.sh && ./build.sh

# Output Directory
dist
```
