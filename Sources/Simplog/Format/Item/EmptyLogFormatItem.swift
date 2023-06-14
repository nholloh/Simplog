//
//  File.swift
//  
//
//  Created by Niklas Holloh on 29.05.21.
//

import Foundation

/// Describes an emtpy item in the log format. This can be
/// used to apply modifiers on empty strings.
public struct Empty: LogFormatItem {
    /// Initializes a new Empty Log Format Item.
    public init() { }
    
    public func format<E>(_ messageData: LogMessageData<E>) -> String {
        ""
    }
}
