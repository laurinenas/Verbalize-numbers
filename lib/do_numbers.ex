defmodule DoNumbers do
  @moduledoc """
  Verbalizes numbers so you can use it writing invoices.
  """

  @doc """
  ## Examples

      iex> DoNumbers.verbalize(1)
      "one"
      iex> DoNumbers.verbalize(987654)
      "nine hundred and eighty seven thousand six hundred and fifty four"

  """

  # 10pow0 = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourten", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
  # 10pow1 = []

  @spec verbalize(number()) :: String.t()
  def verbalize(x) when x < 20 do
    Enum.at(
      [
        "zero",
        "one",
        "two",
        "three",
        "four",
        "five",
        "six",
        "seven",
        "eight",
        "nine",
        "ten",
        "eleven",
        "twelve",
        "thirteen",
        "fourten",
        "fifteen",
        "sixteen",
        "seventeen",
        "eighteen",
        "nineteen"
      ],
      x
    )
  end

  def verbalize(x) when x < 100 do
    reminder = rem(x, 10)

    result =
      Enum.at(
        ["", "ten", "twenty", "thirty", "fourty", "fifty", "sixty", "seventy", "eighty", "ninety"],
        div(x, 10)
      )

    cond do
      reminder == 0 -> result
      reminder > 0 -> result <> " " <> DoNumbers.verbalize(reminder)
    end
  end

  def verbalize(x) when x < 1000 do
    verbalize(div(x, 100)) <>
      " hundred" <>
      case rem(x, 100) do
        0 -> ""
        y -> " and " <> verbalize(y)
      end

    #  return hundreds names + verbalize x/10
  end

  def verbalize(x) when x < 1_000_000 do
    reminder =
      case rem(x, 1000) do
        0 -> ""
        y -> " " <> verbalize(y)
      end

    verbalize(div(x, 1000)) <> " thousand" <> reminder
    #  return hundreds names + verbalize x/10
  end

  def verbalize(x) when x < 1_000_000_000 do
    reminder = rem(x, 1_000_000)
    result = verbalize(div(x, 1_000_000)) <> " million"

    case reminder do
      0 -> result
      _ -> result <> " " <> verbalize(reminder)
    end

    #  return hundreds names + verbalize x/10
  end
end
