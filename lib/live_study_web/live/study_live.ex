defmodule LiveStudyWeb.StudyLive do
  use LiveStudyWeb, :live_view

  @impl true
  def mount(_params, _session, socket) do
    {:ok, assign(socket, a: "A", b: %{x: 1})}
  end

  @impl true
  def handle_event("increment", _params, socket) do
    x = socket.assigns.b.x + 1
    {:noreply, assign(socket, b: %{x: x})}
  end
end
