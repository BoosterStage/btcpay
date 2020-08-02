# Btcpay Server

[BTCPay Server Api Client](https://btcpayserver.org/)

[BTCPay Server is a free and open-source cryptocurrency payment processor which allows you to receive payments in Bitcoin and altcoins directly, with no fees, transaction cost or a middleman.](https://docs.btcpayserver.org/API/Greenfield/v1/)

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

#### Required Params

##### Auth Token

At least one of the following auth tokens are required. Auth tokens can be created via the following:

1. `auth_token`
  - Scoped Api Tokens can be created via `/Manage/APIKeys`
  - `BTCPAY_AUTH_TOKEN` environment variable can also be used
1. `basic_auth_token`
  - Legacy Api Key can be created per store via `/stores/{store-id}/Tokens`
  - `BTCPAY_BASIC_AUTH_TOKEN` environment variable can also be used

##### Base Url

A `base_url` is required to interact with the server.
  - `BTCPAY_BASE_URL` environment variable can also be used

```ruby
client = BtcPay.new(auth_token: 'foobar', base_url: 'http://localhost:49392')
```

### Response

A response consists of the following accessible attributes:

1. `#body` - rubified response body
1. `#code` - response status code
1. `#headers` - response headers
1. `#raw` - unaltered response body
1. `#status` - `:success`/`:failure`

### Request object types

All endpoints are accessed via namespaced Api resource. Example: `client.users.create({ email: 'foo@bar.com', password: 'password', isAdministrator: false })`

#### Api Keys:

1. `GET #current`
1. `POST #create(payload)`
1. `DELETE #revoke(key)`
1. `DELETE #revoke!`

#### Health:

1. `GET #status`

#### Lightning:

1. TODO - Set up local lightning network, testing, etc.

#### Store:

- ##### Payment Requests:

1. `GET #all(store_id)`
1. `POST #create(store_id, payload)`
1. `GET #get(store_id, request_id)`
1. `DELETE #delete(store_id, request_id)`
1. `PUT #update(store_id, request_id, payload)`

- ##### Pull Payments:

1. `GET #all(store_id)`
1. `POST #create(store_id, payload)`
1. `DELETE #delete(store_id, pull_payment_id)`

#### Users:

1. `GET #me`
1. `POST #create(payload)`

## Request helpers

#### Api Keys:

- ##### Authorize

1. `GET #html(permissions: [], application_name:, strict: true, selective_stores: false)`
1. `#link(permissions: [], application_name:, strict: true, selective_stores: false)`

### Environment Variables

`btcpay` can be initialized with either arguments or ENV:

| Variable                  |  Description            | Default  |
| --------------------------|:------------------------|:--------:|
| `BTCPAY_AUTH_TOKEN`       | BtcPay Auth Token       |    -     |
| `BTCPAY_BASIC_AUTH_TOKEN` | BtcPay Basic Auth Token |    -     |
| `BTCPAY_BASE_URL`         | BtcPay Base Url         |    -     |

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

Bug reports and pull requests are welcome on Gitlab at https://gitlab.com/snogrammer/btcpay.


## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
