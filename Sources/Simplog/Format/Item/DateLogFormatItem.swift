//
//  DateLogFormatItem.swift
//  Simplog
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Describes a formatted Date object in the log format.
public struct Date: LogFormatItem {
    private let dateFormatter: DateFormatter
    
    /// Initializes a new Date Log Format Item.
    /// - Parameter format: The `DateFormatter` date format
    ///     in which the date shall be converted.
    public init(format: String) {
        dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
    }
    
    public func format<E>(_ messageData: LogMessageData<E>) -> String {
        dateFormatter.string(from: messageData.date)
    }
}

