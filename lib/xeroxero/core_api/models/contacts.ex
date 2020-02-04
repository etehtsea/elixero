defmodule XeroXero.CoreApi.Models.Contacts do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "contacts" do
        embeds_many :Contacts, XeroXero.CoreApi.Models.Contacts.Contact
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Contacts)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:Contacts => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:Contacts)
        |> apply_changes
    end
end
