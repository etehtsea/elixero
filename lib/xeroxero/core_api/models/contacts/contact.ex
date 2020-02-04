defmodule XeroXero.CoreApi.Models.Contacts.Contact do
    use Ecto.Schema
    import Ecto.Changeset

    @derive {Poison.Encoder, except: [:__meta__, :id]}

    @fields [        
        :ContactID,
        :ContactStatus,
        :Name,
        :ContactNumber,
        :FirstName,
        :LastName,
        :EmailAddress,
        :SkypeUserName,
        :BankAccountDetails,
        :TaxNumber,
        :AccountsReceivableTaxType,
        :AccountsPayableTaxType,
        :IsSupplier,
        :IsCustomer,
        :DefaultCurrency,
        :Website,
        :Discount,
        :XeroNetworkKey,
        :HasAttachments,
        :PurchasesDefaultAccountCode,
        :SalesDefaultAccountCode,
        :AccountNumber,
        :UpdatedDateUTC,
        :StatusAttributeString,
    ]

    schema "contacts" do
        field :ContactID, Ecto.UUID
        field :ContactStatus, :string
        field :Name, :string
        field :ContactNumber, :string
        field :FirstName, :string
        field :LastName, :string
        field :EmailAddress, :string
        field :SkypeUserName, :string
        field :BankAccountDetails, :string
        field :TaxNumber, :string
        field :AccountsReceivableTaxType, :string
        field :AccountsPayableTaxType, :string
        field :IsSupplier, :boolean
        field :IsCustomer, :boolean
        field :DefaultCurrency, :string
        field :Website, :string
        field :Discount, :decimal
        field :XeroNetworkKey, :string
        field :HasAttachments, :boolean
        field :PurchasesDefaultAccountCode, :string
        field :SalesDefaultAccountCode, :string
        embeds_many :SalesTrackingCategories, XeroXero.CoreApi.Models.Contacts.Contact.TrackingCategory
        embeds_many :PurchasesTrackingCategories, XeroXero.CoreApi.Models.Contacts.Contact.TrackingCategory
        embeds_one :BrandingTheme, XeroXero.CoreApi.Models.BrandingThemes.BrandingTheme
        embeds_one :BatchPayments, XeroXero.CoreApi.Models.Contacts.Contact.BatchPayments
        embeds_one :Balances, XeroXero.CoreApi.Models.Contacts.Contact.Balances
        embeds_one :PaymentTerms, XeroXero.CoreApi.Models.Common.PaymentTerms
        embeds_many :ContactPersons, XeroXero.CoreApi.Models.Contacts.Contact.ContactPerson
        embeds_many :Addresses, XeroXero.CoreApi.Models.Common.Address
        embeds_many :Phones, XeroXero.CoreApi.Models.Common.Phone
        embeds_many :ContactGroups, XeroXero.CoreApi.Models.ContactGroups.ContactGroup
        field :AccountNumber, :string
        field :UpdatedDateUTC, :string
        embeds_many :ValidationErrors, XeroXero.CoreApi.Models.Common.Error
        embeds_many :Warnings, XeroXero.CoreApi.Models.Common.Warning
        field :StatusAttributeString, :string
    end

    def changeset(struct, data) do
        struct 
        |> cast(data, @fields)
        |> cast_embed(:SalesTrackingCategories)
        |> cast_embed(:PurchasesTrackingCategories)
        |> cast_embed(:BrandingTheme)
        |> cast_embed(:BatchPayments)
        |> cast_embed(:Balances)
        |> cast_embed(:PaymentTerms)
        |> cast_embed(:ContactPersons)
        |> cast_embed(:Addresses)
        |> cast_embed(:Phones)
        |> cast_embed(:ContactGroups)
        |> cast_embed(:ValidationErrors)
        |> cast_embed(:Warnings)
    end    
end
