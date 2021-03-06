defmodule LiveStudyWeb.ListingLive do
  use LiveStudyWeb, :live_view
  require Logger, warn: false

  def render(assigns), do: LiveStudyWeb.ListingLiveView.render(assigns.template, assigns)

  @impl true
  def mount(_params, _session, socket) do
    users = [
      %{id: "100", name: "Alice", checked: false},
      %{id: "101", name: "Bob", checked: false},
      %{id: "102", name: "Carol", checked: false},
      %{id: "103", name: "David", checked: false},
      %{id: "104", name: "Eve", checked: false},
    ]

    {:ok, assign(socket, users: users)}
  end

  @impl true
  def handle_params(_params, _uri, socket) when socket.assigns.live_action == :index do
    {:noreply, assign(socket, template: "index.html")}
  end

  def handle_params(_params, _uri, socket) when socket.assigns.live_action == :list do
    {:noreply, assign(socket, template: "list.html")}
  end

  def handle_params(_params, _uri, socket) when socket.assigns.live_action == :components do
    {:noreply, assign(socket, template: "components.html")}
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
