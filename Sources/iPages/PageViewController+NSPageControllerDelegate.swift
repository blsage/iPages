//
//  PageViewController+NSPageControllerDelegate.swift
//  
//
//  Created by Benjamin Leonardo Sage on 11/19/20.
//

#if os(macOS)

import SwiftUI
import AppKit

extension PageViewController {
    class Coordinator: NSObject, NSPageControllerDelegate {
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        
        func pageController(
            _ pageController: NSPageController,
            identifierFor object: Any) -> NSPageController.ObjectIdentifier
        {
            return NSPageController.ObjectIdentifier(describing: object)
        }
        
        func pageController(
            _ pageController: NSPageController,
            viewControllerForIdentifier identifier: NSPageController.ObjectIdentifier) -> NSViewController
        {
            return parent.controllers[Int(identifier) ?? -1]
        }
        
        func pageController(
            _ pageController: NSPageController,
            prepare viewController: NSViewController,
            with object: Any?)
        {
            
        }
        
        func pageControllerWillStartLiveTransition(_ pageController: NSPageController) {
        }
        
        func pageController(
            _ pageController: NSPageController,
            didTransitionTo object: Any)
        {
            
        }
        
        func pageControllerDidEndLiveTransition(_ pageController: NSPageController) {
            parent.currentPage = pageController.selectedIndex
            pageController.completeTransition()
        }
    }
}

#endif
