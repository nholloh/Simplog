//
//  SubsystemLogFormatItem.swift
//  Simplog
//
//  Created by Holloh, Niklas on 30.04.25.
//

import Foundation

/// Describes the subsystem in the log format.
public struct Subsystem: LogFormatItem {
    /// Initializes a new Subsystem Log Format Item.
    public init() { }
    
    public func format<E>(_ messageData: LogMessageData<E>) -> String {
        messageData.subsystem ?? ""
    }
}
