//
//  File.swift
//  
//
//  Created by Niklas Holloh on 10.06.21.
//

import Foundation

/// Provides static functions to modify LogMessages when calling the log interface.
public struct LogMessageModifier {
    
    let modifiedString: String
    
    init(modifiedContent string: String) {
        modifiedString = string
    }
}
