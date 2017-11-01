defmodule Student.ScoreController do
  use Student.Web, :controller

  alias Student.Score

  def index(conn, _params) do
    scores = Repo.all(Score) |> Repo.preload [:student, :subject]
    render(conn, "index.html", scores: scores)
  end

  def new(conn, _params) do
    changeset = Score.changeset(%Score{})
    student = Repo.all(Student.Student)
    subject = Repo.all(Student.Subject)
    render(conn, "new.html", changeset: changeset,
      student: student, subject: subject)
  end

  def create(conn, %{"score" => score_params}) do
    changeset = Score.changeset(%Score{}, score_params)

    case Repo.insert(changeset) do
      {:ok, score} ->
        conn
        |> put_flash(:info, "Score created successfully.")
        |> redirect(to: score_path(conn, :show, score))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    score = Repo.get!(Score, id) |> Repo.preload [:student, :subject]
    render(conn, "show.html", score: score)
  end

  def edit(conn, %{"id" => id}) do
    score = Repo.get!(Score, id)
    changeset = Score.changeset(score)
    student = Repo.all(Student.Student)
    subject = Repo.all(Student.Subject)
    render(conn, "edit.html", score: score, changeset: changeset,
      student: student, subject: subject)
  end

  def update(conn, %{"id" => id, "score" => score_params}) do
    score = Repo.get!(Score, id)
    changeset = Score.changeset(score, score_params)

    case Repo.update(changeset) do
      {:ok, score} ->
        conn
        |> put_flash(:info, "Score updated successfully.")
        |> redirect(to: score_path(conn, :show, score))
      {:error, changeset} ->
        render(conn, "edit.html", score: score, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    score = Repo.get!(Score, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(score)

    conn
    |> put_flash(:info, "Score deleted successfully.")
    |> redirect(to: score_path(conn, :index))
  end
end
