defmodule LiveStudyWeb.UserComponent do
  use Phoenix.LiveComponent

  def render(assigns) do
    ~L"""
    <li>
      <b><%= @user.name %></b>
      <button phx-click="toggle" phx-value-id="<%= @user.id %>">
        <%= if @user.checked, do: "Yes", else: "No" %>
      </button>
    </li>
    """
  end
end
