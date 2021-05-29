//
//  ThreadLogFormatItem.swift
//  Simplog
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Describes a thread in the log format.
public struct Thread: LogFormatItem {
    /// Initializes a new Thread Log Format Item.
    public init() { }
    
    public func format<E>(_ messageData: LogMessageData<E>) -> String {
        messageData.thread
    }
}
