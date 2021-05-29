//
//  LogFormat.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

public struct LogFormat: ExpressibleByArrayLiteral {
    let combinedFormat: LogFormatItem
    
    public init(arrayLiteral elements: LogFormatItem...) {
        combinedFormat = Self.reduce(elements)
    }
    
    public init(formatItems: [LogFormatItem]) {
        combinedFormat = Self.reduce(formatItems)
    }
    
    private static func reduce(_ formatItems: [LogFormatItem]) -> LogFormatItem {
        return formatItems.reduce(Empty() as LogFormatItem, { $0.append($1) })
    }
    
    public static func create(@LogFormatBuilder format: () -> LogFormat) -> LogFormat {
        format()
    }
}
