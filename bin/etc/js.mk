YARN_ADD       := yarn add --silent --no-progress
PACKAGE_JSON   := package.json
WEBPACK_CONFIG := webpack-config.js

.PHONY: init webpack mocha babel react redux js-clobber

init: src webpack mocha babel react redux

webpack: $(PACKAGE_JSON) babel
	cp $(ETCDIR)/$(WEBPACK_CONFIG) .
	$(YARN_ADD) webpack webpack-notifier growl
	$(YARN_ADD) babel-loader babel-polyfill
	$(YARN_ADD) css-loader file-loader less-loader style-loader url-loader

mocha: $(PACKAGE_JSON) babel
	$(YARN_ADD) mocha chai

react: babel webpack
	$(YARN_ADD) react react-dom prop-types babel-preset-react less

redux: babel react webpack
	$(YARN_ADD) redux redux-logger redux-saga react-redux

babel:
	$(YARN_ADD) babel-core babel-preset-es2015 babel-preset-stage-0

$(PACKAGE_JSON):
	cp $(ETCDIR)/$@ .

src:
	mkdir $@

js-clobber:
	$(RM) $(PACKAGE_JSON) $(WEBPACK_CONFIG)
	$(RM) -r node_modules

