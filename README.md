# Btcpay Server

Welcome to your new gem! In this directory, you'll find the files you need to be able to package up your Ruby library into a gem. Put your Ruby code in the file `lib/btcpay`. To experiment with that code, run `bin/console` for an interactive prompt.

TODO: Delete this and the text above, and describe your gem

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'btcpay'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install btcpay

## Usage

TODO: Write usage instructions here

### BtcPay Docker Compose

To get up and running locally quickly, a [BTCPayServer]((https://docs.btcpayserver.org/)) docker-compose file has been added to test local API interactions. To get up and running:

1. `$ docker-compose -f docker-compose.btcpay.yml up`
1. `$ open http://localhost:49392`
  - Note: [`regtest`](https://bisq.network/blog/how-to-set-up-bitcoin-regtest/) environment default to allow for block/coin creation for test purpose
  - `testnet` environment should be used for integration/staging testing prior to production promotion.
  - `mainnet` is the **real** network.

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/btcpay.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
