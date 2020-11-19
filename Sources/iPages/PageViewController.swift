//
//  PageViewController.swift
//  
//
//  Created by Benjamin Sage on 10/23/20.
//

import SwiftUI
#if os(iOS)
import UIKit
#else
import AppKit
#endif

struct PageViewController: ControllerRepresentable {
    var controllers: [ViewController]
    @Binding var currentPage: Int
    private var animated: Bool
    
    #if os(iOS)
    var navigationOrientation: UIPageViewController.NavigationOrientation
    var bounce: Bool
    private var wraps: Bool
    private var interPageSpacing: CGFloat = 0
    #endif
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
        
    #if os(iOS)
    init(controllers: [ViewController],
         currentPage: Binding<Int>,
         wraps: Bool,
         navigationOrientation: UIPageViewController.NavigationOrientation,
         bounce: Bool,
         interPageSpacing: CGFloat,
         animated: Bool)
    {
        self.controllers = controllers
        self._currentPage = currentPage
        self.wraps = wraps
        self.navigationOrientation = navigationOrientation
        self.bounce = bounce
        self.interPageSpacing = interPageSpacing
        self.animated = animated
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let options: [UIPageViewController.OptionsKey : Any] = [
            .interPageSpacing : interPageSpacing
        ]
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: navigationOrientation,
            options: options)
        
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        pageViewController.view.backgroundColor = .clear
        
        for view in pageViewController.view.subviews {
            if let scrollView = view as? UIScrollView {
                scrollView.delegate = context.coordinator
                break
            }
        }
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        let previousPage = context.coordinator.parent.currentPage
        context.coordinator.parent = self
        
        pageViewController.setViewControllers(
            [controllers[currentPage]],
            direction: currentPage > previousPage ? .forward : .reverse,
            animated: animated)
    }
    #else
    init(controllers: [ViewController],
         currentPage: Binding<Int>,
         animated: Bool) {
        self.controllers = controllers
        self._currentPage = currentPage
        self.animated = animated
    }
    
    func makeNSViewController(context: Context) -> NSPageController {
        let nsPageController = NSPageController()
        nsPageController.view = NSView()
        
        nsPageController.arrangedObjects = Array(0..<controllers.count)
        nsPageController.navigateForward(nil)
        nsPageController.selectedIndex = currentPage
        nsPageController.transitionStyle = .horizontalStrip
        
        nsPageController.delegate = context.coordinator
        
        return nsPageController
    }
    
    func updateNSViewController(_ nsPageController: NSPageController, context: Context) {
        context.coordinator.parent = self
        
        if animated {
            NSAnimationContext.runAnimationGroup({ NSAnimationContext in
                nsPageController.animator().selectedIndex = currentPage
            }, completionHandler: {
                nsPageController.completeTransition()
            })
        } else {
            nsPageController.selectedIndex = currentPage
            nsPageController.completeTransition()
        }
    }
    #endif
}
