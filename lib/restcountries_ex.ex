defmodule RestcountriesEx do
  @moduledoc """
  Documentation for RestcountriesEx.
  """

  @docmodule """
  """
  defdelegate all(fields \\ []), to: RestcountriesEx.Country
end
