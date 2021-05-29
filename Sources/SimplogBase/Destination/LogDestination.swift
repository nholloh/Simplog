//
//  LogDestination.swift
//  Simplog
//
//  Created by Niklas Holloh on 27.05.21.
//

import Foundation

/// Describes a target, where formatted log output should be delivered.
public protocol LogDestination
{
    /// Describes the format of the log output. If a format was defined for a specific
    /// log level, the level specific format (e.g. `logFormatDebug`) takes precedence.
    @LogFormatBuilder var logFormat: LogFormat { get }
    
    /// Describes the format of debug log outputs. If not implemented,
    /// the default `logFormat` applies.
    @LogFormatBuilder var logFormatDebug: LogFormat { get }
    
    /// Describes the format of info log outputs. If not implemented,
    /// the default `logFormat` applies.
    @LogFormatBuilder var logFormatInfo: LogFormat { get }
    
    /// Describes the format of error log outputs. If not implemented,
    /// the default `logFormat` applies.
    @LogFormatBuilder var logFormatWarning: LogFormat { get }
    
    /// Describes the format of error log outputs. If not implemented,
    /// the default `logFormat` applies.
    @LogFormatBuilder var logFormatError: LogFormat { get }
    
    /// Describes the format of fatal log outputs. If not implemented,
    /// the default `logFormat` applies.
    @LogFormatBuilder var logFormatFatal: LogFormat { get }
    
    /// The allowed log levels. Any level not listed within the set of allowed log
    /// levels will be ignored and do not lead to a calling the `log` function.
    /// Default is `.informational`.
    var allowedLogLevels: Set<LogLevel> { get }
    
    /// Is called by the log orchestrator after formatting the message
    /// according to the desired format.
    /// - Parameter message: The formatted message which is redirected to the destination's output.
    /// - Important: Logging should happen synchronously. The log orchestrator decides itself, whether
    ///     logging should happen synchronously or asynchronously respective to the rest of the app.
    /// - Note: Calls to log will only happen in sequence and are threadsafe as guaranteed by
    ///     the log orchestrator.
    func log(_ message: String)
}

/// Optional protocol fields
public extension LogDestination
{
    var logFormat: LogFormat { .default }
    var logFormatDebug: LogFormat { logFormat }
    var logFormatInfo: LogFormat { logFormat }
    var logFormatWarning: LogFormat { logFormat }
    var logFormatError: LogFormat { logFormat }
    var logFormatFatal: LogFormat { logFormat }
    
    var allowedLogLevels: Set<LogLevel> { .informational }
}

/// Internal helpers
extension LogDestination {
    func format(forLevel level: LogLevel) -> LogFormat {
        switch level {
        case .debug: return logFormatDebug
        case .info: return logFormatInfo
        case .warning: return logFormatWarning
        case .error: return logFormatError
        case .fatal: return logFormatFatal
        }
    }
}
