//
//  CaseModifier.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

public extension LogFormatItem {
    
    /// Converts the original log format item to uppercased characters.
    /// - Returns: A modified log item which contains and holds the original log item in memory.
    func uppercased() -> LogFormat.ModifiedItem<Self> {
        .init(original: self) { $0.uppercased() }
    }
    
    /// Converts the original log format item to lowercased characters.
    /// - Returns: A modified log item which contains and holds the original log item in memory.
    func lowercased() -> LogFormat.ModifiedItem<Self> {
        .init(original: self) { $0.lowercased() }
    }
    
}
