//
//  LogLevel.swift
//  Simplog
//
//  Created by Niklas Holloh on 27.05.21.
//

import Foundation

/// The Level describes the level of detail of a corresponding message. It can
/// also be used to filter for specific log levels in a LogDestination.
public enum LogLevel: Int, CustomStringConvertible, Codable {
    /// Debug: Level for detailed information including user data which
    /// might be helpful to a developer during development or testing.
    /// Debug logs should not be enabled for production builds due to
    /// data privacy concerns.
    case debug = 0
    
    /// Info: Level for status or sequence information, not containing any
    /// user related data. It should be allowed to log info in production.
    case info = 1
    
    /// Warning: Level for errors, which are recoverable by the app itself
    /// and thus do not need to be presented to the user. It can also be used
    /// to log incorrect or inconsistent states which may lead to errors
    /// subsequently.
    case warning = 3
    
    /// Error: Level for errors, which are not recoverable by the app itself
    /// and thus will present an error to the user.
    case error = 5
    
    /// Fatal: Level for fatal errors, which will result in a crash.
    case fatal = 8
    
    public var description: String {
        switch self {
        case .debug: return "Debug"
        case .info: return "Info"
        case .warning: return "Warning"
        case .error: return "Error"
        case .fatal: return "Fatal"
        }
    }
}
