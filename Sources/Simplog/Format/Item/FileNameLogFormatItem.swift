//
//  FileNameLogFormatItem.swift
//  Simplog
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Describes a file name in the log format.
public struct FileName: LogFormatItem {
    /// Initializes a new File Name Log Format Item.
    public init() { }
    
    public func format<E>(_ messageData: LogMessageData<E>) -> String {
        messageData.fileName
    }
}


