defmodule Wunder.Csv.CoordinatesTest do
  use ExUnit.Case, async: true

  alias Wunder.Csv.Coordinates
  alias Wunder.Structs.Coordinate

  @file_path "test/fixtures/coordinates.csv"

  describe "read" do
    test "should read and parse Coordinates" do
      assert [
               %Coordinate{lat: 120.9931, lon: 14.7583},
               %Coordinate{lat: 121.0039, lon: 14.5157},
               %Coordinate{lat: 121.0027, lon: 14.4941},
               %Coordinate{lat: 120.9541, lon: 14.5882}
             ] = Coordinates.read(@file_path)
    end
  end
end
