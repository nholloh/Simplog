//
//  ModifiedLogFormatItem.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

extension LogFormat {
    
    /// A modifier for another LogFormatItem, which mutates the original
    /// result of the LogFormatItem based on a modifier closure. Multiple
    /// ModifiedItems can be chained into another. Their order of chaining
    /// applies.
    public struct ModifiedItem<Item: LogFormatItem>: LogFormatItem {
        
        private let original: Item
        private let modifier: (String) -> String
        
        /// A modifier for another LogFormatItem, which mutates the original
        /// result of the LogFormatItem based on a modifier closure.
        /// - Parameters:
        ///   - item: The original LogFormatItem.
        ///   - modifier: The closure modifying the original LogFormatItem's result.
        public init(original item: Item, modifier: @escaping (String) -> String) {
            original = item
            self.modifier = modifier
        }
        
        public func format<E>(_ messageData: LogMessageData<E>) -> String {
            return modifier(original.format(messageData))
        }
    }
}
