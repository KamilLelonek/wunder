defmodule WunderTest do
  use ExUnit.Case, async: true

  alias Wunder.Structs.{BoundingBox, Coordinate}

  describe "task1" do
    test "should assign all Coordinates to the calculated BoundingBoxes" do
      assert [
               %{
                 bounding_box: %BoundingBox{
                   bottom_left: %Coordinate{
                     lat: 120.99969999999999,
                     lon: 14.473830000000003
                   },
                   bottom_right: %Coordinate{
                     lat: 121.00115999999998,
                     lon: 14.473830000000003
                   },
                   top_left: %Coordinate{
                     lat: 120.99969999999999,
                     lon: 14.475110000000003
                   },
                   top_right: %Coordinate{
                     lat: 121.00115999999998,
                     lon: 14.475110000000003
                   }
                 },
                 coordinate: %Coordinate{lat: 121.001, lon: 14.4743}
               },
               %{
                 bounding_box: %BoundingBox{
                   bottom_left: %Coordinate{
                     lat: 120.97901000000002,
                     lon: 14.59234
                   },
                   bottom_right: %Coordinate{
                     lat: 120.97985000000001,
                     lon: 14.59234
                   },
                   top_left: %Coordinate{
                     lat: 120.97901000000002,
                     lon: 14.59343
                   },
                   top_right: %Coordinate{
                     lat: 120.97985000000001,
                     lon: 14.59343
                   }
                 },
                 coordinate: %Coordinate{lat: 120.9798, lon: 14.5926}
               },
               %{
                 bounding_box: %BoundingBox{
                   bottom_left: %Coordinate{
                     lat: 120.99506000000001,
                     lon: 14.51064
                   },
                   bottom_right: %Coordinate{lat: 120.99562, lon: 14.51064},
                   top_left: %Coordinate{
                     lat: 120.99506000000001,
                     lon: 14.51318
                   },
                   top_right: %Coordinate{lat: 120.99562, lon: 14.51318}
                 },
                 coordinate: %Coordinate{lat: 120.9956, lon: 14.5126}
               },
               %{
                 bounding_box: %BoundingBox{
                   bottom_left: %Coordinate{
                     lat: 120.97217,
                     lon: 14.745920000000003
                   },
                   bottom_right: %Coordinate{
                     lat: 120.97252,
                     lon: 14.745920000000003
                   },
                   top_left: %Coordinate{
                     lat: 120.97217,
                     lon: 14.746730000000003
                   },
                   top_right: %Coordinate{
                     lat: 120.97252,
                     lon: 14.746730000000003
                   }
                 },
                 coordinate: %Coordinate{lat: 120.9724, lon: 14.7462}
               },
               %{
                 bounding_box: %BoundingBox{
                   bottom_left: %Coordinate{
                     lat: 120.99708999999999,
                     lon: 14.469610000000005
                   },
                   bottom_right: %Coordinate{
                     lat: 120.99795999999999,
                     lon: 14.469610000000005
                   },
                   top_left: %Coordinate{
                     lat: 120.99708999999999,
                     lon: 14.471230000000006
                   },
                   top_right: %Coordinate{
                     lat: 120.99795999999999,
                     lon: 14.471230000000006
                   }
                 },
                 coordinate: %Coordinate{lat: 120.9971, lon: 14.4704}
               }
             ] = Wunder.task1()
    end
  end

  describe "task2" do
    test "should assign the given Coordinates to the matching BoundingBoxes" do
      assert [
               %{
                 bounding_box: %BoundingBox{
                   bottom_left: %Coordinate{
                     lat: 120.99708999999999,
                     lon: 14.469610000000005
                   },
                   bottom_right: %Coordinate{
                     lat: 120.99795999999999,
                     lon: 14.469610000000005
                   },
                   top_left: %Coordinate{
                     lat: 120.99708999999999,
                     lon: 14.471230000000006
                   },
                   top_right: %Coordinate{
                     lat: 120.99795999999999,
                     lon: 14.471230000000006
                   }
                 },
                 coordinate: %Coordinate{lat: 120.9971, lon: 14.4704}
               }
             ] == Wunder.task2([120.9971, 14.4704], [10, 10])
    end
  end
end
