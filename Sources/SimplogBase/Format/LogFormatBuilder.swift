//
//  LogFormatBuilder.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

@resultBuilder
public struct LogFormatBuilder {
    public static func buildBlock(_ components: LogFormatItem...) -> LogFormat {
        return LogFormat(formatItems: components)
    }
}
