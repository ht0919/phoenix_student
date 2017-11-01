defmodule Student.Repo.Migrations.CreateSubject do
  use Ecto.Migration

  def change do
    create table(:subject) do
      add :name, :string
      add :teacher, :string

      timestamps()
    end
  end
end
