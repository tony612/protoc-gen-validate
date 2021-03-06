defmodule ProtoValidator.MixProject do
  use Mix.Project

  def project do
    [
      app: :proto_validator,
      version: "0.1.0",
      elixir: "~> 1.7",
      start_permanent: Mix.env() == :prod,
      escript: escript(),
      deps: deps(),
      package: package(),
      elixirc_paths: elixirc_paths(Mix.env())
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  defp elixirc_paths(:test), do: ["lib", "test/proto_gen"]
  defp elixirc_paths(_), do: ["lib"]

  defp escript do
    [main_module: ProtoValidator.Protoc.CLI, name: "protoc-gen-validate"]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:protobuf, github: "tony612/protobuf-elixir", branch: "refactor-protoc"},
      {:vex, "~> 0.8.0"}
    ]
  end

  defp package() do
    %{
      files: ~w(mix.exs README.md lib src LICENSE priv/templates .formatter.exs)
    }
  end
end
