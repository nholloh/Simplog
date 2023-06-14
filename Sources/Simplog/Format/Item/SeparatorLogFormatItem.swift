//
//  SeparatorLogFormatItem.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

/// Describes a separator in the log format.
public struct Separator: LogFormatItem {
    
    /// Describes different separator styles.
    public enum SeparatorStyle: String {
        /// Colon Separator `:`
        case colon = ":"
        
        /// Dash Separator `-`
        case dash = "-"
        
        /// Slash `/`
        case slash = "/"
        
        /// Backslash `\`
        case backslash = "\\"
        
        /// Space `" "`
        case space = " "
    }
    
    private let style: SeparatorStyle
    
    /// Describes a separator in the log format.
    /// - Parameter style: The separator style.
    public init(_ style: SeparatorStyle) {
        self.style = style
    }
    
    public func format<E>(_ _: LogMessageData<E>) -> String {
        return style.rawValue
    }
}
