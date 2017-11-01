defmodule Student.Repo.Migrations.CreateStudent do
  use Ecto.Migration

  def change do
    create table(:student) do
      add :name, :string
      add :grade, :integer

      timestamps()
    end
  end
end
