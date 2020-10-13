import SwiftUI
import UIKit

@available(iOS 13.0, *)
/// A `View` wrapper for `UIPageViewController` which lets you write 📝 and use 🔨 a page view in SwiftUI. 🙌
///
/// Binds to a zero-indexed 0️⃣ "current page" `Int`eger.
public struct iPages<Page: View>: View {
    private var viewControllers: [UIHostingController<Page>]
    @Binding var currentPage: Int
    private var showsPageControl: Bool = true
    private var wraps: Bool = false
    
    private var pageControl: PageControl?
    
    /// Initializes the page 📃📖 view. 👷‍♀️
    /// - Parameters:
    ///   - views: The ordered array of `View`s to appear in the page view 📑
    ///   - currentPage: A binding to the page that the user is currently on ⌚️, zero indexed (meaning page 1 is 0, page 2 is 1, etc.)
    ///   - showsPageControl: Whether or not the page view should include the standard page control dots (••••)
    ///   - wraps: Whether or not the page view swipes infinitely 🔁
    public init(_ views: [Page], currentPage: Binding<Int>) {
        self.viewControllers = views.map { UIHostingController(rootView: $0) }
        self._currentPage = currentPage
        self.pageControl = PageControl(numberOfPages: viewControllers.count, currentPage: $currentPage)
        
    }
    
    public var body: some View {
        ZStack(alignment: .bottom) {
            PageViewController(controllers: viewControllers, currentPage: $currentPage, wraps: wraps)
            if showsPageControl {
                pageControl
                    .padding()
            }
        }
    }
}

@available(iOS 13.0, *)
public extension iPages {
    /// Modifies whether or not the page view should include the standard page control **dots**. (••••)
    /// - Parameter hideDots: Whether the page view should hide the page dots at the bottom 👇
    /// - Returns: A page view with the the desired presence or absence of dots
    func hideDots(_ hideDots: Bool) -> iPages {
        var view = self
        view.showsPageControl = !hideDots
        return view
    }
    
    /// Modifies whether or not the page view should **restart at the beginning** 🔁 when swiping past the end (and vise-versa).
    /// - Parameter wraps: Whether or not the page view wraps infinitely 🔄
    /// - Returns: A page view with the desired infinite wrap
    func wrapsInfinitely(_ wraps: Bool) -> iPages {
        var view = self
        view.wraps = wraps
        return view
    }
    
    /// Modifies whether the page dots are hidden when there is only one page. 1️⃣⤵️
    /// - Parameter hide: Whether the page dots are hidden when there is only one page
    /// - Returns: A page view with the desired dots hiding with one page settings
    func dotsHideForSinglePage(_ hide: Bool) -> iPages {
        var view = self
        view.pageControl?.hidesForSinglePage = hide
        return view
    }
    
    /// Modifies **tint colors** 🟡🟢🔴🟣 to be used for the page dots.
    /// - Parameters:
    ///   - currentPage: The tint color to be used for the current page dot ⬇️
    ///   - otherPages: The Tint color to be used for dots which are not the current page⬅️➡️
    /// - Returns: A page view with the desired dot colors
    func dotsTintColors(currentPage: Color, otherPages: Color) -> iPages {
        var view = self
        view.pageControl?.currentPageIndicatorTintColor = UIColor.from(color: currentPage)
        view.pageControl?.pageIndicatorTintColor = UIColor.from(color: otherPages)
        return view
    }
    
    /// Modifies the **background style**  of the page dots.
    /// - Parameter style: The style of the background of the page dots
    /// - Returns: A page view with the desired background style of the dots
    @available(iOS 14, *)
    func dotsBackgroundStyle(_ style: UIPageControl.BackgroundStyle) -> iPages {
        var view = self
        view.pageControl?.backgroundStyle = style
        return view
    }
    
    /// Modifies the continuous interaction settings of the dots. 🔄
    /// - Parameter allowContinuousInteraction: Whether the dots allow continuous interaction
    /// - Returns: A page view with the desired continuous interaction settings of the page dots
    @available(iOS 14, *)
    func dotsAllowContinuousInteraction(_ allowContinuousInteraction: Bool) -> iPages {
        var view = self
        view.pageControl?.allowsContinuousInteraction = allowContinuousInteraction
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
    
    fileprivate var hidesForSinglePage: Bool = false
    fileprivate var pageIndicatorTintColor: UIColor?
    fileprivate var currentPageIndicatorTintColor: UIColor?
    
    fileprivate var _backgroundStyle: Any? = nil
    @available(iOS 14, *)
    fileprivate var backgroundStyle: UIPageControl.BackgroundStyle {
        get {
            if _backgroundStyle == nil {
                return .automatic
            } else {
                return _backgroundStyle as! UIPageControl.BackgroundStyle
            }
        }
        set(newStyle) {
            _backgroundStyle = newStyle
        }
    }
    fileprivate var allowsContinuousInteraction: Bool = true
        
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
        
        control.hidesForSinglePage = hidesForSinglePage
        control.pageIndicatorTintColor = pageIndicatorTintColor
        control.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        
        if #available(iOS 14, *) {
            control.backgroundStyle = backgroundStyle
            control.allowsContinuousInteraction = allowsContinuousInteraction
        }
        
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

@available(iOS 13, *)
fileprivate extension UIColor {
    class func from(color: Color) -> UIColor {
        if #available(iOS 14, *) {
            return UIColor(color)
        } else {
            let scanner = Scanner(string: color.description.trimmingCharacters(in: CharacterSet.alphanumerics.inverted))
            var hexNumber: UInt64 = 0
            var r: CGFloat = 0.0, g: CGFloat = 0.0, b: CGFloat = 0.0, a: CGFloat = 0.0
            
            let result = scanner.scanHexInt64(&hexNumber)
            if result {
                r = CGFloat((hexNumber & 0xff000000) >> 24) / 255
                g = CGFloat((hexNumber & 0x00ff0000) >> 16) / 255
                b = CGFloat((hexNumber & 0x0000ff00) >> 8) / 255
                a = CGFloat(hexNumber & 0x000000ff) / 255
            }
            
            return UIColor(red: r, green: g, blue: b, alpha: a)
        }
    }
}
