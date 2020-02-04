defmodule XeroXero.CoreApi.Models.Prepayments do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "prepayments" do
        embeds_many :Prepayments, XeroXero.CoreApi.Models.Prepayments.Prepayment
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Prepayments)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:Prepayments => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:Prepayments)
        |> apply_changes
    end
end
