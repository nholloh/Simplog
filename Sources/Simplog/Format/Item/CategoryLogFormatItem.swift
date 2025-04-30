//
//  CategoryLogFormatItem.swift
//  Simplog
//
//  Created by Holloh, Niklas on 30.04.25.
//

import Foundation

/// Describes the category in the log format.
public struct Category: LogFormatItem {
    /// Initializes a new Category Log Format Item.
    public init() { }
    
    public func format<E>(_ messageData: LogMessageData<E>) -> String {
        messageData.category ?? ""
    }
}
