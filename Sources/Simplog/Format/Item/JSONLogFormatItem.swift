//
//  JSONLogFormatItem.swift
//  Simplog
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Describes the log information in json.
public struct JSON: LogFormatItem {
    /// Initializes a new JSON Log Format Item.
    public init() { }
    
    public func format<E>(_ messageData: LogMessageData<E>) -> String {
        messageData.json
    }
}
