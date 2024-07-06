watch:
	ag -l | entr -c bundle exec rspec

console:
	irb -I . -r src/cash_register.rb
