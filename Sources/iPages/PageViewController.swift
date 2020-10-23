//
//  PageViewController.swift
//  
//
//  Created by Benjamin Sage on 10/23/20.
//

import SwiftUI
import UIKit

@available(iOS 13.0, *)
struct PageViewController: UIViewControllerRepresentable {
    var controllers: [UIViewController]
    @Binding var currentPage: Int
    
    private var wraps: Bool
    var navigationOrientation: UIPageViewController.NavigationOrientation
    var bounce: Bool
    private var interPageSpacing: CGFloat = 0
    
    init(controllers: [UIViewController],
         currentPage: Binding<Int>,
         wraps: Bool,
         navigationOrientation: UIPageViewController.NavigationOrientation,
         bounce: Bool,
         interPageSpacing: CGFloat)
    {
        self.controllers = controllers
        self._currentPage = currentPage
        self.wraps = wraps
        self.navigationOrientation = navigationOrientation
        self.bounce = bounce
        self.interPageSpacing = interPageSpacing
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
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
            animated: true)
    }
    
    class Coordinator: NSObject, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
        var parent: PageViewController
        
        init(_ pageViewController: PageViewController) {
            self.parent = pageViewController
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerBefore viewController: UIViewController) -> UIViewController?
        {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index == 0 {
                if parent.wraps {
                    return parent.controllers.last
                } else {
                    return nil
                }
            }
            return parent.controllers[index - 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            viewControllerAfter viewController: UIViewController) -> UIViewController?
        {
            guard let index = parent.controllers.firstIndex(of: viewController) else {
                return nil
            }
            if index + 1 == parent.controllers.count {
                if parent.wraps {
                    return parent.controllers.first
                } else {
                    return nil
                }
            }
            return parent.controllers[index + 1]
        }
        
        func pageViewController(
            _ pageViewController: UIPageViewController,
            didFinishAnimating finished: Bool,
            previousViewControllers: [UIViewController],
            transitionCompleted completed: Bool)
        {
            if completed,
               let visibleViewController = pageViewController.viewControllers?.first,
               let index = parent.controllers.firstIndex(of: visibleViewController)
            {
                parent.currentPage = index
            }
        }
    }
}
