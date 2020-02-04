defmodule XeroXero.CoreApi.Models.Reports do
    use Ecto.Schema
    import Ecto.Changeset 
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "reports" do
        embeds_many :Reports, XeroXero.CoreApi.Models.Reports.Report
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Reports)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:Reports => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:Reports)
        |> apply_changes
    end
end
