defmodule FlutterApi.Repo do
  use Ecto.Repo,
    otp_app: :flutter_api,
    adapter: Ecto.Adapters.Postgres
end
