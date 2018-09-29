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

  test "gets country by name with multiple words" do
    use_cassette "by_name_with_multiple_words" do
      assert {:ok, countries} = RestcountriesEx.find_by_name("united states")
      assert length(countries) == 2
      assert ["UM", "US"] == Enum.map(countries, &(&1["alpha2Code"]))
    end
  end

  test "gets country by name with full_text" do
    use_cassette "by_name_with_full_text" do
      assert {:ok, countries} = RestcountriesEx.find_by_name("philippines", true)

      alpha_code =
        countries
        |> Enum.at(0)
        |> Map.get("alpha2Code")
      assert alpha_code == "PH"
    end
  end

  test "gets country by name with multiple_words with full_text" do
    use_cassette "by_name_with_multiple_words_with_full_text" do
      assert {:ok, countries} = RestcountriesEx.find_by_name("united states of america", true)

      alpha_code =
        countries
        |> Enum.at(0)
        |> Map.get("alpha2Code")
      assert alpha_code == "US"
    end
  end
end
