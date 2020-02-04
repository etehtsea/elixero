defmodule XeroXero.CoreApi.Models.BankTransfers.BankTransfer do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [
        :BankTransferID,
        :FromBankTransactionID,
        :ToBankTransactionID,
        :CurrencyRate,
        :Amount,
        :Date,
        :HasAttachments,
        :UpdatedDateUTC,
        :StatusAttributeString,
    ]

    schema "banktransfers" do
        field :BankTransferID, Ecto.UUID
        embeds_one :FromBankAccount, XeroXero.CoreApi.Models.Accounts.Account
        embeds_one :ToBankAccount, XeroXero.CoreApi.Models.Accounts.Account
        field :FromBankTransactionID, Ecto.UUID
        field :ToBankTransactionID, Ecto.UUID
        field :CurrencyRate, :decimal
        field :Amount, :decimal
        field :Date, :string
        field :HasAttachments, :boolean
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, XeroXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, XeroXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string  
    end

    def changeset(struct, data) do
        struct
        |> cast(data, @fields)
        |> cast_embed(:FromBankAccount)
        |> cast_embed(:ToBankAccount)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end
end
