defmodule RestcountriesEx.MixProject do
  use Mix.Project

  def project do
    [
      app: :restcountries_ex,
      version: "0.1.0",
      elixir: "~> 1.6",
      start_permanent: Mix.env() == :prod,
      source_url: "https://github.com/cubeguerrero/restcountries_ex",
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:httpoison, "~> 1.3"},
      {:poison,    "~> 4.0"},
      {:ex_doc,    "~> 0.18.1"},
      {:earmark,   "~> 1.2.4"},

      # Test dependencies
      {:exvcr, "~> 0.10", only: :test}
    ]
  end
end
