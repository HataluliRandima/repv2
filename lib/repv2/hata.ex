defmodule Repv2.Hata do

  import Ecto.Query, warn: false
  import Ecto.Repo, warn: false
  # def get_data1 do
  #   from(u in User, select: u.username)
  #   |> Repo.replica().all()
  # end

  def get_data do
    Repv2.Repo.replica.all(from(u in "products", select: {u.name, u.price}))
  end

  def insert_user(name, price) do
    sql = "INSERT INTO products (name, price) VALUES ($1, $2)"
      Repv2.Repo.replica.transaction(fn ->
        Repv2.Repo.replica.query(sql, [name, price])
      end)
  end

end
