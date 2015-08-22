defmodule EmporiumApi.Router do
  use EmporiumApi.Web, :router

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

  scope "/", EmporiumApi do
    pipe_through :browser # Use the default browser stack

  end

  # Other scopes may use custom stacks.
  # scope "/api", EmporiumApi do
  #   pipe_through :api
  # end
end
