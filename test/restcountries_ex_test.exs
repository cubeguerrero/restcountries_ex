defmodule RestcountriesExTest do
  use ExUnit.Case, async: true
  use ExVCR.Mock, adapter: ExVCR.Adapter.Hackney

  setup_all do
    HTTPoison.start
  end

  test "finds all the countries" do
    use_cassette "all_countries" do
      {:ok, countries} = RestcountriesEx.all()
      assert is_list(countries)
    end
  end

  test "find country by name" do
    use_cassette "by_name" do
      assert {:ok, countries} = RestcountriesEx.find_by_name("phil")
      assert get_alpha_code_of_first_country(countries) == "PH"
    end
  end

  test "finds country by name with multiple words" do
    use_cassette "by_name_with_multiple_words" do
      assert {:ok, countries} = RestcountriesEx.find_by_name("united states")
      assert length(countries) == 2
      assert ["UM", "US"] == Enum.map(countries, &get_alpha_code/1)
    end
  end

  test "finds country by name with full_text" do
    use_cassette "by_name_with_full_text" do
      assert {:ok, countries} = RestcountriesEx.find_by_name("philippines", true)
      assert get_alpha_code_of_first_country(countries) == "PH"
    end
  end

  test "finds country by name with multiple_words with full_text" do
    use_cassette "by_name_with_multiple_words_with_full_text" do
      assert {:ok, countries} = RestcountriesEx.find_by_name("united states of america", true)
      assert get_alpha_code_of_first_country(countries) == "US"
    end
  end

  test "finds country by country code" do
    use_cassette "by_country_code" do
      assert {:ok, countries} = RestcountriesEx.find_by_country_code(["us", "um"])
    end
  end

  test "finds country by currency code" do
    use_cassette "by_currency_code" do
      assert {:ok, countries} = RestcountriesEx.find_by_currency_code("PHP")
      assert get_alpha_code_of_first_country(countries) == "PH"
    end
  end

  defp get_alpha_code_of_first_country([head | _tail]) do
    get_alpha_code(head)
  end

  def get_alpha_code(country) do
    Map.get(country, "alpha2Code")
  end
end
