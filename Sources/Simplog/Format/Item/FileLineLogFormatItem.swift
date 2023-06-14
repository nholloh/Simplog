//
//  FileLineLogFormatItem.swift
//  Simplog
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Describes a file line in the log format.
public struct FileLine: LogFormatItem {
    /// Initializes a new File line Log Format Item.
    public init() { }
    
    public func format<E>(_ messageData: LogMessageData<E>) -> String {
        "\(messageData.fileLine)"
    }
}


