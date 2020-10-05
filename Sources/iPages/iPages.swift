import SwiftUI
import UIKit

@available(iOS 13.0, *)
/// A `View` struct wrapper for `UIiPages` which allows a page
/// view to be written entirely in SwiftUI
public struct iPages<Page: View>: View {
    var viewControllers: [UIHostingController<Page>]
    @Binding var currentPage: Int
    var showsPageControl: Bool
    var wraps: Bool
    
    /// Initializes the view
    /// - Parameters:
    ///   - views: The ordered array of views to appear in the page view
    ///   - currentPage: A binding to the page that the user is currently on
    ///   - showsPageControl: Whether or not the page view should include the standard page control dots
    ///   - wraps: Whether or not the page view swipes  infinitely
    public init(_ views: [Page],
                currentPage: Binding<Int>,
                showsPageControl: Bool = true,
                wraps: Bool = false)
    {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self._currentPage = currentPage
        self.showsPageControl = showsPageControl
        self.wraps = wraps
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            iPagesController(controllers: viewControllers, currentPage: $currentPage, wraps: wraps)
            if showsPageControl {
                PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
                    .padding()
            }
        }
    }
}

@available(iOS 13.0, *)
fileprivate struct iPagesController: UIViewControllerRepresentable {
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
    
    func makeUIViewController(context: Context) -> UIiPagesController {
        let iPagesController = UIiPagesController(
            transitionStyle: .scroll,
            navigationOrientation: .horizontal)
        iPagesController.dataSource = context.coordinator
        iPagesController.delegate = context.coordinator
        
        return iPagesController
    }
    
    func updateUIViewController(_ iPagesController: UIiPagesController, context: Context) {
        let direction: UIiPagesController.NavigationDirection = previousPage < currentPage ? .forward : .reverse
        iPagesController.setViewControllers(
            [controllers[currentPage]], direction: direction, animated: true) { _ in
            DispatchQueue.main.async {
                previousPage = currentPage
                
            }
        }
    }
    
    class Coordinator: NSObject, UIiPagesControllerDataSource, UIiPagesControllerDelegate {
        var parent: iPagesController
        
        init(_ iPagesController: iPagesController) {
            self.parent = iPagesController
        }
        
        func iPagesController(
            _ iPagesController: UIiPagesController,
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
        
        func iPagesController(
            _ iPagesController: UIiPagesController,
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
        
        func iPagesController(_ iPagesController: UIiPagesController, didFinishAnimating finished: Bool, previousViewControllers: [UIViewController], transitionCompleted completed: Bool) {
            if completed,
               let visibleViewController = iPagesController.viewControllers?.first,
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
