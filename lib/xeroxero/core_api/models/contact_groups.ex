defmodule XeroXero.CoreApi.Models.ContactGroups do
    use Ecto.Schema
    import Ecto.Changeset
    @derive {Jason.Encoder, except: [:__meta__, :id]}

    schema "contactgroups" do
        embeds_many :ContactGroups, XeroXero.CoreApi.Models.ContactGroups.ContactGroup
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:ContactGroups)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:ContactGroups => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:ContactGroups)
        |> apply_changes
    end
end
