//
//  SimplogLogger.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

public typealias Logger = Simplog

public protocol SimplogLogger<ExtendedInfo> where ExtendedInfo: Codable & Sendable {
    
    associatedtype ExtendedInfo: Codable & Sendable
    
    /// Creates a new `SimplogLogger` instance for a specific
    /// subsystem or category. Use this to create class or component
    /// specific logger instances.
    /// - Parameters:
    ///   - subsystem: The subsystem as used by OSLog.
    ///   - category: The category as used by OSLog.
    /// - Returns: A new instance of `SimplogLogger` with category and subsystem assigned.
    func `for`(subsystem: String?, category: String?) -> Self
    
    /// Logs a message with debug level.
    /// - Parameters:
    ///   - msg: The log message.
    ///   - extendedInfo: Any additional custom information.
    ///   - file: The full path of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - line: The line of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - function: The calling function.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    func debug(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String,
        line: Int,
        function: String
    )
    
    /// Logs a message with info level.
    /// - Parameters:
    ///   - msg: The log message.
    ///   - extendedInfo: Any additional custom information.
    ///   - file: The full path of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - line: The line of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - function: The calling function.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    func info(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String,
        line: Int,
        function: String
    )
    
    /// Logs a message with warning level.
    /// - Parameters:
    ///   - msg: The log message.
    ///   - extendedInfo: Any additional custom information.
    ///   - file: The full path of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - line: The line of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - function: The calling function.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    func warning(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String,
        line: Int,
        function: String
    )
    
    /// Logs a message with error level.
    /// - Parameters:
    ///   - msg: The log message.
    ///   - extendedInfo: Any additional custom information.
    ///   - file: The full path of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - line: The line of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - function: The calling function.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    func error(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String,
        line: Int,
        function: String
    )
    
    /// Logs a message with fatal level.
    /// - Parameters:
    ///   - msg: The log message.
    ///   - extendedInfo: Any additional custom information.
    ///   - file: The full path of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - line: The line of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - function: The calling function.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    func fatal(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String,
        line: Int,
        function: String
    )
}

public extension SimplogLogger {
    
    func debug(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) {
        self.debug(msg(), extendedInfo: extendedInfo, file: file, line: line, function: function)
    }
    
    func info(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) {
        self.info(msg(), extendedInfo: extendedInfo, file: file, line: line, function: function)
    }
    
    func warning(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) {
        self.warning(msg(), extendedInfo: extendedInfo, file: file, line: line, function: function)
    }
    
    func error(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) {
        self.error(msg(), extendedInfo: extendedInfo, file: file, line: line, function: function)
    }
    
    func fatal(
        _ msg: @autoclosure () -> String,
        extendedInfo: ExtendedInfo,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) {
        self.fatal(msg(), extendedInfo: extendedInfo, file: file, line: line, function: function)
    }
}

public extension SimplogLogger where ExtendedInfo == None {
    
    /// Logs a message with debug level.
    /// - Parameters:
    ///   - msg: The log message.
    ///   - file: The full path of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - line: The line of the file, from which the log originates.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    ///   - function: The calling function.
    ///     The compiler will supply the default argument. Usually you can leave this empty.
    func debug(
        _ msg: @autoclosure () -> String,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) {
        self.debug(msg(), extendedInfo: None(), file: file, line: line, function: function)
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
    func info(
        _ msg: @autoclosure () -> String,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) {
        self.info(msg(), extendedInfo: None(), file: file, line: line, function: function)
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
    func warning(
        _ msg: @autoclosure () -> String,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) {
        self.warning(msg(), extendedInfo: None(), file: file, line: line, function: function)
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
    func error(
        _ msg: @autoclosure () -> String,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) {
        self.error(msg(), extendedInfo: None(), file: file, line: line, function: function)
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
    func fatal(
        _ msg: @autoclosure () -> String,
        file: String = URL(fileURLWithPath: "\(#file)").lastPathComponent,
        line: Int = #line,
        function: String = #function
    ) {
        self.fatal(msg(), extendedInfo: None(), file: file, line: line, function: function)
    }
}
