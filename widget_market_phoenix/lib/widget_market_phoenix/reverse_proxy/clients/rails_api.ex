defmodule WidgetMarketPhoenix.ReverseProxy.Clients.RailsApi do
  use HTTPoison.Base

  @host Application.get_env(:widget_market_phoenix, :reverse_proxy)[:host]

  def process_url(url) do
    @host <> url
    # append_secret(@host <> url)
  end

end
