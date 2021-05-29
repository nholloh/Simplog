//
//  ConsoleLogDestination.swift
//  Simplog
//
//  Created by Niklas Holloh on 27.05.21.
//

import Foundation

public struct ConsoleLogDestination: LogDestination
{
    // MARK: - Destination Configuration
    public let logFormatDebug: LogFormat
    public let logFormatInfo: LogFormat
    public let logFormatWarning: LogFormat
    public let logFormatError: LogFormat
    public let logFormatFatal: LogFormat
    
    public let allowedLogLevels: Set<LogLevel>
    
    // MARK: - Init
    public init(
        @LogFormatBuilder logFormatDebug: () -> LogFormat = { .default },
        @LogFormatBuilder logFormatInfo: () -> LogFormat = { .default },
        @LogFormatBuilder logFormatWarning: () -> LogFormat = { .default },
        @LogFormatBuilder logFormatError: () -> LogFormat = { .default },
        @LogFormatBuilder logFormatFatal: () -> LogFormat = { .default },
        allowedLogLevels: Set<LogLevel> = .informational
    ) {
        self.logFormatDebug = logFormatDebug()
        self.logFormatInfo = logFormatInfo()
        self.logFormatWarning = logFormatWarning()
        self.logFormatError = logFormatError()
        self.logFormatFatal = logFormatFatal()
        self.allowedLogLevels = allowedLogLevels
    }
    
    public init(
        logFormatDebug: LogFormat = .default,
        logFormatInfo: LogFormat = .default,
        logFormatWarning: LogFormat = .default,
        logFormatError: LogFormat = .default,
        logFormatFatal: LogFormat = .default,
        allowedLogLevels: Set<LogLevel> = .informational
    ) {
        self.logFormatDebug = logFormatDebug
        self.logFormatInfo = logFormatInfo
        self.logFormatWarning = logFormatWarning
        self.logFormatError = logFormatError
        self.logFormatFatal = logFormatFatal
        self.allowedLogLevels = allowedLogLevels
    }
    
    // MARK: - Logging Outlet
    public func log(_ message: String)
    {
        print(message)
    }
}
