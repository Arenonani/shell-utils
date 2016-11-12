#!/bin/sh
# /Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --profile-directory="Default" --app="data:text/html,<html><body><script>window.resizeTo(816,646);window.location='http://localhost:8000/'</script></body></html>" --disk-cache-dir="./.chrome_diskcache" --incognito
/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome --app="data:text/html,<html><body><script>window.resizeTo(816,646);window.location='http://localhost:8000/'</script></body></html>"

python -m SimpleHTTPServer 8000 2> /dev/null
