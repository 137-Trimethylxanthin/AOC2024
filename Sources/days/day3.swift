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
        let preFormat = "do()" + FileTools.readFile(from: inputPath) + "don't()"

    
        
        let format = try? NSRegularExpression(
            pattern: #"do\(\).*?don't\(\)"#,
            options: [.anchorsMatchLines] // Equivalent to multiline 'm' flag
        )

        let formatMatches = format?.matches(
            in: preFormat,
            range: NSRange(location: 0, length: preFormat.utf16.count)
        )
        var text = ""
        var matchedTexts: [String] = []
            
            // Process all matches for the first regex
            formatMatches?.forEach { match in
                // Extract the substring from the range of the match and store it in the array
                let matchRange = match.range
                let matchedText = (preFormat as NSString).substring(with: matchRange)
                matchedTexts.append(matchedText)
            }

        text = matchedTexts.joined()

        let regex: NSRegularExpression? = try? NSRegularExpression(
            pattern: #"mul\((\d+),(\d+)\)"#,
                        options: [.anchorsMatchLines] // Equivalent to multiline 'm' flag
        )
        let matches = regex?.matches(
            in: text,
            range: NSRange(location: 0, length: text.utf16.count)
        )
        var result = 0
        matches?.forEach {match in
            let firstNumberRange = match.range(at: 1)
            let secondNumberRange = match.range(at: 2)
            
            let firstNumber = Int((text as NSString).substring(with: firstNumberRange))!
            let secondNumber = Int((text as NSString).substring(with: secondNumberRange))!
            
            result += firstNumber * secondNumber
        }

        print("Part 2 Solution: \(result)")
    }

}
