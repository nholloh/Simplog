//
//  TextLogFormatItem.swift
//  Simplog
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Describes a block of static text in the log format.
public struct Text: LogFormatItem {
    let text: String
    
    /// Describes a block of static text in the log format.
    /// - Parameter text: The static text to show.
    public init(_ text: String) {
        self.text = text
    }
    
    public func format<E>(_ _: LogMessageData<E>) -> String {
        return text
    }
}
