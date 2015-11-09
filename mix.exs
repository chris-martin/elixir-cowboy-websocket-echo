defmodule Echo.Mixfile do
  use Mix.Project

  def project do
    [app: :echo,
     version: "0.0.1",
     elixir: "~> 1.0",
     deps: [{ :cowboy, "1.0.3" }]]
  end

  def application do
    [mod: {Echo, []},
     applications: [:cowboy]]
  end
end
