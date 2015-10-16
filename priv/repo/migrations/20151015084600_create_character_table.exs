defmodule ShieldGuy.Repo.Migrations.CreateCharacterTable do
  use Ecto.Migration

  def change do
    create table(:characters) do
      add :name,      :string  # Defaults to type :string

      add :hp,        :integer
      add :bloodied,  :integer
      add :ac,        :integer
      add :fort,      :integer
      add :ref,       :integer
      add :will,      :integer

      add :str,       :integer
      add :con,       :integer
      add :dex,       :integer
      add :int,       :integer
      add :wis,       :integer
      add :cha,       :integer

      timestamps
    end
  end
end
