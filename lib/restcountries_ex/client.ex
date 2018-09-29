defmodule RestcountriesEx.Client do
  alias Poison.Parser

  @api_url Application.get_env(:restcountries_ex, :api_url)

  def get(endpoint, headers \\ [], options \\ []) do
    endpoint
    |> url_builder()
    |> HTTPoison.get(headers, options)
    |> handle_response()
  end

  defp url_builder(endpoint), do: URI.encode("#{@api_url}/#{endpoint}")

  defp handle_response({:ok, %{status_code: 200, body: body}}) do
    {:ok, Parser.parse!(body, %{})}
  end
  defp handle_response({:ok, %{status_code: _, body: body}}) do
    {:error, %{reason: :not_found}}
  end
  defp handle_response({:error, %HTTPoison.Error{reason: reason}}) do
    {:error, %{reason: reason}}
  end
end
