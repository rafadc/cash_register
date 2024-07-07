run:
	bundle exec ruby src/ui/cli.rb

watch:
	ag -l | entr -c bundle exec rspec --fail-fast

console:
	irb -I . -r src/cash_register.rb

test:
	bundle exec rspec
