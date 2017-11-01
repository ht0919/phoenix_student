defmodule Student.SubjectController do
  use Student.Web, :controller

  alias Student.Subject

  def index(conn, _params) do
    subject = Repo.all(Subject)
    render(conn, "index.html", subject: subject)
  end

  def new(conn, _params) do
    changeset = Subject.changeset(%Subject{})
    render(conn, "new.html", changeset: changeset)
  end

  def create(conn, %{"subject" => subject_params}) do
    changeset = Subject.changeset(%Subject{}, subject_params)

    case Repo.insert(changeset) do
      {:ok, subject} ->
        conn
        |> put_flash(:info, "Subject created successfully.")
        |> redirect(to: subject_path(conn, :show, subject))
      {:error, changeset} ->
        render(conn, "new.html", changeset: changeset)
    end
  end

  def show(conn, %{"id" => id}) do
    subject = Repo.get!(Subject, id)
    render(conn, "show.html", subject: subject)
  end

  def edit(conn, %{"id" => id}) do
    subject = Repo.get!(Subject, id)
    changeset = Subject.changeset(subject)
    render(conn, "edit.html", subject: subject, changeset: changeset)
  end

  def update(conn, %{"id" => id, "subject" => subject_params}) do
    subject = Repo.get!(Subject, id)
    changeset = Subject.changeset(subject, subject_params)

    case Repo.update(changeset) do
      {:ok, subject} ->
        conn
        |> put_flash(:info, "Subject updated successfully.")
        |> redirect(to: subject_path(conn, :show, subject))
      {:error, changeset} ->
        render(conn, "edit.html", subject: subject, changeset: changeset)
    end
  end

  def delete(conn, %{"id" => id}) do
    subject = Repo.get!(Subject, id)

    # Here we use delete! (with a bang) because we expect
    # it to always work (and if it does not, it will raise).
    Repo.delete!(subject)

    conn
    |> put_flash(:info, "Subject deleted successfully.")
    |> redirect(to: subject_path(conn, :index))
  end
end
