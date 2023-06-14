//
//  AppendModifier.swift
//  
//
//  Created by Niklas Holloh on 29.05.21.
//

import Foundation

public struct CombinedFormatItem: LogFormatItem {
    private let item1: LogFormatItem
    private let item2: LogFormatItem
    
    init(item1: LogFormatItem, item2: LogFormatItem) {
        self.item1 = item1
        self.item2 = item2
    }
    
    public func format<E: Codable>(_ messageData: LogMessageData<E>) -> String {
        return item1.format(messageData) + item2.format(messageData)
    }
}

public extension LogFormatItem {
    
    /// Converts the original log format item to uppercased characters.
    /// - Returns: A modified log item which contains and holds the original log item in memory.
    func append(_ item: LogFormatItem) -> CombinedFormatItem {
        CombinedFormatItem(item1: self, item2: item)
    }
}
