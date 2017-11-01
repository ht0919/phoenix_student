defmodule Student.Subject do
  use Student.Web, :model

  schema "subject" do
    field :name, :string
    field :teacher, :string

    has_many :scores, Student.Score
    timestamps()
  end

  @doc """
  Builds a changeset based on the `struct` and `params`.
  """
  def changeset(struct, params \\ %{}) do
    struct
    |> cast(params, [:name, :teacher])
    |> validate_required([:name, :teacher])
  end
end
