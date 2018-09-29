defmodule RestcountriesExTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start
  end

  test "gets all the countries" do
    use_cassette "all_countries" do
      {:ok, countries} = RestcountriesEx.all()
      assert is_list(countries)
      assert length(countries)
    end
  end

  test "gets country by name" do
    use_cassette "by_name" do
      assert {:ok, countries} = RestcountriesEx.find_by_name("phil")

      alpha_code =
        countries
        |> Enum.at(0)
        |> Map.get("alpha2Code")
      assert alpha_code == "PH"
    end
  end

  test "gets country by name with full_text" do
    use_cassette "by_name_with_full_text" do
      assert {:ok, countries} = RestcountriesEx.find_by_name("united states")

      alpha_code =
        countries
        |> Enum.at(0)
        |> Map.get("alpha2Code")
      assert alpha_code == "US"
    end
  end

  test "gets country by country code" do
    use_cassette
  end
end
