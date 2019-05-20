# Ruby dotenv does not load any other file than .env
Maybe this is the intended behavior but having `dotenv` and `dotenv-rails` documented
in the [same place](https://github.com/bkeepers/dotenv) makes this matter a little confusing.

Here I'm using the `:dotenv` task as advised in the dotenv docs to run the default RSpec
task.

```ruby
require 'rspec'
require 'rack/test'
require 'rspec/core/rake_task'
require 'dotenv/tasks'

task test: :dotenv do
  RSpec::Core::RakeTask.new(:spec).run_task(verbose: true)
end
```

## Expected behavior
The `API_URL` variable should be available to the code run by the `:test` task
(using `bundle exec rake test`).

## Observed behavior
An error caused because `ENV['API_URL']` is null.

```
/Users/mariogil/.rvm/rubies/ruby-2.6.3/bin/ruby -I/Users/mariogil/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.0/lib:/Users/mariogil/.rvm/gems/ruby-2.6.3/gems/rspec-support-3.8.0/lib /Users/mariogil/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.0/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb

An error occurred while loading ./spec/server_spec.rb.
Failure/Error:
  get ENV['API_URL'] do
    'Hello World!'
  end

TypeError:
  NilClass can't be coerced into Mustermann::Pattern
# /Users/mariogil/.rvm/gems/ruby-2.6.3/gems/mustermann-1.0.3/lib/mustermann.rb:73:in `new'
# /Users/mariogil/.rvm/gems/ruby-2.6.3/gems/sinatra-2.0.5/lib/sinatra/base.rb:1641:in `compile'
# /Users/mariogil/.rvm/gems/ruby-2.6.3/gems/sinatra-2.0.5/lib/sinatra/base.rb:1629:in `compile!'
# /Users/mariogil/.rvm/gems/ruby-2.6.3/gems/sinatra-2.0.5/lib/sinatra/base.rb:1604:in `route'
# /Users/mariogil/.rvm/gems/ruby-2.6.3/gems/sinatra-2.0.5/lib/sinatra/base.rb:1386:in `get'
# /Users/mariogil/.rvm/gems/ruby-2.6.3/gems/sinatra-2.0.5/lib/sinatra/base.rb:1925:in `block (2 levels) in delegate'
# ./lib/server.rb:9:in `<top (required)>'
# ./spec/server_spec.rb:6:in `require'
# ./spec/server_spec.rb:6:in `<top (required)>'
No examples found.


Finished in 0.00026 seconds (files took 0.18951 seconds to load)
0 examples, 0 failures, 1 error occurred outside of examples

/Users/mariogil/.rvm/rubies/ruby-2.6.3/bin/ruby -I/Users/mariogil/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.0/lib:/Users/mariogil/.rvm/gems/ruby-2.6.3/gems/rspec-support-3.8.0/lib /Users/mariogil/.rvm/gems/ruby-2.6.3/gems/rspec-core-3.8.0/exe/rspec --pattern spec/\*\*\{,/\*/\*\*\}/\*_spec.rb failed
```

## How to test
**If it's the first time you use this project:** Run `bundle install`

Run `bundle exec rake test`