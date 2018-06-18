defmodule Wunder.Structs.Map do
  @attributes ~w(bounding_boxes)a

  @enforce_keys @attributes

  defstruct @attributes

  alias __MODULE__
  alias Wunder.Structs.BoundingBox

  def new(bounding_boxes), do: %Map{bounding_boxes: bounding_boxes}

  def assign_bounding_boxes(map, coordinates) do
    coordinates
    |> Enum.map(&assign_bounding_box(map, &1))
    |> Enum.reject(&without_bounding_box?/1)
  end

  defp assign_bounding_box(%Map{bounding_boxes: bounding_boxes}, coordinate) do
    %{
      coordinate: coordinate,
      bounding_box: Enum.find(bounding_boxes, &BoundingBox.contains?(&1, coordinate))
    }
  end

  defp without_bounding_box?(%{bounding_box: nil}), do: true
  defp without_bounding_box?(_), do: false
end
