//
//  Logger.swift
//  harpyframework
//
//  Created by SPJ on 8/8/17.
//  Copyright © 2017 SPJ. All rights reserved.
//

import UIKit

public class Logger: NSObject {
    /** The max size a log file can be in Kilobytes. Default is 1024 (1 MB) */
    public var maxFileSize:                         UInt64  = 1024
    /**
     * The max number of log file that will be stored.
     * Once this point is reached, the oldest file is deleted.
     */
    public var maxFileCount:                        Int     = 4
    /** The directory in which the log files will be written */
    public var directory:                           String  = Logger.defaultDirectory()
    
    /** The name of the log files. */
    public var name:                                String  = "logfile"
    /** The date formatter */
    private var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.timeStyle = .medium
        formatter.dateStyle = .medium
        return formatter
    }
    
    /** Singleton */
    public class var shared: Logger {
        struct Static {
            static let instance: Logger = Logger()
        }
        return Static.instance
    }
    
    /**
     * Get the default log directory
     * - returns: The default log directory
     */
    class func defaultDirectory() -> String {
        var path = DomainConst.BLANK
        let fileManager = FileManager.default
        #if os(iOS)
            let paths = NSSearchPathForDirectoriesInDomains(
                .documentDirectory,
                .userDomainMask,
                true)
            path = "\(paths[0])/Logs"
        #elseif os(OSX)
            let urls = fileManager.urls(for: .libraryDirectory,
                                        in: .userDomainMask)
            if let url = urls.last {
                if let p = url.path {
                    path = "\(p)/Logs"
                }
            }
        #endif
        if !fileManager.fileExists(atPath: path) && path != DomainConst.BLANK {
            do {
                try fileManager.createDirectory(atPath: path, withIntermediateDirectories: false, attributes: nil)
            } catch _ {
                
            }
        }
        return path
    }
    
    /**
     * Get the log name
     * - parameter num: Log index
     * - returns: The log name
     */
    private func logName(num: Int) -> String {
        return "\(name)-\(num).log"
    }
    
    /**
     * Write content to the current log file.
     * - parameter text: Text to write
     */
    public func write(text: String) {
        let path = "\(directory)/\(logName(num: 0))"
        let fileManager = FileManager.default
        if !fileManager.fileExists(atPath: path) {
            do {
                try "".write(toFile: path, atomically: true, encoding: String.Encoding.utf8)
            } catch _ {
                
            }
        }
        if let fileHandle = FileHandle.init(forWritingAtPath: path) {
            let dateStr = dateFormatter.string(from: Date())
            let writeText = "[\(dateStr)]: \(text)\n"
            fileHandle.seekToEndOfFile()
            //fileHandle.seek(toFileOffset: 0)
            fileHandle.write(writeText.data(using: String.Encoding.utf8)!)
            fileHandle.closeFile()
            print(writeText, separator: "\n", terminator: "")
            cleanup()
        }
    }
    
    public func read() -> String {
        var retVal = DomainConst.BLANK
        let path = "\(directory)/\(logName(num: 0))"
        let fileManager = FileManager.default
        if fileManager.fileExists(atPath: path) {
            do {
                try retVal = String(contentsOfFile: path)
            } catch _ {
                
            }
        }
        return retVal
    }
    
    private func cleanup() {
        let path = "\(directory)/\(logName(num: 0))"
        let size = fileSize(path: path)
        let maxSize: UInt64 = maxFileSize * 1024
        if size > 0 && size >= maxSize && maxSize > 0 && maxFileCount > 0 {
            rename(index: 0)
            // Delete oldest file
            let deletePath = "\(directory)/\(logName(num: maxFileCount))"
            let fileManager = FileManager.default
            do {
                try fileManager.removeItem(atPath: deletePath)
            } catch _ {
                
            }
        }
    }
    
    /**
     * Check the size of a file
     * - parameter path: Path of file
     * - returns: Size of a file
     */
    private func fileSize(path: String) -> UInt64 {
        let fileManager = FileManager.default
        let attrs: NSDictionary? = try! fileManager.attributesOfItem(atPath: path) as NSDictionary?
        if let dict = attrs {
            return dict.fileSize()
        }
        return 0
    }
    
    /**
     * Recursive method call to rename log files
     * - parameter index: Log index
     */
    private func rename(index: Int) {
        let fileManager = FileManager.default
        let path = "\(directory)\(logName(num: index))"
        let newPath = "\(directory)/\(logName(num: index + 1))"
        if fileManager.fileExists(atPath: newPath) {
            rename(index: index + 1)
        }
        do {
            try fileManager.moveItem(atPath: path, toPath: newPath)
        } catch _ {
            
        }
    }
}

/**
 * A free function to make writing to the log much nicer
 */
public func logw(text: String) {
    Logger.shared.write(text: text)
}

/**
 * Read log
 */
public func logr() -> String {
    return Logger.shared.read()
}
