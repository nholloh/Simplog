//
//  LogFormatBuilder.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

#if swift(<5.4)
@_functionBuilder
public struct LogFormatBuilder {
    public static func buildBlock(_ components: LogFormatItem...) -> LogFormat {
        return LogFormat(formatItems: components)
    }
}
#else
@resultBuilder
public struct LogFormatBuilder {
    public static func buildBlock(_ components: LogFormatItem...) -> LogFormat {
        return LogFormat(formatItems: components)
    }
}
#endif
