defmodule Mind.Endpoint do
  use Plug.Router

  plug(:match)

  plug(Plug.Parsers,
    parsers: [:json],
    pass: ["application/json"],
    json_decoder: Poison
  )

  plug(:dispatch)
  forward("/bot", to: Mind.Router)

  match _ do
    send_resp(conn, 404, "Requested page not found!")
  end

  @spec child_spec(any) :: %{id: Mind.Endpoint, start: {Mind.Endpoint, :start_link, [...]}}
  def child_spec(opts) do
    %{
      id: __MODULE__,
      start: {__MODULE__, :start_link, [opts]}
    }
  end

  @spec start_link(any) :: {:error, any} | {:ok, pid}
  def start_link(_opts),
    do: Plug.Cowboy.http(__MODULE__, [])
end
