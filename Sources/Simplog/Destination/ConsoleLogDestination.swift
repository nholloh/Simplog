//
//  ConsoleLogDestination.swift
//  Simplog
//
//  Created by Niklas Holloh on 27.05.21.
//

import Foundation

public struct ConsoleLogDestination: LogDestination {
    
    // MARK: - Destination Configuration
    public var logFormatDebug: LogFormat
    public var logFormatInfo: LogFormat
    public var logFormatWarning: LogFormat
    public var logFormatError: LogFormat
    public var logFormatFatal: LogFormat
    
    public var allowedLogLevels: Set<LogLevel>
    
    // MARK: - Init
    public init(
        allowedLogLevels: Set<LogLevel> = .informational,
        logFormatDebug: @autoclosure () -> LogFormat = .default,
        logFormatInfo: @autoclosure () -> LogFormat = .default,
        logFormatWarning: @autoclosure () -> LogFormat = .default,
        logFormatError: @autoclosure () -> LogFormat = .default,
        logFormatFatal: @autoclosure () -> LogFormat = .default
    ) {
        self.logFormatDebug = logFormatDebug()
        self.logFormatInfo = logFormatInfo()
        self.logFormatWarning = logFormatWarning()
        self.logFormatError = logFormatError()
        self.logFormatFatal = logFormatFatal()
        self.allowedLogLevels = allowedLogLevels
    }
    
    public init() {
        self.logFormatDebug = .default
        self.logFormatInfo = .default
        self.logFormatWarning = .default
        self.logFormatError = .default
        self.logFormatFatal = .default
        self.allowedLogLevels = .informational
    }
    
    // MARK: - Logging Outlet
    public func log(_ message: String, subsystem: String?, category: String?, level: LogLevel) {
        print(message)
    }
}
