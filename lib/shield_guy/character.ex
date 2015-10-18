defmodule ShieldGuy.Character do
  use Ecto.Model

  import Ecto.Query

  schema "characters" do
    field :name       # Defaults to type :string

    field :hp,        :integer
    field :bloodied,  :integer
    field :ac,        :integer
    field :fort,      :integer
    field :ref,       :integer
    field :will,      :integer

    field :str,       :integer
    field :con,       :integer
    field :dex,       :integer
    field :int,       :integer
    field :wis,       :integer
    field :cha,       :integer

    timestamps
  end

  @required_fields ~w()
  @optional_fields ~w()

  def find_by_name(name) do
    query = from c in ShieldGuy.Character,
          where: c.name == ^name,
         select: c
    ShieldGuy.Repo.find(query)
  end

  def update(character, params) do
    char = Map.merge(character, params)
    Repo.update(char)
      |> after_save(char)
  end

  def after_save(nil, char), do: {:error, :unable_to_save}
  def after_save(:ok, char), do: {:ok, char}

  def changeset(model, params \\ :empty) do
    model
    |> cast(params, @required_fields, @optional_fields)
  end
end
