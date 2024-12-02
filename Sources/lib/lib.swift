import Foundation

public enum FileTools {
    /// Reads contents of a file at the given path
    /// - Parameter path: Path to the input file
    /// - Returns: Array of strings, with each element representing a line from the file
    public static func readLines(from path: String) -> [String] {
        do {
            let fileContents = try String(contentsOfFile: path, encoding: .utf8)
            return fileContents.components(separatedBy: .newlines)
                .filter { !$0.isEmpty } // Remove any empty lines
        } catch {
            print("Error reading file at \(path): \(error)")
            return []
        }
    }
    
    /// Reads contents of a file at the given path as a single string
    /// - Parameter path: Path to the input file
    /// - Returns: Entire file contents as a string
    public static func readFile(from path: String) -> String {
        do {
            return try String(contentsOfFile: path, encoding: .utf8)
        } catch {
            print("Error reading file at \(path): \(error)")
            return ""
        }
    }
}

public extension String {
    var asInt: Int? {
        return Int(self)
    }
}

public extension Array where Element == String {
    /// Converts an array of strings to an array of integers
    /// Filters out any strings that cannot be converted to integers
    var asInts: [Int] {
        return compactMap { $0.asInt }
    }

}

public extension Array where Element == Substring {
    func asStrings() -> [String] {
        return map { String($0) }
    }
}


public extension Date {
    func get(_ components: Calendar.Component..., calendar: Calendar = Calendar.current) -> DateComponents {
        return calendar.dateComponents(Set(components), from: self)
    }

    func get(_ component: Calendar.Component, calendar: Calendar = Calendar.current) -> Int {
        return calendar.component(component, from: self)
    }
}