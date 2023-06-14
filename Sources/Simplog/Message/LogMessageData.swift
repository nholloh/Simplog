//
//  LogMessageData.swift
//  Simplog
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// _LogMessageData will be transformed into public LogMessageData
/// including the json payload before handing it over to the
/// formatter.
struct _LogMessageData<ExtendedInfo: Codable>: Codable {
    /// The message logged in `Log.debug(_ message:)`.
    let message: String
    
    /// The date and time, when the message was logged.
    let date: Foundation.Date
    
    /// The thread, on which the message was logged.
    /// - Note: The unique thread identifier or `main`
    /// in case of the main thread.
    let thread: String
    
    /// The stack trace of the log call.
    let stackTrace: [String]
    
    /// The file name, from which the log originated.
    let fileName: String
    
    /// The line, from which the log originated.
    let fileLine: Int
    
    /// The function, from which the log originated.
    let function: String
    
    /// The log level.
    let level: LogLevel
    
    /// Custom extended information.
    let extendedInfo: ExtendedInfo
    
    init(
        message: String,
        fileName: String,
        fileLine: Int,
        function: String,
        level: LogLevel,
        extendedInfo: ExtendedInfo
    ) {
        self.message = message
        self.fileName = fileName
        self.fileLine = fileLine
        self.function = function
        self.level = level
        self.extendedInfo = extendedInfo
        
        date = Foundation.Date()
        thread = Foundation.Thread.current.logDescription
        
        stackTrace = Self.currentStackTrace
    }
    
    private static var currentStackTrace: [String] {
        let trace = Foundation.Thread.callStackSymbols
        let index = trace.filter { $0.contains("Simplog") || $0.contains("SimplogBase") }.count
        return Array(trace.dropFirst(index + 1))
    }
}

/// A struct containing all relevant data to display a
/// log message. Can be extended using a custom `ExtendedInfo`
/// generic type.
public struct LogMessageData<ExtendedInfo: Codable> {
    /// The message logged in `Log.debug(_ message:)`.
    public let message: String
    
    /// The date and time, when the message was logged.
    public let date: Foundation.Date
    
    /// The thread, on which the message was logged.
    /// - Note: The unique thread identifier or `main`
    /// in case of the main thread.
    public let thread: String
    
    /// The stack trace of the log call.
    public let stackTrace: [String]
    
    /// The file name, from which the log originated.
    public let fileName: String
    
    /// The line, from which the log originated.
    public let fileLine: Int
    
    /// The function, from which the log originated.
    public let function: String
    
    /// The log level.
    let level: LogLevel
    
    /// Custom extended information.
    let extendedInfo: ExtendedInfo
    
    /// The entire log message, json formatted.
    public let json: String
    
    init(
        message: String,
        fileName: String,
        fileLine: Int,
        function: String,
        level: LogLevel,
        extendedInfo: ExtendedInfo
    ) {
        let messageData = _LogMessageData(
            message: message,
            fileName: fileName,
            fileLine: fileLine,
            function: function,
            level: level,
            extendedInfo: extendedInfo
        )
        
        self.message = message
        self.date = messageData.date
        self.thread = messageData.thread
        self.fileName = fileName
        self.fileLine = fileLine
        self.function = function
        self.stackTrace = messageData.stackTrace
        self.level = level
        self.extendedInfo = extendedInfo
        
        guard let jsonData = try? JSONEncoder().encode(messageData),
              let jsonString = String(data: jsonData, encoding: .utf8) else {
            json = "{ \"errorEncodingJSON\": true }"
            return
        }
        
        json = jsonString
    }
}

