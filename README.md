# Rack::ParamsKeyConverter

This is a rack middleware that convert params key between JavaScript app and Rails app.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'rack-params_key_converter'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install rack-params_key_converter

## Usage

Add below to your rails app's config/initializers
```ruby
Rails.configuration.middleware.insert_after(ActionDispatch::ParamsParser, Rack::ParamsKeyConverter)
```

## Contributing

1. Fork it ( https://github.com/[my-github-username]/rack-params_key_converter/fork )
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create a new Pull Request

## LiCENSE

MIT
