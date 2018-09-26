defmodule RestcountriesEx.Country do
  @moduledoc """
  """

  @doc """
  Returns all the countries from the Rest Countries API as a list of maps.

  ## Examples

      iex> RestcountriesEx.Country.all()
      [%{}, ...]

  """
  def all() do
    Application.get_env(:restcountries_ex, :api_url) <> "/all"
    |> HTTPoison.get()
    |> handle_response()
  end

  defp handle_response({:ok, %{status_code: 200, body: body}}) do
    Poison.Parser.parse!(body, %{})
  end
end
