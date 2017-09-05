RUBY_BUILD_DIR := ./rbenv.symlink/plugins/ruby-build

.PHONY: postinstall

postinstall: $(RUBY_BUILD_DIR)
	sudo apt install -y libssl-dev libreadline-dev zlib1g-dev
	rbenv install 2.4.0 --skip-existing
	rbenv global 2.4.0
	gem install bundler

$(RUBY_BUILD_DIR):
	git clone https://github.com/rbenv/ruby-build.git $@

