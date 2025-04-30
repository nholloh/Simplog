//
//  LevelLogFormatItem.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Describes the log level in the log format.
public struct Level: LogFormatItem {
    /// Initializes a new Level Log Format Item.
    public init() { }
    
    public func format<E>(_ messageData: LogMessageData<E>) -> String {
        messageData.level.description
    }
}
