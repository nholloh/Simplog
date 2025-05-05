//
//  ViewController.swift
//  SimplogDemo
//
//  Created by Niklas Holloh on 10.06.21.
//

import UIKit
import Simplog

class ViewController: UIViewController {

    let log = Log.for(subsystem: String(describing: ViewController.self), category: "ViewController")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        log.debug("ViewDidLoad")
        Task {
            do {
                let log = try fileLogDestination.logFileContents
                print(log)
            } catch {
                print(error)
            }
        }
    }


}

