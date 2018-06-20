defmodule Wunder.Csv.Coordinates do
  alias Wunder.Csv
  alias Wunder.Structs.Coordinate

  @file_path "priv/csv/coordinates.csv"

  def read(file_path \\ @file_path) do
    file_path
    |> Csv.read()
    |> Stream.map(&Coordinate.new/1)
    |> Enum.to_list()
  end
end
