//
//  File.swift
//  
//
//  Created by Kalil Fine on 10/9/20.
//

import SwiftUI
import iGraphics
import iColors

@available(iOS 14, *)
struct CustomDotsExample: View {
    @State var currentPage: Int = 0
    var body: some View {
        iPages([iGraphicsView(.first),
                iGraphicsView(.second),
                iGraphicsView(.third)],
               currentPage: $currentPage)
            .dotsBackgroundStyle(.prominent)
            .dotsTintColors(currentPage: Colors.NeonPurple, otherPages: Colors.NeonRed)
    }
}

struct ShoppingSwipeViewExample: View {
    @State var currentPage: Int = 0
    var body: some View {
        iPages([iGraphicsBox(.photo).stack(3), iGraphicsBox(.card).stack(2)], currentPage: $currentPage)
            .hideDots(true)
            .wrapsInfinitely(true)
    }
}

struct MarketingSwipeViewExample: View {
    @State var currentPage: Int = 0
    var body: some View {
        iPages([iGraphicsView(.first),
                iGraphicsView(.second),
                iGraphicsView(.third)],
               currentPage: $currentPage)
    }
}
