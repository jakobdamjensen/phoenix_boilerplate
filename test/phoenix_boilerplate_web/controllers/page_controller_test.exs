defmodule PhoenixBoilerplateWeb.PageControllerTest do
  use PhoenixBoilerplateWeb.ConnCase

  import PhoenixBoilerplate.Factory

  describe "when authenticated" do
    setup %{conn: conn} do
      user = insert(:user)
      conn = Pow.Plug.assign_current_user(conn, user, otp_app: :phoenix_boilerplate)

      {:ok, conn: conn}
    end

    test "GET /", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 200) =~ "Welcome to Phoenix!"
    end
  end

  describe "when not authenticated" do
    test "GET /", %{conn: conn} do
      conn = get(conn, "/")
      assert html_response(conn, 302) =~ "/session/new"
    end
  end
end
