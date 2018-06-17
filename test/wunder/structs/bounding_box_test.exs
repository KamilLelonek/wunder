defmodule Wunder.Structs.BoundingBoxTest do
  use ExUnit.Case, async: true

  alias Wunder.Structs.{BoundingBox, Coordinate}

  describe "new" do
    test "should properly order positive coordinates" do
      assert %{
               bottom_left: %{lat: 1, lon: 2},
               bottom_right: %{lat: 3, lon: 2},
               top_left: %{lat: 1, lon: 4},
               top_right: %{lat: 3, lon: 4}
             } = BoundingBox.new([[1, 2], [3, 4]])
    end

    test "should properly order negative coordinates" do
      assert %{
               bottom_left: %{lat: -3, lon: -4},
               bottom_right: %{lat: -1, lon: -4},
               top_left: %{lat: -3, lon: -2},
               top_right: %{lat: -1, lon: -2}
             } = BoundingBox.new([[-1, -2], [-3, -4]])
    end

    test "should properly order mixed coordinates" do
      assert %{
               bottom_left: %{lat: -1, lon: -2},
               bottom_right: %{lat: 3, lon: -2},
               top_left: %{lat: -1, lon: 4},
               top_right: %{lat: 3, lon: 4}
             } = BoundingBox.new([[-1, -2], [3, 4]])
    end
  end

  describe "contains?" do
    test "should confirm a Cooridnate belongs to a BoundingBox" do
      bounding_box = %BoundingBox{
        bottom_left: %Coordinate{lat: 0, lon: 0},
        bottom_right: %Coordinate{lat: 2.50, lon: 0},
        top_left: %Coordinate{lat: 0, lon: 20.5},
        top_right: %Coordinate{lat: 20.5, lon: 20.5}
      }

      coordinate = %Coordinate{lat: 10.5, lon: 10.5}

      assert BoundingBox.contains?(bounding_box, coordinate)
    end

    test "should reject a Cooridnate belongs to a BoundingBox" do
      bounding_box = %BoundingBox{
        bottom_left: %Coordinate{lat: -10.3, lon: -10.3},
        bottom_right: %Coordinate{lat: 10.3, lon: -10.3},
        top_left: %Coordinate{lat: -10.3, lon: 10.3},
        top_right: %Coordinate{lat: 10.3, lon: 10.3}
      }

      coordinate = %Coordinate{lat: 15.3, lon: 20.3}

      refute BoundingBox.contains?(bounding_box, coordinate)
    end
  end
end
