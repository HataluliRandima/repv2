defmodule Repv2.Repo.Replica do

#  alias Repv2.Repo

  use Ecto.Repo,
    otp_app: :repv2,
    adapter: Ecto.Adapters.Postgres
end
