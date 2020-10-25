//
//  View+Decomposable.swift
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
        if Body.self == Never.self {
            return [AnyView(self)]
        }
        return body.decompose()
    }
}

extension ForEach: Decomposable where Content: View {
    func subviews() -> [AnyView] {
        return data.map(content).flatMap { $0.decompose() }
    }
}
