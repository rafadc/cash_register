watch:
	ag -l | entr -c bundle exec rspec --fail-fast

console:
	irb -I . -r src/cash_register.rb
