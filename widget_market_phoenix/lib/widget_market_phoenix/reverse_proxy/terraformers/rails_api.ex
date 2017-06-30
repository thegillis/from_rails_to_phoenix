defmodule WidgetMarketPhoenix.ReverseProxy.Terraformers.RailsApi do
  use Plug.Router
  require Logger
  alias WidgetMarketPhoenix.ReverseProxy.Clients.RailsApi

  @host Application.get_env(:widget_market_phoenix, :reverse_proxy)[:host]

  plug :match
  plug :dispatch


  # testing
  get "/v2/hello-world", do: send_resp(conn, 200, "Hello world")

  # catch all `get`s
  get _ do
    %{method: "GET", request_path: request_path, params: params, req_headers: req_headers} = conn
    Logger.debug """
    Processing by #{__MODULE__}
      Path: #{@host <> request_path}
      Parameters: #{inspect params}
      Headers: #{inspect req_headers}
    """
    res = RailsApi.get!(request_path, req_headers, [params: Map.to_list(params)])
    send_response({:ok, conn, res})
  end

  match _, do: raise "Not implemented yet"

  defp send_response({:ok, conn, %{headers: headers, status_code: status_code, body: body}}) do
    conn = %{conn | resp_headers: headers}
    send_resp(conn, status_code, body)
  end


end
