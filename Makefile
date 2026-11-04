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
	rm -r DrFlamingoo.github.io/* || true
	bundle exec \
		jekyll build \
			--destination DrFlamingoo.github.io
serve:
	# jekyll command
	rm -r DrFlamingoo.preview/* || true
	bundle exec \
		jekyll serve \
			--port 4004 \
			--incremental \
			--future \
			--drafts \
			--watch \
			--livereload \
			--destination DrFlamingoo.preview
