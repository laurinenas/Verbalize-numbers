defmodule DoNumbersTest do
  use ExUnit.Case
  doctest DoNumbers

  test "One digit numbers" do
    words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourten", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]
    for n <- 0..19 do
      assert DoNumbers.verbalize(n) == Enum.at(words, n)
    end
  end

  test "Two digit numbers" do
    words = ["zero", "one", "two", "three", "four", "five", "six", "seven", "eight", "nine", "ten", "eleven", "twelve", "thirteen", "fourten", "fifteen", "sixteen", "seventeen", "eighteen", "nineteen"]

    Enum.each(10..19, &(
      assert DoNumbers.verbalize(&1) == Enum.at(words, &1)
    ))

    assert DoNumbers.verbalize(123) == "one hundred and twenty three"
    assert DoNumbers.verbalize(123123) == "one hundred and twenty three thousand one hundred and twenty three"
  end

end
