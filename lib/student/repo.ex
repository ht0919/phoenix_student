defmodule Student.Repo do
  use Ecto.Repo, otp_app: :student, adapter: PostgreSQL.Ecto
end
