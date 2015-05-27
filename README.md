# RealIp

Rack middleware to get client IP address on Heroku, extracted from our API service.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'real_ip', github: 'quipper/real_ip'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install real_ip

## Usage

Mount `RealIp` rack middleware at the top of your Rack application's middleware stack.

Rack (config.ru)

```ruby
require 'real_ip'
use RealIp
```

Rails (config/application.rb or config/environments/*.rb)

```ruby
module MyApp
  class Application < Rails::Application
    config.middleware.insert 0, 'RealIp'
  end
end

MyApp::Application.configure do
  config.middleware.insert 0, 'RealIp'
end
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/real_ip/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request
