defmodule Repv2.Repo do
  use Ecto.Repo,
    otp_app: :repv2,
    adapter: Ecto.Adapters.Postgres



    @replicas [
      Repv2.Repo.Replica11
    ]

    def replica do
      Enum.random(@replicas)
    end

    for repo <- @replicas do
      defmodule repo do
        use Ecto.Repo,
          otp_app: :repv2,
          adapter: Ecto.Adapters.Postgres,
          read_only: true
      end
    end
end
