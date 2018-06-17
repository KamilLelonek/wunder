defmodule Wunder.Structs.BoundingBox do
  @attributes ~w(bottom_left bottom_right top_left top_right)a

  @enforce_keys @attributes

  defstruct @attributes

  alias __MODULE__
  alias Wunder.Structs.Coordinate

  # NOTE: consider validation of BoundingBox shape
  def new([corner_a, corner_c]) do
    [c1, c2, c3, c4] = prepare_corners(corner_a, corner_c)

    %BoundingBox{
      bottom_left: c1,
      bottom_right: c2,
      top_left: c3,
      top_right: c4
    }
  end

  def contains?(
        %BoundingBox{
          bottom_left: %Coordinate{lat: lat_bl, lon: lon_bl},
          top_right: %Coordinate{lat: lat_tr, lon: lon_tr}
        },
        %Coordinate{lat: lat, lon: lon}
      ) do
    lat in lat_bl..lat_tr && lon in lon_bl..lon_tr
  end

  defp prepare_corners(corner_a = [x1, y1], corner_c = [x3, y3]) do
    coordinates = [
      Coordinate.new(corner_a),
      Coordinate.new([x1, y3]),
      Coordinate.new(corner_c),
      Coordinate.new([x3, y1])
    ]

    Enum.sort_by(coordinates, &{&1.lon, &1.lat})
  end
end
