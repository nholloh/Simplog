//
//  OSLogDestination.swift
//  Simplog
//
//  Created by Holloh, Niklas on 30.04.25.
//

import Foundation
import OSLog

public struct OSLogDestination: LogDestination {

    // MARK: - Destination Configuration
    public var logFormatDebug: LogFormat
    public var logFormatInfo: LogFormat
    public var logFormatWarning: LogFormat
    public var logFormatError: LogFormat
    public var logFormatFatal: LogFormat
    
    public var allowedLogLevels: Set<LogLevel>
    public var defaultSubsystem: String
    public var defaultCategory: String
    
    // MARK: - Init
    public init(
        defaultSubsystem: String,
        defaultCategory: String,
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
        self.defaultSubsystem = defaultSubsystem
        self.defaultCategory = defaultCategory
    }
    
    public init(defaultSubsystem: String, defaultCategory: String) {
        self.defaultSubsystem = defaultSubsystem
        self.defaultCategory = defaultCategory
        self.logFormatDebug = .default
        self.logFormatInfo = .default
        self.logFormatWarning = .default
        self.logFormatError = .default
        self.logFormatFatal = .default
        self.allowedLogLevels = .informational
    }
    
    // MARK: - Logging Outlet
    public func log(_ message: String, subsystem: String?, category: String?, level: LogLevel) {
        let logger = os.Logger(subsystem: subsystem ?? defaultSubsystem, category: category ?? defaultCategory)
        switch level {
        case .debug:
            logger.debug("\(message)")
        case .info:
            logger.info("\(message)")
        case .warning:
            logger.warning("\(message)")
        case .error:
            logger.error("\(message)")
        case .fatal:
            logger.critical("\(message)")
        }
    }
}
