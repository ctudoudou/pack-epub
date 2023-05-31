import ArgumentParser
import CommandLineToolCore

@main
struct projects:ParsableCommand {
    @Flag(help: "Pack epub file.")
    var includeCounter = false

    @Option(name: .shortAndLong, help: "The directory path of epub file.")
    var dirPath: String

    mutating func run()throws {
        let tool = CommandLineTool()
        do {
            try tool.run(dirPath)
        } catch {
            print("Whoops! An error occurred: \(error)")
        }
    }
}
