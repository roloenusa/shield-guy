defmodule ShieldGuy.Repo do
  use Ecto.Repo, otp_app: :shield_guy

  def find(query) do
    all(query)
      |> get_single
  end

  defp get_single([]), do: nil
  defp get_single([head | tail]), do: head
end
