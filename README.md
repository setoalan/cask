# Cask

This is the sample application for the Web Development track at [Startup Institute](http://startupinstitute.com/).

## Getting Started

Cask is a content management system for beer enthusiasts where they can manage their breweries and their respective beers lists. In addition, users will be able to manage reservations and also make reservations at other breweries.

### Installing

To get started with the app, clone the repo and then install the needed gems:

```
$ bundle install --without production
```

Next, migrate the database:

```
$ rails db:migrate
```

Finally, run the app in a local server:

```
$ rails server
```

## Schema

| User     |         |
|----------|---------|
| user_id  | integer |
| name     | string  |
| email    | string  |
| password | string  |

| Brewery          |         |
|------------------|---------|
| brewery_id       | integer |
| brewery_name     | string  |
| brewery_country  | string  |
| brewery_location | string  |
| beer_count       | integer |
| user_id          | integer |

| Beer             |         |
|------------------|---------|
| beer_id          | integer |
| beer_name        | string  |
| beer_abv         | integer |
| beer_ibu         | integer |
| beer_description | text    |
| beer_style       | text    |
| brewery_id       | integer |

| Reservation       |          |
|-------------------|----------|
| reservation_id    | integer  |
| email             | string   |
| request_date_time | datetime |
| message           | text     |
| user_id           | integer  |
| brewery_id        | integer  |

## License

MIT License

Copyright (c) 2016 Alan Seto
