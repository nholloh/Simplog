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
        @LogFormatBuilder logFormatDebug: () -> LogFormat = { .default },
        @LogFormatBuilder logFormatInfo: () -> LogFormat = { .default },
        @LogFormatBuilder logFormatWarning: () -> LogFormat = { .default },
        @LogFormatBuilder logFormatError: () -> LogFormat = { .default },
        @LogFormatBuilder logFormatFatal: () -> LogFormat = { .default },
        allowedLogLevels: Set<LogLevel> = .informational,
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
