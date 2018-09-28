defmodule RestcountriesEx.Country do
  @moduledoc """
  """

  import RestcountriesEx.Client, only: [get: 3]

  @doc """
  Returns all the countries from the Rest Countries API as a list of maps.

  ## Examples

      iex> RestcountriesEx.Country.all()
      [%{}, ...]

  """
  def all(fields \\ []) do
    get("all", [], [params: [fields: prepare_fields(fields)]])
  end

  def find_by_name(name, full_text \\ false) do
    find_by("name/#{name}", [fullText: full_text])
  end

  def find_by_country_code(code) do
    find_by("alpha/#{code}")
  end

  def find_by_currency_code(currency) do
    find_by("currency/#{currency}")
  end

  def find_by_language_code(language) do
    find_by("language/#{language}")
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

  defp prepare_fields(fields) do
    fields
    |> Enum.map(&to_string/1)
    |> Enum.join(";")
  end
end
