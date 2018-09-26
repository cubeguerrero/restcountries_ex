defmodule RestcountriesEx do
  @moduledoc """
  Documentation for RestcountriesEx.
  """

  defdelegate all(fields \\ []), to: RestcountriesEx.Country
  defdelegate find_by_name(name, full_text \\ false), to: RestcountriesEx.Country
end
