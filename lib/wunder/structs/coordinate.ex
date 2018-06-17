defmodule Wunder.Structs.Coordinate do
  @attributes ~w(lat lon)a

  @enforce_keys @attributes

  defstruct @attributes

  alias __MODULE__

  def new([lat, lon]), do: %Coordinate{lat: lat, lon: lon}
end
