defmodule Wunder.Csv.Pairs do
  alias Wunder.Csv
  alias Wunder.Structs.BoundingBox

  @file_path "priv/csv/pairs.csv"

  def read(file_path \\ @file_path) do
    file_path
    |> Csv.read()
    |> Stream.chunk_every(2)
    |> Stream.map(&BoundingBox.new/1)
    |> Enum.to_list()
  end
end
