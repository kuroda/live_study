defmodule LiveStudyWeb.StudyLive do
  use LiveStudyWeb, :live_view

  def render(assigns), do: LiveStudyWeb.StudyLiveView.render("index.html", assigns)

  @impl true
  def mount(_params, _session, socket) when socket.assigns.live_action == :show do
    {:ok, assign(socket, a: "A", b: %{x: 1})}
  end

  def mount(_params, _session, socket) when socket.assigns.live_action == :list do
    {:ok, assign(socket, a: "A", b: %{x: 1})}
  end

  @impl true
  def handle_event("increment", _params, socket) do
    x = socket.assigns.b.x + 1
    {:noreply, assign(socket, b: %{x: x})}
  end

  def handle_event("toggle", _params, socket) do
    a =
      case socket.assigns.a do
        "A" -> "B"
        "B" -> "A"
      end

    {:noreply, assign(socket, a: a)}
  end
end
