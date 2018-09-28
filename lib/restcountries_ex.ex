defmodule RestcountriesEx do
  @moduledoc """
  Documentation for RestcountriesEx.
  """
  alias RestcountriesEx.Country

  defdelegate all(fields \\ []), to: Country
  defdelegate find_by_name(name, full_text \\ false), to: Country
  defdelegate find_by_region(region), to: Country
end
