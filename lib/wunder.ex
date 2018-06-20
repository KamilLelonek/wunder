defmodule Wunder do
  alias Wunder.Csv.{Coordinates, Pairs}
  alias Wunder.Structs.{Map, Coordinate}

  @bounding_boxes Pairs.read()
  @coordinates Coordinates.read()

  def task1(bounding_boxes \\ @bounding_boxes, coordinates \\ @coordinates),
    do: assign_bounding_boxes(bounding_boxes, coordinates)

  def task2(
        bounding_boxes \\ @bounding_boxes,
        origin = [_lat_origin, _lon_origin],
        destination = [_lat_destination, _lon_destination]
      ) do
    assign_bounding_boxes(
      bounding_boxes,
      [
        Coordinate.new(origin),
        Coordinate.new(destination)
      ]
    )
  end

  defp assign_bounding_boxes(bounding_boxes, coordinates) do
    bounding_boxes
    |> Map.new()
    |> Map.assign_bounding_boxes(coordinates)
  end
end
