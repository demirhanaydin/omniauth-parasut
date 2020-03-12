# Omniauth::Parasut

This is the unofficial OmniAuth OAuth2 strategy for authenticating to [Parasut](https://apidocs.parasut.com/#section/Authentication).

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'omniauth-parasut'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install omniauth-parasut

## Usage

### Rails

```ruby
Rails.application.config.middleware.use OmniAuth::Builder do
  provider :parasut, ENV['PARASUT_CLIENT_ID'], ENV['PARASUT_CLIENT_SECRET']
end
```

One can configure parasut api home url by using the below script in an initializer.

```ruby
OmniAuth::Strategies::Parasut.configure do |default_options|
  default_options['client_options'] = { site: 'http://api.heroku-staging.parasut.com' }
end
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/demirhanaydin/omniauth-parasut. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

