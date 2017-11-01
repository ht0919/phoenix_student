defmodule Student.ScoreTest do
  use Student.ModelCase

  alias Student.Score

  @valid_attrs %{date: ~D[2010-04-17], point: 42, student_id: 42, subject_id: 42}
  @invalid_attrs %{}

  test "changeset with valid attributes" do
    changeset = Score.changeset(%Score{}, @valid_attrs)
    assert changeset.valid?
  end

  test "changeset with invalid attributes" do
    changeset = Score.changeset(%Score{}, @invalid_attrs)
    refute changeset.valid?
  end
end
