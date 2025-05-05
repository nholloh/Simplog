//
//  FileLogDestination.swift
//  Simplog
//
//  Created by Holloh, Niklas on 05.05.25.
//

import Foundation

/// A log destination for logging to file.
public final class FileLogDestination: LogDestination {
    
    /// Errors that occur when logging to file.
    public enum Error: Swift.Error {
        
        /// The respective file cannot be opened. Check the inner error for details.
        case cannotOpenFile(Swift.Error)
    }
    
    // MARK: - State
    private let logFileUrl: URL
    private let fileHandle: FileHandle
    private let queue = DispatchQueue(label: "Simplog.FileLogDestination")
    
    // MARK: - Configuration
    public let logFormatDebug: LogFormat
    public let logFormatInfo: LogFormat
    public let logFormatWarning: LogFormat
    public let logFormatError: LogFormat
    public let logFormatFatal: LogFormat
    public let allowedLogLevels: Set<LogLevel>
    
    // MARK: - Read File Contents
    /// Returns the current log file's contents. Useful for e.g. sending them via E-Mail.
    public var logFileContents: String? {
        get throws {
            try queue.sync {
                guard FileManager.default.fileExists(atPath: logFileUrl.path) else {
                    return nil
                }
                return try String(contentsOf: logFileUrl, encoding: .utf8)
            }
        }
    }
    
    // MARK: - Lifecycle
    @available(iOS 16.0, *)
    /// A convenience initializer that automatically constructs a log file url containing the app's bundle identifier and the current date.
    public convenience init(
        allowedLogLevels: Set<LogLevel> = .informational,
        logFormatDebug: @autoclosure () -> LogFormat = .default,
        logFormatInfo: @autoclosure () -> LogFormat = .default,
        logFormatWarning: @autoclosure () -> LogFormat = .default,
        logFormatError: @autoclosure () -> LogFormat = .default,
        logFormatFatal: @autoclosure () -> LogFormat = .default
    ) throws(Error) {
        let bundleId = Bundle.main.bundleIdentifier ?? "application"
        try self.init(
            logFileUrl: URL.temporaryDirectory.appendingPathComponent("\(Foundation.Date().timeIntervalSince1970)_\(bundleId).log"),
            allowedLogLevels: allowedLogLevels,
            logFormatDebug: logFormatDebug(),
            logFormatInfo: logFormatInfo(),
            logFormatWarning: logFormatWarning(),
            logFormatError: logFormatError(),
            logFormatFatal: logFormatFatal()
        )
    }
    
    /// Initializes a new instance of `FileLogDestination`.
    /// Parameters:
    /// - logFileUrl: The `URL` where the log file shall be created and written. Existing files will be appended.
    public init(
        logFileUrl: URL,
        allowedLogLevels: Set<LogLevel> = .informational,
        logFormatDebug: @autoclosure () -> LogFormat = .default,
        logFormatInfo: @autoclosure () -> LogFormat = .default,
        logFormatWarning: @autoclosure () -> LogFormat = .default,
        logFormatError: @autoclosure () -> LogFormat = .default,
        logFormatFatal: @autoclosure () -> LogFormat = .default
    ) throws(Error) {
        self.logFileUrl = logFileUrl
        self.allowedLogLevels = allowedLogLevels
        self.logFormatDebug = logFormatDebug()
        self.logFormatInfo = logFormatInfo()
        self.logFormatWarning = logFormatWarning()
        self.logFormatError = logFormatError()
        self.logFormatFatal = logFormatFatal()
        
        if !FileManager.default.fileExists(atPath: logFileUrl.path) {
            FileManager.default.createFile(atPath: logFileUrl.path, contents: nil, attributes: nil)
        }
        
        do {
            let handle = try FileHandle(forWritingTo: logFileUrl)
            try handle.seekToEnd()
            self.fileHandle = handle
        } catch {
            throw Error.cannotOpenFile(error)
        }
    }
    
    deinit {
        queue.sync {
            fileHandle.synchronizeFile()
            try? fileHandle.close()
        }
    }
    
    // MARK: - LogDestination
    public func log(_ message: String, subsystem: String?, category: String?, level: LogLevel) {
        queue.sync {
            do {
                let data = Data(message.utf8)
                try fileHandle.seekToEnd()
                try fileHandle.write(contentsOf: data)
                fileHandle.synchronizeFile()
            } catch { }
        }
    }
}
