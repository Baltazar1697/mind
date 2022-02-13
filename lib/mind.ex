defmodule Mind do
  use Application
  @moduledoc """

"""

  def start(_type, _args),
    do: Supervisor.start_link(children(), opts())

  defp children do
    [
      Mind.Endpoint
    ]
  end

  defp opts do
  [
    strategy: :one_for_one,
    name: Mind.Supervisor
  ]
  end
end
