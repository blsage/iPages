//
//  Decomposable.swift
//  
//
//  Created by Benjamin Sage on 10/21/20.
//

import SwiftUI

protocol Decomposable {
    func subviews() -> [AnyView]
}

extension View {
    static func any(from view: Any) -> AnyView {
        return AnyView(view as! Self)
    }
}

extension View {
    func decompose() -> [AnyView] {
        if let decomposable = self as? Decomposable {
            return decomposable.subviews()
        }
        return [AnyView(self)]
    }
}

extension ForEach: Decomposable where Content: View {
    func subviews() -> [AnyView] {
        return data.map(content).flatMap { $0.decompose() }
    }
}

extension TupleView: Decomposable {
    func subviews() -> [AnyView] {
        let mirror = Mirror(reflecting: self)
        let tuple = mirror.children.first!.value
        let tupleMirror = Mirror(reflecting: tuple)
        return tupleMirror.children.map { AnyView(_fromValue: $0.value)! }
    }
}
