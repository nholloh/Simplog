//
//  FunctionLogFormatItem.swift
//  Simplog
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Describes a function name in the log format.
public struct Function: LogFormatItem {
    /// Initializes a new Function Log Format Item.
    public init() { }
    
    public func format<E>(_ messageData: LogMessageData<E>) -> String {
        messageData.function
    }
}

