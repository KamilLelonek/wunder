defmodule Wunder.Csv do
  def read(file_path) do
    file_path
    |> File.stream!()
    |> Stream.drop(1)
    |> Stream.map(&String.trim/1)
    |> Stream.map(&split_and_cast/1)
  end

  defp split_and_cast(string) do
    with [lat, lon] = String.split(string, ","),
         {lat, ""} <- Float.parse(lat),
         {lon, ""} <- Float.parse(lon) do
      [lat, lon]
    end
  end
end
