//
//  LogFormat+Defaults.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

public extension LogFormat {
    
    /// The default log format, structured like: `17:56:24.12 [DEBUG]: Hello World!`.
    static let `default`: LogFormat = .create {
        Date(format: "HH:mm:ss.SSSS")
        Separator(.space)
        Level()
            .inBraces(.square)
        Separator(.colon)
            .padded(.right)
        Message()
    }
    
    /// A verbose log format, structured like: `17:56:24.12 [DEBUG]: Hello World!`.
    static let verbose: LogFormat = .create {
        Date(format: "HH:mm:ss.SSSS")
            .padded(.right)
        
        Text("T:")
            .append(Thread())
            .inBraces(.angle)
            .padded(.right)
        
        FileName()
            .append(Separator(.colon))
            .append(FileLine())
            .inBraces(.round)
            .padded(.right)
        
        Level()
            .uppercased()
            .inBraces(.square)
            .append(Separator(.colon))
            .padded(.right)
        
        Message()
    }
}
