defmodule XeroXero.CoreApi.Models.Employees do
    use Ecto.Schema
    import Ecto.Changeset
    
    @derive {Poison.Encoder, except: [:__meta__, :id]}

    schema "employees" do
        embeds_many :Employees, XeroXero.CoreApi.Models.Employees.Employee
    end

    def from_map(data) do
        %__MODULE__{}
        |> cast(data, [])
        |> cast_embed(:Employees)
        |> apply_changes
    end

    def from_validation_exception(data) do
        remapped_data = %{:Employees => data."Elements"}
        
        %__MODULE__{}
        |> cast(remapped_data, [])
        |> cast_embed(:Employees)
        |> apply_changes
    end
end
