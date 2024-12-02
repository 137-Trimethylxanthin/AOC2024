import Foundation

let day = 2

switch day {
case 2:
    let day2Solution = Day2()
    print("Day 2 Part 1 Solution:")
    day2Solution.solvePart1()
    print("\nDay 2 Part 2 Solution:")
    day2Solution.solvePart2()
default:
    print("Solution for Day \(day) not implemented")
}
