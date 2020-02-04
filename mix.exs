defmodule XeroXero.Mixfile do
  use Mix.Project

  def project do
    [app: :xeroxero,
     version: "0.4.0",
     elixir: "~> 1.3",
     description: description(),
     package: package(),
     deps: deps()]
  end

  def application do
    [applications: [:logger, :httpoison, :poison]]
  end

  defp deps do
    [
      {:httpoison, "~> 1.2"},
      {:ex_doc, ">= 0.0.0", only: :dev},
      {:poison, "~> 3.0"},
      {:ecto, "~> 2.1 or ~> 3.0"}
    ]
  end

  defp description do
    """
    Xero API elixir SDK
    """
  end

  defp package do
    [
      maintainers: ["MJMortimer"],
      licenses: ["MIT"],
      links: %{"Github" => "https://github.com/etehtsea/elixero"}
    ]
  end
end
