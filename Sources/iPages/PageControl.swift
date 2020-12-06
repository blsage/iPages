//
//  PageControl.swift
//  
//
//  Created by Benjamin Sage on 10/23/20.
//

#if os(iOS)

import SwiftUI
import UIKit

struct PageControl: UIViewRepresentable {
    private var numberOfPages: Int
    @Binding private var currentPage: Int
    
    private var hidesForSinglePage: Bool = false
    private var pageIndicatorTintColor: UIColor?
    private var currentPageIndicatorTintColor: UIColor?
    
    private var _backgroundStyle: Any? = nil
    @available(iOS 14, *)
    private var backgroundStyle: UIPageControl.BackgroundStyle {
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
    private var allowsContinuousInteraction: Bool = true
    
    init(numberOfPages: Int,
         currentPage: Binding<Int>,
         hidesForSinglePage: Bool,
         pageIndicatorTintColor: UIColor?,
         currentPageIndicatorTintColor: UIColor?,
         allowsContinuousInteraction: Bool)
    {
        self.numberOfPages = numberOfPages
        self._currentPage = currentPage
        self.hidesForSinglePage = hidesForSinglePage
        self.pageIndicatorTintColor = pageIndicatorTintColor
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        self.allowsContinuousInteraction = allowsContinuousInteraction
    }
    
    @available(iOS 14.0, *)
    init(numberOfPages: Int,
         currentPage: Binding<Int>,
         hidesForSinglePage: Bool,
         pageIndicatorTintColor: UIColor?,
         currentPageIndicatorTintColor: UIColor?,
         backgroundStyle: UIPageControl.BackgroundStyle,
         allowsContinuousInteraction: Bool)
    {
        self.numberOfPages = numberOfPages
        self._currentPage = currentPage
        self.hidesForSinglePage = hidesForSinglePage
        self.pageIndicatorTintColor = pageIndicatorTintColor
        self.currentPageIndicatorTintColor = currentPageIndicatorTintColor
        self.backgroundStyle = backgroundStyle
        self.allowsContinuousInteraction = allowsContinuousInteraction
    }
        
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

#endif
