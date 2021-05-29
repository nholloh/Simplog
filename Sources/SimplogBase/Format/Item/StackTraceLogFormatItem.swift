//
//  StackTraceLogFormatItem.swift
//  Simplog
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Describes a stack trace in the log format.
public struct StackTrace: LogFormatItem {
    /// Initializes a new Stack Trace Log Format Item.
    public init() { }
    
    public func format<E>(_ messageData: LogMessageData<E>) -> String {
        messageData.stackTrace.joined(separator: "\n")
    }
}

