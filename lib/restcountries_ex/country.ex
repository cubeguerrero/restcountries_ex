defmodule RestcountriesEx.Country do
  @moduledoc """
  """

  import RestcountriesEx.Client, only: [get: 3]

  @doc """
  Returns all the countries from the Rest Countries API as a list of maps.

  ## Examples

      iex> RestcountriesEx.Country.all()
      {:ok, [%{}, ...]}

  """
  def all(fields \\ []) do
    get("all", [], [params: [fields: prepare_params(fields)]])
  end

  @doc """
  Searches a country by name. The full_text option dicates whether the search
  will be strict.

  ## Examples

      iex> RestcountriesEx.Country.find_by_name("united states")
      {:ok, [%{alpha2Code: "UM"}, %{alpha2Code: "US"}]}

      iex> RestcountriesEx.Country.find_by_name("united states", true)
      {:ok, [%{alpha2Code: "US"}]}

  """
  def find_by_name(name, full_text \\ false) do
    find_by("name/#{name}", [fullText: full_text])
  end

  @doc """
  Searches a country by country code, ISO 3166-1 2-letter or 3-letter country.
  This returns a list of countries, and uses the /alpha?codes={code} endpoint.

  ## Examples

      iex> RestcountriesEx.Country.find_by_country_code(["co"])
      {:ok, [%{alpha2Code: "co"}]}

      iex> RestcountriesEx.Country.find_by_country_code(["co", "us", um")
      {:ok, [%{alpha2Code: "co"}]}

  """
  def find_by_country_code(codes) do
    get("alpha", [], [params: [codes: prepare_params(codes)]])
  end

  @doc """
  Searches a country by currency code, ISO 3166-1 2-letter or 3-letter country.
  This returns a list of countries, and uses the /currency/{currency_code} endpoint.

  ## Examples

      iex> RestcountriesEx.Country.find_by_currency_code("php")
      {:ok, [%{alpha2Code: "PH"}]}

  """
  def find_by_currency_code(currency) do
    find_by("currency/#{currency}")
  end

  @doc """
  Searches a country by language code, ISO6391_1 2-letter or ISO6391_2 3-letter language code.
  This returns a list of countries, and uses the /currency/{currency_code} endpoint.

  ## Examples

      iex> RestcountriesEx.Country.find_by_currency_code("en")
      {:ok, [%{alpha2Code: "PH", ...}]}

      iex> RestcountriesEx.Country.find_by_currency_code("eng")
      {:ok, [%{alpha2Code: "PH", ...}]}

  """
  def find_by_language_code(language) do
    find_by("lang/#{language}")
  end

  def find_by_capital_city(city_name) do
    find_by("capital/#{city_name}")
  end

  def find_by_calling_code(calling_code) do
    find_by("callingcode/#{calling_code}")
  end

  def find_by_region(region) do
    find_by("region/#{region}")
  end

  defp find_by(endpoint, params \\ []) do
    get(endpoint, [], [params: params])
  end

  defp prepare_params(params) do
    params
    |> Enum.map(&to_string/1)
    |> Enum.join(";")
  end
end
