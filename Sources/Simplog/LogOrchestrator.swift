//
//  LogOrchestrator.swift
//
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Sequentializes and formats log messages before forwarding them
/// to destinations.
public final class LogOrchestrator<ExtendedInfo: Codable & Sendable>: Sendable {
    
    private let loggingQueue: DispatchQueue
    private let loggingQueueFunction: @Sendable (@Sendable @escaping () -> Void) -> Void
    
    /// Whether to log to the destinations synchronously. If true, log will only
    /// return once all destinations have received the log output. This can especially
    /// be helpful to diagnose race conditions. Default is false to preserve performance.
    public let logSynchronously: Bool
    
    /// The destinations which will receive fully formatted log messages.
    public let destinations: [LogDestination]
    
    /// Creates an instance of LogOrchestrator.
    /// - Parameters:
    ///   - logSynchronously: Whether to log to the destinations synchronously. If true, log will only
    ///   return once all destinations have received the log output. This can especially
    ///   be helpful to diagnose race conditions. Default is false to preserve performance.
    ///   - destinations: The destinations which will receive fully formatted log messages.
    public init(logSynchronously: Bool, destinations: [LogDestination]) {
        self.destinations = destinations
        self.logSynchronously = logSynchronously
        self.loggingQueue = DispatchQueue(label: "Simplog.logorchestration", qos: logSynchronously ? .userInitiated : .utility)
        loggingQueueFunction =
        if logSynchronously { { [loggingQueue] in loggingQueue.sync(execute: $0) } }
        else { { [loggingQueue] in loggingQueue.async(execute: $0) } }
    }
    
    /// Logs a message to all available destinations with respect to their formatting.
    /// - Parameters:
    ///   - msg: The message to log.
    ///   - file: The file where the log originated.
    ///   - line: The line where the log originated.
    ///   - function: The function where the log originated.
    ///   - extendedInfo: Custom extended information.
    ///   - level: The log level.
    /// - Note: It is advised to use a Simplog instance for logging, which will use
    ///     the LogOrchestrator in turn.
    public func log(msg: String, subsystem: String?, category: String?, file: String, line: Int, function: String, extendedInfo: ExtendedInfo, level: LogLevel) {
        let messageData = LogMessageData(
            message: msg,
            subsystem: subsystem,
            category: category,
            fileName: file,
            fileLine: line,
            function: function,
            level: level,
            extendedInfo: extendedInfo
        )
        
        loggingQueueFunction { [destinations] in
            destinations
                .filter { $0.allowedLogLevels.contains(level) }
                .forEach { destination in
                    let format = destination.format(forLevel: level)
                    let formatted = format.combinedFormat.format(messageData)
                    
                    destination.log(
                        formatted,
                        subsystem: subsystem,
                        category: category,
                        level: level
                    )   
                }
        }
    }
}

