import Foundation
let date = Date()
let day = date.get(.day);

switch day {
case 2:
    let day2Solution = Day2()
    print("Day 2 Part 1 Solution:")
    day2Solution.solvePart1()
    print("\nDay 2 Part 2 Solution:")
    day2Solution.solvePart2()
case 3:
    let day3 = Day3()
    print("Day 3 Part 1 Solution:")
    day3.solvePart1()
    print("\nDay 3 Part 2 Solution:")
    day3.solvePart2()
case 4:
    let day4 = Day4()
    print("Day 4 Part 1 Solution:")
    day4.solvePart1()
    print("\nDay 4 Part 2 Solution:")
    day4.solvePart2()
default:
    print("Solution for Day \(day) not implemented")
}
