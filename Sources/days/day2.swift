import Foundation

struct Day2 {
    // Path to your input file
    private let inputPath = "Sources/inputs/real/day2.txt"

    // Solve Part 1 of the Day 2 challenge
    func solvePart1() {
        let lines = FileTools.readLines(from: inputPath)

        var result = 0
        for line in lines {
            let levels = line.split(separator: " ").asStrings().asInts
            
            if isReportSafe(levels) {
                result += 1
            }
        }

        print("Part 1 Solution: \(result)")
    }

     private func isReportSafe(_ levels: [Int]) -> Bool {
        // Check if all levels are increasing or decreasing
        
        let isIncreasing = levels.enumerated().allSatisfy { index, level in
            index == 0 || (level - levels[index - 1] > 0)
        }
        
        let isDecreasing = levels.enumerated().allSatisfy { index, level in
            index == 0 || (level - levels[index - 1] < 0)
        }
        
        // If not strictly increasing or decreasing, return false
        guard isIncreasing || isDecreasing else {
            return false
        }
        
        // Check adjacent level differences
        let levelDifferences = zip(levels.dropFirst(), levels).map { abs($0 - $1) }
        let validDifferences = levelDifferences.allSatisfy { $0 >= 1 && $0 <= 3 }
        
        return validDifferences
    }
    

    // Solve Part 2 of the Day 2 challenge
    func solvePart2() {
        let lines = FileTools.readLines(from: inputPath)

        var result = 0
        for line in lines {
            let levels = line.split(separator: " ").asStrings().asInts
            
            for i in 0...levels.count - 1{
                var newLvl = levels;
                newLvl.remove(at: i)
                if isReportSafe(newLvl) {
                    result += 1
                    break;
                }
            }
        }

        print("Part 2 Solution: \(result)")
    }

}
