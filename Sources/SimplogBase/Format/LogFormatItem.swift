//
//  LogFormatItem.swift
//  Simplog
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Defines how a log format item should process incoming raw log
/// data, so that it may be combined with other log format items
/// to a complete log format.
public protocol LogFormatItem
{
    /// Chooses data from Log.MessageData and converts the information
    /// into a string for concatenation by a top level log formatter.
    /// - Parameter messageData: A complete set of raw log message data.
    func format<E>(_ messageData: LogMessageData<E>) -> String
}
