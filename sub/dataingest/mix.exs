defmodule Dataingest.MixProject do
  use Mix.Project

  def project do
    [
      app: :dataingest,
      version: "0.1.0",
      elixir: "~> 1.13",
      start_permanent: Mix.env() == :prod,
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger],
      mod: {Dataingest.Application, []}
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [ {:brod, "~> 3.16"},
      {:jason, "~> 1.2"},
      {:broadway, "~> 1.0"},
      {:broadway_kafka, "~> 0.3.6"},
      {:mongodb, ">= 0.0.0"},
      {:poolboy, ">= 0.0.0"}
      # {:dep_from_hexpm, "~> 0.3.0"},
      # {:dep_from_git, git: "https://github.com/elixir-lang/my_dep.git", tag: "0.1.0"}
    ]
  end
end
