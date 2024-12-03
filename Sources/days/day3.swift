import Foundation

struct Day3 {
    // Path to your input file
    private let inputPath = "Sources/inputs/real/day3.txt"

    // Solve Part 1 of the Day 2 challenge
    func solvePart1() {
        let text = FileTools.readFile(from: inputPath)
        let regex = try? NSRegularExpression(
            pattern: #"mul\((\d+),(\d+)\)"#,
                        options: [.anchorsMatchLines] // Equivalent to multiline 'm' flag
        )
        let matches = regex?.matches(
            in: text, 
            range: NSRange(location: 0, length: text.utf16.count)
        )
                var result = 0
        matches?.forEach { match in
            let firstNumberRange = match.range(at: 1)
            let secondNumberRange = match.range(at: 2)
            
            let firstNumber = Int((text as NSString).substring(with: firstNumberRange))!
            let secondNumber = Int((text as NSString).substring(with: secondNumberRange))!
            
            result += firstNumber * secondNumber
        }

        print("Part 1 Solution: \(result)")
    }


    // Solve Part 2 of the Day 2 challenge
func solvePart2() {
    let text = FileTools.readFile(from: inputPath)
    var isMulEnabled = true
    var result = 0
    
    let regex = try? NSRegularExpression(
        pattern: #"(do\(\)|don't\(\)|mul\((\d+),(\d+)\))"#,
        options: []
    )
    
    let matches = regex?.matches(
        in: text,
        range: NSRange(location: 0, length: text.utf16.count)
    )
    
    matches?.forEach { match in
        let fullMatchRange = match.range(at: 0)
        let fullMatch = (text as NSString).substring(with: fullMatchRange)
        
        if fullMatch == "do()" {
            isMulEnabled = true
        } else if fullMatch == "don't()" {
            isMulEnabled = false
        } else if fullMatch.range(of: #"mul\((\d+),(\d+)\)"#, options: .regularExpression) != nil {
            if isMulEnabled {
                // Use regex to extract numbers
                let numberRegex = try? NSRegularExpression(pattern: #"(\d+)"#)
                let numberMatches = numberRegex?.matches(in: fullMatch, range: NSRange(location: 0, length: fullMatch.utf16.count))
                
                if numberMatches?.count == 2 {
                    let firstNumberRange = numberMatches?[0].range(at: 1)
                    let secondNumberRange = numberMatches?[1].range(at: 1)
                    
                    let firstNumber = Int((fullMatch as NSString).substring(with: firstNumberRange!))!
                    let secondNumber = Int((fullMatch as NSString).substring(with: secondNumberRange!))!
                    
                    result += firstNumber * secondNumber
                }
            }
        }
    }
    
    print("Part 2 Solution: \(result)")
}

}
