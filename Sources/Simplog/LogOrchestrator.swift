//
//  LogOrchestrator.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Sequentializes and formats log messages before forwarding them
/// to destinations.
public final class LogOrchestrator<ExtendedInfo: Codable> {
    
    private let loggingQueue = DispatchQueue(label: "Simplog.logorchestration")
    private lazy var loggingQueueFunction: (@escaping () -> Void) -> Void =
        { [loggingQueue] in loggingQueue.async(execute: $0) }
    
    /// Whether to log to the destinations synchronously. If true, log will only
    /// return once all destinations have received the log output. This can especially
    /// be helpful to diagnose race conditions. Default is false to preserve performance.
    public var logSynchronously: Bool = false {
        didSet {
            loggingQueueFunction = logSynchronously ?
                { [loggingQueue] in loggingQueue.sync(execute: $0) } :
                { [loggingQueue] in loggingQueue.async(execute: $0) }
        }
    }
    
    /// The destinations which will receive fully formatted log messages.
    public var destinations: [LogDestination] = []
    
    /// Creates an instance of LogOrchestrator.
    public init() { }
    
    
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
    public func log(msg: String, file: String, line: Int, function: String, extendedInfo: ExtendedInfo, level: LogLevel) {
        let messageData = LogMessageData(message: msg, fileName: file, fileLine: line, function: function, level: level, extendedInfo: extendedInfo)
        
        loggingQueueFunction { [destinations] in
            destinations.forEach { destination in
                guard destination.allowedLogLevels.contains(level) else {
                    return
                }
                
                let logFormat = destination.format(forLevel: level)
                let formattedMessage = logFormat.combinedFormat.format(messageData)
                destination.log(formattedMessage)
            }
        }
    }
}
