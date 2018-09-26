defmodule RestcountriesEx do
  @moduledoc """
  Documentation for RestcountriesEx.
  """

  defdelegate all(), to: RestcountriesEx.Country
end
