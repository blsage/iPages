//
//  Typealiases.swift
//  
//
//  Created by Benjamin Leonardo Sage on 11/18/20.
//

import Foundation
import SwiftUI

#if os(iOS)
import UIKit

typealias ViewController = UIViewController
typealias ControllerRepresentable = UIViewControllerRepresentable
typealias HostingController = UIHostingController

#else
import AppKit

typealias ViewController = NSViewController
typealias ControllerRepresentable = NSViewControllerRepresentable
typealias HostingController = NSHostingController
#endif
