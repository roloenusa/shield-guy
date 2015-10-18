# Script for populating the database. You can run it as:
#
#     mix run priv/repo/seeds.exs
#
# Inside the script, you can read and write to any of your
# repositories directly:
#
#     Simple.Repo.insert!(%SomeModel{})
#
# We recommend using the bang functions (`insert!`, `update!`
# and so on) as they will fail if something goes wrong.

data = [
  # { name,                  hp, bloodied, ac, fort, ref, will, str, con, dex, int, wis, cha }
    { "Darella Dawnstriker", 32, 16,       12, 15,   11,  14,   10,  20,  8,   11,  10,  16  }
]

defmodule Seeds do
  # Start import
  def import_data(data) do
    import_characters(data)
  end

  def import_characters([]), do: nil
  def import_characters([char | tail]) do
    {name, hp, bloodied, ac, fort, ref, will, str, con, dex, int, wis, cha} = char
    %ShieldGuy.Character{
      name: name,
      hp: hp,
      bloodied: bloodied,
      ac: ac,
      fort: fort,
      ref: ref,
      will: will,

      str: str,
      con: con,
      dex: dex,
      int: int,
      wis: wis,
      cha: cha
    }
      |> ShieldGuy.Repo.insert!

    import_characters(tail)
  end
end

Seeds.import_data(data)
