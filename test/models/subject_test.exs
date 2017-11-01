defmodule Student.SubjectTest do
  use Student.ModelCase

  alias Student.Subject

  @valid_attrs %{name: "some name", teacher: "some teacher"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Subject.changeset(%Subject{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Subject.changeset(%Subject{}, @invalid_attrs)
    refute changeset.valid?
  end
end
