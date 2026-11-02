default: install

all: install build


h help:
	@grep '^[a-z]' Makefile

setup:
	aurman -S ruby ruby-erb mermaid-cli
	gem install jekyll bundle
	bundle config set --local path vendor/bundle
	bundle install

upgrade:
	bundle update

build:
	bundle exec \
		jekyll build \
			--destination DrFlamingoo.github.io
serve:
	# jekyll command
	bundle exec \
		jekyll serve \
			--drafts \
			--incremental \
			--watch \
			--livereload \
			--destination DrFlamingoo.preview
