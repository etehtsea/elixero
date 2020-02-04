defmodule XeroXero.CoreApi.Models.RepeatingInvoices do
    use Ecto.Schema    
    import Ecto.Changeset

    @derive {Jason.Encoder, except: [:__meta__, :id]}

    schema "repeatinginvoices" do
        embeds_many :RepeatingInvoices, XeroXero.CoreApi.Models.RepeatingInvoices.RepeatingInvoice
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:RepeatingInvoices)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:RepeatingInvoices => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:RepeatingInvoices)
        |> apply_changes
    end
end
