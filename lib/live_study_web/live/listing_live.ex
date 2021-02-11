defmodule LiveStudyWeb.ListingLive do
  use LiveStudyWeb, :live_view
  require Logger, warn: false

  def render(assigns), do: LiveStudyWeb.ListingLiveView.render("index.html", assigns)

  @impl true
  def mount(_params, _session, socket) do
    users = [
      %{id: "1", name: "Alice", checked: false},
      %{id: "2", name: "Bob", checked: false}
    ]

    {:ok, assign(socket, users: users)}
  end

  @impl true
  def handle_event("toggle", %{"id" => id} = _params, socket) do
    users =
      Enum.map(socket.assigns.users, fn
        u when u.id == id -> %{u | checked: not u.checked}
        u -> u
      end)

    {:noreply, assign(socket, users: users)}
  end
end
