//
//  Examples.swift
//  
//
//  Created by Kalil Fine on 10/9/20.
//
import SwiftUI

#if os(iOS)
@available(iOS 14, *)
struct CustomDotsExample: View {
    @State var currentPage: Int = 0
    var body: some View {
        iPages(selection: $currentPage) {
            Text("OnTap 🍻")
                .font(.system(size: 32, weight: .light, design: .monospaced))
        }
        .dotsBackgroundStyle(.prominent)
        .dotsTintColors(currentPage: Color.pink, otherPages: Color.yellow)
    }
}

struct ShoppingSwipeViewExample: View {
    @State var currentPage: Int = 0
    var body: some View {
        iPages(selection: $currentPage) {
            Text("OnTap 🍻")
                .font(.system(size: 32, weight: .light, design: .monospaced))
            Text("OnTap 🥂")
                .font(.system(size: 32, weight: .light, design: .monospaced))
        }
        .hideDots(true)
        .wraps(true)
    }
}

struct MarketingSwipeViewExample: View {
    @State var currentPage: Int = 0
    var body: some View {
        iPages(selection: $currentPage) {
            Text("OnTap 🍻")
                .font(.system(size: 32, weight: .light, design: .monospaced))
            Text("OnTap 🥂")
                .font(.system(size: 32, weight: .light, design: .monospaced))
        }
    }
}
#endif
