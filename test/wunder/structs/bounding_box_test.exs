defmodule Wunder.Structs.BoundingBoxTest do
  use ExUnit.Case, async: true

  alias Wunder.Structs.BoundingBox

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
end
