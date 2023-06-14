//
//  MessageLogFormatItem.swift
//  Simplog
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Describes the logged message in the log format.
public struct Message: LogFormatItem {
    /// Initializes a new Message Log Format Item.
    public init() { }
    
    public func format<E>(_ messageData: LogMessageData<E>) -> String {
        messageData.message
    }
}

