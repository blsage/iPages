//
//  PageViewBuilder.swift
//  
//
//  Created by Benjamin Sage on 10/21/20.
//

import SwiftUI

@_functionBuilder
public struct PageViewBuilder {
    public static func buildBlock<Content>(_ c: Content) -> [UIViewController] where Content: View {
        return [UIHostingController(rootView: c)]
    }
    
    public static func buildBlock<C0, C1>(
        _ c0: C0,
        _ c1: C1
    ) -> [UIViewController]
    where
        C0 : View,
        C1 : View
    {
        return [UIHostingController(rootView: c0),
                UIHostingController(rootView: c1)]
    }
    
    public static func buildBlock<C0, C1, C2>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2
    ) -> [UIViewController]
    where
        C0 : View,
        C1 : View,
        C2 : View
    {
        return [UIHostingController(rootView: c0),
                UIHostingController(rootView: c1),
                UIHostingController(rootView: c2)]
    }
    
    public static func buildBlock<C0, C1, C2, C3>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3
    ) -> [UIViewController]
    where
        C0 : View,
        C1 : View,
        C2 : View,
        C3 : View
    {
        return [UIHostingController(rootView: c0),
                UIHostingController(rootView: c1),
                UIHostingController(rootView: c2),
                UIHostingController(rootView: c3)]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3,
        _ c4: C4
    ) -> [UIViewController]
    where
        C0 : View,
        C1 : View,
        C2 : View,
        C3 : View,
        C4 : View
    {
        return [UIHostingController(rootView: c0),
                UIHostingController(rootView: c1),
                UIHostingController(rootView: c2),
                UIHostingController(rootView: c3),
                UIHostingController(rootView: c4)]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3,
        _ c4: C4,
        _ c5: C5
    ) -> [UIViewController]
    where
        C0 : View,
        C1 : View,
        C2 : View,
        C3 : View,
        C4 : View,
        C5 : View
    {
        return [UIHostingController(rootView: c0),
                UIHostingController(rootView: c1),
                UIHostingController(rootView: c2),
                UIHostingController(rootView: c3),
                UIHostingController(rootView: c4),
                UIHostingController(rootView: c5)]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3,
        _ c4: C4,
        _ c5: C5,
        _ c6: C6
    ) -> [UIViewController]
    where
        C0 : View,
        C1 : View,
        C2 : View,
        C3 : View,
        C4 : View,
        C5 : View,
        C6 : View
    {
        return [UIHostingController(rootView: c0),
                UIHostingController(rootView: c1),
                UIHostingController(rootView: c2),
                UIHostingController(rootView: c3),
                UIHostingController(rootView: c4),
                UIHostingController(rootView: c5),
                UIHostingController(rootView: c6),]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3,
        _ c4: C4,
        _ c5: C5,
        _ c6: C6,
        _ c7: C7
    ) -> [UIViewController]
    where
        C0 : View,
        C1 : View,
        C2 : View,
        C3 : View,
        C4 : View,
        C5 : View,
        C6 : View,
        C7 : View
    {
        return [UIHostingController(rootView: c0),
                UIHostingController(rootView: c1),
                UIHostingController(rootView: c2),
                UIHostingController(rootView: c3),
                UIHostingController(rootView: c4),
                UIHostingController(rootView: c5),
                UIHostingController(rootView: c6),
                UIHostingController(rootView: c7)]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3,
        _ c4: C4,
        _ c5: C5,
        _ c6: C6,
        _ c7: C7,
        _ c8: C8
    ) -> [UIViewController]
    where
        C0 : View,
        C1 : View,
        C2 : View,
        C3 : View,
        C4 : View,
        C5 : View,
        C6 : View,
        C7 : View,
        C8 : View
    {
        return [UIHostingController(rootView: c0),
                UIHostingController(rootView: c1),
                UIHostingController(rootView: c2),
                UIHostingController(rootView: c3),
                UIHostingController(rootView: c4),
                UIHostingController(rootView: c5),
                UIHostingController(rootView: c6),
                UIHostingController(rootView: c7),
                UIHostingController(rootView: c8)]
    }
    
    public static func buildBlock<C0, C1, C2, C3, C4, C5, C6, C7, C8, C9>(
        _ c0: C0,
        _ c1: C1,
        _ c2: C2,
        _ c3: C3,
        _ c4: C4,
        _ c5: C5,
        _ c6: C6,
        _ c7: C7,
        _ c8: C8,
        _ c9: C9
    ) -> [UIViewController]
    where
        C0 : View,
        C1 : View,
        C2 : View,
        C3 : View,
        C4 : View,
        C5 : View,
        C6 : View,
        C7 : View,
        C8 : View,
        C9 : View
    {
        return [UIHostingController(rootView: c0),
                UIHostingController(rootView: c1),
                UIHostingController(rootView: c2),
                UIHostingController(rootView: c3),
                UIHostingController(rootView: c4),
                UIHostingController(rootView: c5),
                UIHostingController(rootView: c6),
                UIHostingController(rootView: c7),
                UIHostingController(rootView: c8),
                UIHostingController(rootView: c9)]
    }
}
