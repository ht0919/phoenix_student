defmodule Student.Student do
  use Student.Web, :model

  schema "student" do
    field :name, :string
    field :grade, :integer

    has_many :scores, Student.Score
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :grade])
    |> validate_required([:name, :grade])
  end
end
