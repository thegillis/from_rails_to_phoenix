defmodule WidgetMarketPhoenix.Web.Router do
  use WidgetMarketPhoenix.Web, :router
  use Terraform, terraformer: WidgetMarketPhoenix.ReverseProxy.Terraformers.RailsApi

  pipeline :browser do
    plug :accepts, ["html"]
    plug :fetch_session
    plug :fetch_flash
    plug :protect_from_forgery
    plug :put_secure_browser_headers
  end

  pipeline :api do
    plug :accepts, ["json"]
  end

  scope "/", WidgetMarketPhoenix.Web do
    pipe_through :browser # Use the default browser stack

    get "/", PageController, :index
  end

  # Other scopes may use custom stacks.
  scope "/v2", WidgetMarketPhoenix.Web do
    pipe_through :api

    resources "/widgets", WidgetController
  end
end
