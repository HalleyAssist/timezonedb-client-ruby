# Timezonedb Client
[![Build Status](https://travis-ci.org/Skyscanner/timezonedb-client-ruby.svg?branch=master)](https://travis-ci.org/Skyscanner/timezonedb-client-ruby)
[![Gem Version](https://badge.fury.io/rb/timezonedb-client.svg)](https://badge.fury.io/rb/timezonedb-client)

A Ruby client for the [timezonedb.com API](https://timezonedb.com/api)

## Installation

Add this line to your application's Gemfile:

```
gem 'timezonedb-client'
```

And then execute:

```
$ bundle
```

Or install it yourself as:

```
$ gem install timezonedb-client
```

## Usage

Instantiate a new client object providing a Timezonedb API key.
[Register](https://timezonedb.com/register) to get your API key

```
client = Timezonedb::Client.new(api_key)
```

Search for the timezone providing latitude and longitude

```
tz = client.search_by_coords("41.3833", "2.1833")
tz.abbreviation
=> "CET"
tz.country_code
=> "ES"
tz.dst
=> "0"
tz.gmt_offset
=> "3600"
tz.message
=> ""
tz.timestamp
=> 1447847197
tz.zone_name
=> "Europe/Madrid"
```

## Contributing

We're glad you want to make a contribution!

Fork this repository and send in a pull request when you're finished with your
changes. Link any relevant issues in too.

Take note of the build status of your pull request, only builds that pass will
be accepted. Please also keep to our conventions and style so we can keep this
repository as clean as possible.

By contributing your code, you agree to license your contribution under the
terms of the APLv2: http://www.apache.org/licenses/LICENSE-2.0

All files are released with the Apache 2.0 license.

If you are adding a new file it should have a header like this:

```
# Copyright 2015 Skyscanner Limited.
#
# Licensed under the Apache License, Version 2.0 (the "License");
#
# you may not use this file except in compliance with the License.
#
# You may obtain a copy of the License at
# http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#
# See the License for the specific language governing permissions and
# limitations under the License.
```

## License

Copyright 2015 Skyscanner Limited.

Licensed under the Apache License, Version 2.0 (the "License");

you may not use this software except in compliance with the License.

You may obtain a copy of the License at
http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.

See the License for the specific language governing permissions and
limitations under the License.
