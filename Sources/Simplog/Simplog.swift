//
//  Simplog.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

public final class Simplog<ExtendedInfo: Codable & Sendable>: SimplogLogger {
    
    // MARK: - Dependencies
    private let logOrchestrator: LogOrchestrator<ExtendedInfo>
    
    // MARK: - Configuration
    private let category: String?
    private let subsystem: String?
    
    // MARK: - Init
    public convenience init(
        destinations: [any LogDestination],
        logSynchronously: Bool = false,
        subsystem: String? = nil,
        category: String? = nil
    ) {
        self.init(
            logOrchestrator: LogOrchestrator<ExtendedInfo>(logSynchronously: logSynchronously, destinations: destinations),
            subsystem: subsystem,
            category: category
        )
    }
    
    init(
        logOrchestrator: LogOrchestrator<ExtendedInfo>,
        subsystem: String?,
        category: String?
    ) {
        self.logOrchestrator = logOrchestrator
        self.category = category
        self.subsystem = subsystem
    }
    
    // MARK: - Category & Subsystem
    public func `for`(subsystem: String?, category: String?) -> Self {
        return Self.init(logOrchestrator: logOrchestrator, subsystem: subsystem, category: category)
    }
    
    // MARK: - Logging
    public nonisolated func debug(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: extendedInfo, level: .debug)
    }
    
    /// Logs a message with debug level.
    /// - Parameters:
    ///   - msg: The log message.
    ///   - file: The full path of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - line: The line of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - function: The calling function.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    public nonisolated func debug(
        _ msg: @autoclosure () -> String,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: None(), level: .debug)
    }
    
    public nonisolated func info(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: extendedInfo, level: .info)
    }
    
    /// Logs a message with info level.
    /// - Parameters:
    ///   - msg: The log message.
    ///   - file: The full path of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - line: The line of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - function: The calling function.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    public nonisolated func info(
        _ msg: @autoclosure () -> String,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: None(), level: .info)
    }
    
    public nonisolated func warning(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: extendedInfo, level: .warning)
    }
    
    /// Logs a message with warning level.
    /// - Parameters:
    ///   - msg: The log message.
    ///   - file: The full path of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - line: The line of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - function: The calling function.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    public nonisolated func warning(
        _ msg: @autoclosure () -> String,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: None(), level: .warning)
    }
    
    public nonisolated func error(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: extendedInfo, level: .error)
    }
    
    /// Logs a message with error level.
    /// - Parameters:
    ///   - msg: The log message.
    ///   - file: The full path of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - line: The line of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - function: The calling function.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    public nonisolated func error(
        _ msg: @autoclosure () -> String,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: None(), level: .error)
    }
    
    public nonisolated func fatal(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: extendedInfo, level: .fatal)
    }
    
    /// Logs a message with fatal level.
    /// - Parameters:
    ///   - msg: The log message.
    ///   - file: The full path of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - line: The line of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - function: The calling function.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    public nonisolated func fatal(
        _ msg: @autoclosure () -> String,
        file: String = #fileID,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: None(), level: .fatal)
    }
    
    private nonisolated func log(
        msg: String,
        file: String,
        line: Int,
        function: String,
        extendedInfo: ExtendedInfo,
        level: LogLevel
    ) {
        logOrchestrator.log(
            msg: msg,
            subsystem: subsystem,
            category: category,
            file: file,
            line: line,
            function: function,
            extendedInfo: extendedInfo,
            level: level
        )
    }
    
}
