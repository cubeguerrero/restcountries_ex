defmodule RestcountriesEx do
  @moduledoc """
  Documentation for RestcountriesEx.

  Rest Countries is a RESTful API to get information about countries.
  Link: https://restcountries.eu/
  """
  alias RestcountriesEx.Country

  defdelegate all(fields \\ []), to: Country
  defdelegate find_by_name(name, full_text \\ false), to: Country
  defdelegate find_by_country_code(currency_codes), to: Country
  defdelegate find_by_currency_code(currency_code), to: Country
  defdelegate find_by_language_code(language_code), to: Country
  defdelegate find_by_region(region), to: Country
end
