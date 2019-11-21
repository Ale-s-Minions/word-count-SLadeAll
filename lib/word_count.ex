defmodule WordCount do
  @doc """
  Count the number of words in the sentence.

  Words are compared case-insensitively.
  """
  @spec count(String.t) :: map
  def count(sentence) do
    sentence
    |>  String.downcase()
    |>  String.replace(~r/@|#|:|_|-|\$|!|\^|&||%|,/u, " ")
    |>  String.split()
    |>  Enum.reduce(%{},fn word, counts ->
      counts
      |> Map.put_new(word, 0)
      |> Map.update(word, 1,&(&1 + 1))
    end)
  end
end
