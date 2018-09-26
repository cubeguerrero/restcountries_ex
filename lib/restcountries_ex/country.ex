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

  defp find_by(endpoint, params) do
    get(endpoint, [], [params: params])
  end

  defp prepare_fields(fields) do
    fields
    |> Enum.map(&to_string/1)
    |> Enum.join(";")
  end
end
