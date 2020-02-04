defmodule XeroXero.CoreApi.Models.Prepayments.Prepayment do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Jason.Encoder, except: [:__meta__, :id]}

    @fields [
        :PrepaymentID,
        :Date,
        :Status,
        :LineAmountTypes,
        :SubTotal,
        :TotalTax,
        :Total,
        :CurrencyCode,
        :CurrencyRate,
        :Type,
        :RemainingCredit,
        :HasAttachments,
        :UpdatedDateUTC,
        :StatusAttributeString
    ]

    schema "prepayments" do
        field :PrepaymentID, Ecto.UUID
        embeds_one :Contact, XeroXero.CoreApi.Models.Contacts.Contact
        field :Date, :string
        field :Status, :string
        field :LineAmountTypes, :string
        embeds_many :LineItems, XeroXero.CoreApi.Models.Common.LineItem
        field :SubTotal, :decimal
        field :TotalTax, :decimal
        field :Total, :decimal
        field :CurrencyCode, :string
        field :CurrencyRate, :decimal
        field :Type, :string
        field :RemainingCredit, :decimal
        field :HasAttachments, :boolean
        embeds_many :Allocations, XeroXero.CoreApi.Models.Allocations.Allocation
        embeds_many :Payments, XeroXero.CoreApi.Models.Payments.Payment
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, XeroXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, XeroXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string 
    end

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:Contact)
        |> cast_embed(:LineItems)
        |> cast_embed(:Allocations)
        |> cast_embed(:Payments)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end
