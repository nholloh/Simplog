//
//  Simplog.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation
import SimplogBase

/// The default Simplog log instance.
public let Log = Simplog<None>()

public class Simplog<ExtendedInfo: Codable>: SimplogLogger {
    
    // MARK: - Configuration
    public var logSynchronously: Bool {
        get { logOrchestrator.logSynchronously }
        set { logOrchestrator.logSynchronously = newValue }
    }
    
    public var destinations: [LogDestination] {
        get { logOrchestrator.destinations }
        set { logOrchestrator.destinations = newValue }
    }
    
    // MARK: - Dependencies
    private let logOrchestrator: LogOrchestrator<ExtendedInfo>
    
    // MARK: - Init
    public convenience init() {
        self.init(logOrchestrator: LogOrchestrator<ExtendedInfo>())
    }
    
    init(logOrchestrator: LogOrchestrator<ExtendedInfo>) {
        self.logOrchestrator = logOrchestrator
    }
    
    // MARK: - Logging
    public func debug(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
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
    public func debug(
        _ msg: @autoclosure () -> String,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: None(), level: .debug)
    }
    
    public func info(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
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
    public func info(
        _ msg: @autoclosure () -> String,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: None(), level: .info)
    }
    
    public func warning(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
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
    public func warning(
        _ msg: @autoclosure () -> String,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: None(), level: .warning)
    }
    
    public func error(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
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
    public func error(
        _ msg: @autoclosure () -> String,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: None(), level: .error)
    }
    
    public func fatal(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
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
    public func fatal(
        _ msg: @autoclosure () -> String,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) where ExtendedInfo == None {
        log(msg: msg(), file: file, line: line, function: function, extendedInfo: None(), level: .fatal)
    }
    
    private func log(
        msg: String,
        file: String,
        line: Int,
        function: String,
        extendedInfo: ExtendedInfo,
        level: LogLevel
    ) {
        logOrchestrator.log(msg: msg, file: file, line: line, function: function, extendedInfo: extendedInfo, level: level)
    }
    
}
