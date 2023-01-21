# install-log-remove-markdown-comments.sh
# Extract the executable code that is betweeen ```, and discard this rest.

sed -n '/```/,/```/{//! s/^//p}' ~/git/mine/gists/install-log.md
# sed -n '/```/,/```/p' install-log.md |grep -v '```'
