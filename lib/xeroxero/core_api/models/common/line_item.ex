defmodule XeroXero.CoreApi.Models.Common.LineItem do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Jason.Encoder, except: [:__meta__, :id]}

    @fields [
        :LineItemID,
        :Description,
        :Quantity,
        :UnitAmount,
        :AccountCode,
        :ItemCode,
        :TaxType,
        :TaxAmount,
        :LineAmount,
        :DiscountRate,
        :StatusAttributeString     
    ]

    schema "lineitems" do
        field :LineItemID, Ecto.UUID
        field :Description, :string
        field :Quantity, :decimal
        field :UnitAmount, :decimal
        field :AccountCode, :string
        field :ItemCode, :string
        field :TaxType, :string
        field :TaxAmount, :decimal
        field :LineAmount, :decimal
        field :DiscountRate, :decimal
        embeds_many :Tracking, XeroXero.CoreApi.Models.Common.LineItems.TrackingCategory
        embeds_many :ValidationErrors, XeroXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, XeroXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string        
    end

    def changeset(struct, data) do
        struct 
        |> cast(data, @fields)
        |> cast_embed(:Tracking)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end
