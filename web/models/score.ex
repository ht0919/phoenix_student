defmodule Student.Score do
  use Student.Web, :model

  schema "scores" do
    field :date, :date
    #field :student_id, :integer
    #field :subject_id, :integer
    belongs_to :student, Student.Student, foreign_key: :student_id
    belongs_to :subject, Student.Subject, foreign_key: :subject_id
    field :point, :integer

    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:date, :student_id, :subject_id, :point])
    |> validate_required([:date, :student_id, :subject_id, :point])
  end
end
