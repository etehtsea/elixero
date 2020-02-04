defmodule XeroXero.CoreApi.Models.Attachments do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Jason.Encoder, except: [:__meta__, :id]}

    schema "attachments" do
        embeds_many :Attachments, XeroXero.CoreApi.Models.Attachments.Attachment
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Attachments)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:Attachments => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:Attachments)
        |> apply_changes
    end
end
