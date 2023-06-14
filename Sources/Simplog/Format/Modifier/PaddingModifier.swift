//
//  PaddingModifier.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

public extension LogFormat {
    
    /// Represents where padding is to be added respective to an item.
    enum PaddingSide: Int, OptionSet {
        
        /// Adds padding to the left of an item.
        case left = 1
        
        /// Adds padding to the right of an item.
        case right = 2
        
        /// Initializes PaddingSide from a rawValue. `1` is `.left`, every other
        /// integer value maps to `.right`.
        public init(rawValue: Int) {
            if rawValue == 1 {
                self = .left
            }
            
            self = .right
        }
    }
    
}

public extension LogFormatItem {
    
    /// Places padding around the original log format item, depending on the padding side configuration.
    /// - Parameter paddingString: The padding string, which will be added to the item. Default is `" "`.
    /// - Parameter sides: Where to add padding. Default is left and right.
    /// - Returns: A modified log item which contains and holds the original log item in memory.
    func padded(
        with paddingString: String = " ",
        _ sides: LogFormat.PaddingSide = [.left, .right]
    ) -> LogFormat.ModifiedItem<Self> {
        
        let leftPadding = sides.contains(.left) ? paddingString : ""
        let rightPadding = sides.contains(.right) ? paddingString : ""
        
        return .init(original: self) { value in
            "\(leftPadding)\(value)\(rightPadding)"
        }
    }
    
}
