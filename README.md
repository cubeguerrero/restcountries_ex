# RestcountriesEx

RestcountriesEx is a Elixir wrapper for the [Rest Countries API](https://restcountries.eu).

## Installation

*NOTE* This package is not yet available in Hex

If [available in Hex](https://hex.pm/docs/publish), the package can be installed
by adding `restcountries_ex` to your list of dependencies in `mix.exs`:

```elixir
def deps do
  [
    {:restcountries_ex, "~> 0.1.0"}
  ]
end
```

## Usage
The package maps all endpoints, except the `https://restcountries.eu/rest/v2/alpha/code`. That endpoint seems redundant since there is also an endpoint for searching by a list of codes.

1. Get all countries. By default, this returns all the fields of each country item. You can pass a list of wanted fields. See the example below.
```
iex> RestcountriesEx.all()
{:ok, [%{}]

iex> RestcountriesEx.all(["name"])
{:ok, [%{"name": name}]}
```

2. Find a country by name. Accepts a binary/string and an optional boolean for `full_text`. The `full_text` option will pass the `fullText=true` query params to the endpoint, which will perform a stricter search.
```
iex> RestcountriesEx.find_by_name("united") # should return two countries United States of America and United States Minor Outlying Isalands
{:ok, [%{}, ...]}

iex> RestcountriesEx.find_by_name("united", true) # should return nothing

iex> RestcountriesEx.find_by_name('united states of america", true), # should return 
{:ok, [%{}, ...]}
```

Documentation can be generated with [ExDoc](https://github.com/elixir-lang/ex_doc)
and published on [HexDocs](https://hexdocs.pm). Once published, the docs can
be found at [https://hexdocs.pm/restcountries_ex](https://hexdocs.pm/restcountries_ex).

