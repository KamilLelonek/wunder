defmodule Wunder.Structs.MapTest do
  use ExUnit.Case, async: true

  alias Wunder.Structs.{Map, Coordinate, BoundingBox}

  describe "assign_bounding_boxes" do
    test "should assign a BoundingBox to the given Coordinates" do
      coordinates = [
        Coordinate.new([1.1, 2.2]),
        Coordinate.new([10.10, 20.20])
      ]

      bounding_boxes = [
        BoundingBox.new([[-10.0, -10.0], [0, 0]]),
        BoundingBox.new([[0, 0], [10.0, 10.0]])
      ]

      map = Map.new(bounding_boxes)

      assert [
               %{
                 bounding_box: %BoundingBox{
                   bottom_left: %Coordinate{lat: 0, lon: 0},
                   bottom_right: %Coordinate{lat: 10.0, lon: 0},
                   top_left: %Coordinate{lat: 0, lon: 10.0},
                   top_right: %Coordinate{lat: 10.0, lon: 10.0}
                 },
                 coordinate: %Coordinate{lat: 1.1, lon: 2.2}
               }
             ] = Map.assign_bounding_boxes(map, coordinates)
    end
  end
end
