defmodule Asdf.Repo do
  use Ecto.Repo,
    otp_app: :asdf,
    adapter: Ecto.Adapters.Postgres
end
