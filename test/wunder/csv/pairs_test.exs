defmodule Wunder.Csv.PairsTest do
  use ExUnit.Case, async: true

  alias Wunder.Csv.Pairs
  alias Wunder.Structs.{Coordinate, BoundingBox}

  @file_path "test/fixtures/pairs.csv"

  describe "read" do
    test "should read and parse Paris" do
      assert [
               %BoundingBox{
                 bottom_left: %Coordinate{lat: 120.99206, lon: 14.75659},
                 bottom_right: %Coordinate{lat: 120.99287, lon: 14.75659},
                 top_left: %Coordinate{
                   lat: 120.99206,
                   lon: 14.756699999999999
                 },
                 top_right: %Coordinate{
                   lat: 120.99287,
                   lon: 14.756699999999999
                 }
               },
               %BoundingBox{
                 bottom_left: %Coordinate{
                   lat: 120.99203999999999,
                   lon: 14.756939999999998
                 },
                 bottom_right: %Coordinate{
                   lat: 120.99207999999999,
                   lon: 14.756939999999998
                 },
                 top_left: %Coordinate{
                   lat: 120.99203999999999,
                   lon: 14.757139999999998
                 },
                 top_right: %Coordinate{
                   lat: 120.99207999999999,
                   lon: 14.757139999999998
                 }
               }
             ] = Pairs.read(@file_path)
    end
  end
end
