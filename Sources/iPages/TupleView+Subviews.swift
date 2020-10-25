//
//  TupleView+Subviews.swift
//  
//
//  Created by Benjamin Sage on 10/25/20.
//

import AssociatedTypeRequirementsVisitor
import SwiftUI

private let converter = AnyViewConverter()

extension AnyView {
    init?(_ value: Any) {
        guard let view = converter(value) else { return nil }
        self = view
    }
}

private struct AnyViewConverter : ViewVisitor {
    // Provide a function that can be called with all the necessary type information
    func callAsFunction<T : View>(_ value: T) -> AnyView {
        return AnyView(value)
    }
}

extension TupleView {
    
    func subviews() -> [AnyView] {
        let mirror = Mirror(reflecting: self)
        let tuple = mirror.children.first!.value
        let tupleMirror = Mirror(reflecting: tuple)
        return tupleMirror.children.map { AnyView($0.value)! }
    }
    
}
