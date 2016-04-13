#!/bin/bash

if [ ! -d public/js ]; then
	mkdir public/js
fi

if [ ! -d public/views ]; then
	mkdir public/views
fi

if [ ! -d public/img ]; then
	mkdir public/img
fi

if [ -d node_modules/ng_backoffice ]; then
	find node_modules/ng_backoffice/views -name "*.html" -exec ln -s $(realpath {}) public/views/ \; 2>/dev/null
	find node_modules/ng_backoffice/src -name "*.js" -exec ln -s $(realpath {}) public/js/ \; 2>/dev/null
	find node_modules/ng_backoffice/css -name "*.css" -exec ln -s $(realpath {}) public/css/ \; 2>/dev/null
	find node_modules/ng_backoffice/img -name "*" -exec ln -s $(realpath {}) public/img/ \; 2>/dev/null

	pushd node_modules/ng_backoffice
	grunt concat
	popd
fi

if [ -d node_modules/ng_client ]; then
	find node_modules/ng_client/views -name "*.html" -exec ln -s $(realpath {}) public/views/ \; 2>/dev/null
	find node_modules/ng_client/src -name "*.js" -exec ln -s $(realpath {}) public/js/ \; 2>/dev/null
	find node_modules/ng_client/css -name "*.css" -exec ln -s $(realpath {}) public/css/ \; 2>/dev/null
	find node_modules/ng_client/img -name "*" -exec ln -s $(realpath {}) public/img/ \; 2>/dev/null

	pushd node_modules/ng_backoffice
	grunt concat
	popd
fi
