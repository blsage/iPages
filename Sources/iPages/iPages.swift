import SwiftUI
import UIKit

@available(iOS 13.0, *)
/// A `View` struct wrapper for `UIiPages` which allows a page view to be written entirely in SwiftUI. Binds to a zero-indexed current page `Int`.
public struct iPages<Page: View>: View {
    private var viewControllers: [UIHostingController<Page>]
    @Binding var currentPage: Int
    private var showsPageControl: Bool = true
    private var wraps: Bool = false
    
    /// Initializes the view.
    /// - Parameters:
    ///   - views: The ordered array of views to appear in the page view
    ///   - currentPage: A binding to the page that the user is currently on, zero indexed
    ///   - showsPageControl: Whether or not the page view should include the standard page control dots
    ///   - wraps: Whether or not the page view swipes infinitely
    public init(_ views: [Page], currentPage: Binding<Int>) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self._currentPage = currentPage
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage, wraps: wraps)
            if showsPageControl {
                PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                    .padding()
            }
        }
    }
}

@available(iOS 13.0, *)
public extension iPages {
    /// Modifies whether or not the page view should include the standard page control dots.
    /// - Parameter hideDots: Whether the page view should hide the page dots at the bottom
    /// - Returns: A page view with the the desired presence or absence of dots
    func hideDots(_ hideDots: Bool) -> iPages {
        var view = self
        view.showsPageControl = !hideDots
        return view
    }
    
    /// Modifies whether or not the page view should restart at the beginning when swiping past the end.
    /// - Parameter wraps: Whether or not the page view wraps infinitely
    /// - Returns: A page view with the desired infinite wrap
    func wrapsInfinitely(_ wraps: Bool) -> iPages {
        var view = self
        view.wraps = wraps
        return view
    }
}

@available(iOS 13.0, *)
fileprivate struct PageViewController: UIViewControllerRepresentable {
    var controllers: [UIViewController]
    @Binding var currentPage: Int
    var wraps: Bool
    @State private var previousPage = 0
    
    init(controllers: [UIViewController],
         currentPage: Binding<Int>,
         wraps: Bool)
    {
        self.controllers = controllers
        self._currentPage = currentPage
        self.wraps = wraps
        self.previousPage = currentPage.wrappedValue
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIViewController(context: Context) -> UIPageViewController {
        let pageViewController = UIPageViewController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        pageViewController.dataSource = context.coordinator
        pageViewController.delegate = context.coordinator
        
        return pageViewController
    }
    
    func updateUIViewController(_ pageViewController: UIPageViewController, context: Context) {
        let direction: UIPageViewController.NavigationDirection = previousPage < currentPage ? .forward : .reverse
        pageViewController.setViewControllers(
            [controllers[currentPage]], direction: direction, animated: true) { _ in
            DispatchQueue.main.async {
                previousPage = currentPage
                
            }
        }
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

@available(iOS 13.0, *)
fileprivate struct PageControl: UIViewRepresentable {
    var numberOfPages: Int
    @Binding var currentPage: Int
    
    func makeCoordinator() -> Coordinator {
        Coordinator(self)
    }
    
    func makeUIView(context: Context) -> UIPageControl {
        let control = UIPageControl()
        control.numberOfPages = numberOfPages
        control.addTarget(
            context.coordinator,
            action: #selector(Coordinator.updateCurrentPage(sender:)),
            for: .valueChanged)
        
        return control
    }
    
    func updateUIView(_ uiView: UIPageControl, context: Context) {
        uiView.currentPage = currentPage
    }
    
    class Coordinator: NSObject {
        var control: PageControl
        
        init(_ control: PageControl) {
            self.control = control
        }
        
        @objc func updateCurrentPage(sender: UIPageControl) {
            control.currentPage = sender.currentPage
        }
    }
}
