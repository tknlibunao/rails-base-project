# Hi there 👋

This repo serves as the main repo for our Rails Projects.

#### Version

```
  Ruby 2.7.2
  Rails 6.0.3.4
  NodeJS 12.18.3
  Yarn 1.22.4
```

#### Installation

Fork this repo:
![image](https://user-images.githubusercontent.com/9253881/111437757-6c527f00-873e-11eb-8d0a-862e4158f4ab.png)

Then, clone your forked repo to your machine

```
  $ git clone git@github.com:<username>/rails-base-project.git <name of your app>
  $ cd <name of your app>
```

#### Setup

```
  $ bundle install
  $ rake db:setup
```

#### Starting the application

```
  $ rails server
```

#### How to run the test suite

```
  $ rspec
```

#### How to run the Ruby Linter

```
  $ rubocop
```

#### How to enable Github Workflow

<img width="906" alt="Screen Shot 2021-03-23 at 10 10 52 PM" src="https://user-images.githubusercontent.com/9253881/112160501-2fe2bf80-8c25-11eb-8e2b-b9508711ec70.png">

<img width="1244" alt="Screen Shot 2021-03-23 at 10 11 12 PM" src="https://user-images.githubusercontent.com/9253881/112160530-36713700-8c25-11eb-9f00-d69a3a36343f.png">

<br><br>

# ExchangeRates API Wrapper

[ExchangeRates API](https://exchangeratesapi.io/) is a real-Time, intraday &
historical Market Data API
free, easy-to-use REST API interface delivering
worldwide stock market data in JSON format.

<br>

[Access full documentation here](https://exchangeratesapi.io/documentation/)

<br>

## Calling the API Client

###

```ruby
# latest = ExchangeRate::Client.latest

# historical = ExchangeRate::Client.historical

```

## Endpoints

<br>

> The API comes with a number of endpoints where each of them provides different functionality. Endpoints available for this example are the Latest Exchange Rate and the Historical Exchange Rate

<br>

[Latest Exchange Rate](https://penguinvest.herokuapp.com/api/latest/exchangerate)

This endpoint returns exchange rate data in real-time for all available currencies or for a specific set.

```ruby
ExchangeRate::Client.latest
# ({
#     "success": true,
#     "timestamp": 1519296206,
#     "base": "EUR",
#     "date": "2021-03-17",
#     "rates": {
#         "AUD": 1.566015,
#         "CAD": 1.560132,
#         "CHF": 1.154727,
#         "CNY": 7.827874,
#         "GBP": 0.882047,
#         "JPY": 132.360679,
#         "USD": 1.23396,
#     [...]
#     }
# })
```

[Historical Exchange Rate (02/12/21)](https://penguinvest.herokuapp.com/api/historical/exchangerate)

Endpoint for receiving historical exchange rate information for all available currencies or for a set of currencies.

```ruby
ExchangeRate::Client.historical
# {
#     "success": true,
#     "historical": true,
#     "date": "2013-12-24",
#     "timestamp": 1387929599,
#     "base": "GBP",
#     "rates": {
#         "USD": 1.636492,
#         "EUR": 1.196476,
#         "CAD": 1.739516
#     }
# }
```

# Studio Ghibli API (Wrapper)

[Studio Ghibli API](https://ghibliapi.herokuapp.com/) is a public API created to give users access to the different Studio Ghibli resources. Through this, users can easily request for the information they need by following regular REST calls.

For more information, you can checkout the [main repository](https://ghibliapi.herokuapp.com/).

## Endpoints

For this repo, the available endpoints are:

- [films](#films)
- [people](#people)
- [locations](#locations)

## [Show All Films](#films)

`GET` /films

> returns information about all Studio Ghibli films

## URL

`/anime/ghibli/films`

## Rails console command

`StudioGhibli::Client.films`

## Sample Response

`
[
  {
    "id": "2baf70d1-42bb-4437-b551-e5fed5a87abe",
    "title": "Castle in the Sky",
    "original_title": "天空の城ラピュタ",
    "original_title_romanised": "Tenkū no shiro Rapyuta",
    "description": "The orphan Sheeta inherited a mysterious crystal that links her to the mythical sky-kingdom of Laputa. With the help of resourceful Pazu and a rollicking band of sky pirates, she makes her way to the ruins of the once-great civilization. Sheeta and Pazu must outwit the evil Muska, who plans to use Laputa's science to make himself ruler of the world.",
    "director": "Hayao Miyazaki",
    "producer": "Isao Takahata",
    "release_date": "1986",
    "running_time": "124",
    "rt_score": "95",
    "people": [
      "https://ghibliapi.herokuapp.com/people/"
    ],
    "species": [
      "https://ghibliapi.herokuapp.com/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2"
    ],
    "locations": [
      "https://ghibliapi.herokuapp.com/locations/"
    ],
    "vehicles": [
      "https://ghibliapi.herokuapp.com/vehicles/"
    ],
    "url": "https://ghibliapi.herokuapp.com/films/2baf70d1-42bb-4437-b551-e5fed5a87abe"
  },
  {
    "id": "12cfb892-aac0-4c5b-94af-521852e46d6a",
    "title": "Grave of the Fireflies",
    "original_title": "火垂るの墓",
    "original_title_romanised": "Hotaru no haka",
    "description": "In the latter part of World War II, a boy and his sister, orphaned when their mother is killed in the firebombing of Tokyo, are left to survive on their own in what remains of civilian life in Japan. The plot follows this boy and his sister as they do their best to survive in the Japanese countryside, battling hunger, prejudice, and pride in their own quiet, personal battle.",
    "director": "Isao Takahata",
    "producer": "Toru Hara",
    "release_date": "1988",
    "running_time": "89",
    "rt_score": "97",
    "people": [
      "https://ghibliapi.herokuapp.com/people/"
    ],
    "species": [
      "https://ghibliapi.herokuapp.com/species/af3910a6-429f-4c74-9ad5-dfe1c4aa04f2"
    ],
    "locations": [
      "https://ghibliapi.herokuapp.com/locations/"
    ],
    "vehicles": [
      "https://ghibliapi.herokuapp.com/vehicles/"
    ],
    "url": "https://ghibliapi.herokuapp.com/films/12cfb892-aac0-4c5b-94af-521852e46d6a"
  }
]
`
