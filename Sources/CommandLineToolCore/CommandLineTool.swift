import Foundation
import ZIPFoundation

public final class CommandLineTool {
    private let arguments: [String]

    public init(arguments: [String] = CommandLine.arguments) { 
        self.arguments = arguments
    }
    
     func getAllFilePath(_ dirPath: String) -> [String]? {
        let url = URL(fileURLWithPath: dirPath)
        var files = [String]()
        if let enumerator = FileManager.default.enumerator(at: url, includingPropertiesForKeys: [.isRegularFileKey], options: [.skipsHiddenFiles, .skipsPackageDescendants]) {
            for case let fileURL as URL in enumerator {
                do {
                    let fileAttributes = try fileURL.resourceValues(forKeys:[.isRegularFileKey])
                    if fileAttributes.isRegularFile! {
                        files.append(fileURL.path.replacingOccurrences(of: url.path+"/", with: ""))
                    }
                } catch { print(error, fileURL) }
            }
        }
        
        return files
    }

    public func run(_ dirPath: String) throws {        
        let filePaths = getAllFilePath(dirPath)
        let absPath = URL(fileURLWithPath: dirPath)
        let destinationURL = URL(fileURLWithPath: "build." + absPath.lastPathComponent)
        let archive = Archive(url: destinationURL, accessMode: .create)
        for filePath in filePaths! {
            do {try archive?.addEntry(with: filePath, relativeTo: absPath)}
            catch {print(error)}
        }
    }
}
