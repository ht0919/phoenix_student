defmodule Student.StudentTest do
  use Student.ModelCase

  alias Student.Student

  @valid_attrs %{grade: 42, name: "some name"}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Student.changeset(%Student{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Student.changeset(%Student{}, @invalid_attrs)
    refute changeset.valid?
  end
end
