defmodule Covertool.Mixfile do
  use Mix.Project

  {:ok, [{:application, :covertool, props}]} = :file.consult("src/covertool.app.src")
  @props Keyword.take(props, [:applications, :description, :env, :mod, :vsn, :links])

  def application do
    @props
  end

  def project do
    [app: :covertool,
     language: :erlang,
     version: to_string(@props[:vsn]),
     description: to_string(@props[:description]),
     package: package()]
  end


  defp package() do
    [maintainers: [],
     licenses: @props[:licenses],
     links: Map.new(@props[:links]),
     files: ["dtd", "screenshots", "include", "src", "README.md", "LICENSE", "Makefile", "rebar.config", "mix.exs"]]
  end
end
