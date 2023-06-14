//
//  Thread+CustomStringConvertible.swift
//  
//
//  Created by Niklas Holloh on 28.05.21.
//

import Foundation

extension Foundation.Thread {
    public var logDescription: String {
        if isMainThread {
            return "main"
        }

        return "\(pthread_mach_thread_np(pthread_self()))"
    }
}
