defmodule XeroXero.CoreApi.Models.Organisations do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Jason.Encoder, except: [:__meta__, :id]}

    schema "organisations" do
        embeds_many :Organisations, XeroXero.CoreApi.Models.Organisations.Organisation
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Organisations)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:Organisations => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:Organisations)
        |> apply_changes
    end
end
