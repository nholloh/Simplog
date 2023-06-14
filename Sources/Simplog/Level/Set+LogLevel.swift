//
//  Set+LogLevel.swift
//  Simplog
//
//  Created by Niklas Holloh on 27.05.21.
//

import Foundation

/// Extension with default sets for log levels..
public extension Set where Element == LogLevel {
    /// Contains all log levels `[.debug, .info, .warning, .error, .fatal]`.
    static var all: Set<LogLevel> {
        Set(arrayLiteral: .debug, .info, .warning, .error, .fatal)
    }
    
    /// Contains all log levels except debug. `[.info, .warning, .error, .fatal]`
    static var informational: Set<LogLevel> {
        Set(arrayLiteral: .info, .warning, .error, .fatal)
    }
    
    /// Contains only warnings and errors. `[.warning, .error, .fatal]`
    static var warningsAndErrors: Set<LogLevel> {
        Set(arrayLiteral: .warning, .error, .fatal)
    }
    
    /// Contains only errors. `[.error, .fatal]`
    static var errorsOnly: Set<LogLevel> {
        Set(arrayLiteral: .debug, .info, .warning, .error, .fatal)
    }
}
