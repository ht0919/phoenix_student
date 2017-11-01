defmodule Student.Repo.Migrations.CreateScore do
  use Ecto.Migration

  def change do
    create table(:scores) do
      add :date, :date
      add :student_id, :integer
      add :subject_id, :integer
      add :point, :integer

      timestamps()
    end
  end
end
