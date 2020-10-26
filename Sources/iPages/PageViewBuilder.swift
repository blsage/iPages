//
//  PageViewBuilder.swift
//  
//
//  Created by Benjamin Sage on 10/21/20.
//

import SwiftUI

@_functionBuilder
public struct PageViewBuilder {
    
    public static func buildBlock() -> [AnyView] {
        return []
    }
    
    public static func buildBlock<Content : View>(_ content: Content) -> [AnyView] {
        return content.decompose()
    }
        
    public static func buildBlock<C1 : View, C2 : View>(_ c1: C1, _ c2: C2) -> [AnyView] {
        return [c1.decompose(), c2.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View>(_ c1: C1, _ c2: C2, _ c3: C3) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose(), c9.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View, C10 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose(), c9.decompose(), c10.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View, C10 : View, C11 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose(), c9.decompose(), c10.decompose(), c11.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View, C10 : View, C11 : View, C12 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose(), c9.decompose(), c10.decompose(), c11.decompose(), c12.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View, C10 : View, C11 : View, C12 : View, C13 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose(), c9.decompose(), c10.decompose(), c11.decompose(), c12.decompose(), c13.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View, C10 : View, C11 : View, C12 : View, C13 : View, C14 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13, _ c14: C14) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose(), c9.decompose(), c10.decompose(), c11.decompose(), c12.decompose(), c13.decompose(), c14.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View, C10 : View, C11 : View, C12 : View, C13 : View, C14 : View, C15 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13, _ c14: C14, _ c15: C15) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose(), c9.decompose(), c10.decompose(), c11.decompose(), c12.decompose(), c13.decompose(), c14.decompose(), c15.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View, C10 : View, C11 : View, C12 : View, C13 : View, C14 : View, C15 : View, C16 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13, _ c14: C14, _ c15: C15, _ c16: C16) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose(), c9.decompose(), c10.decompose(), c11.decompose(), c12.decompose(), c13.decompose(), c14.decompose(), c15.decompose(), c16.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View, C10 : View, C11 : View, C12 : View, C13 : View, C14 : View, C15 : View, C16 : View, C17 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13, _ c14: C14, _ c15: C15, _ c16: C16, _ c17: C17) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose(), c9.decompose(), c10.decompose(), c11.decompose(), c12.decompose(), c13.decompose(), c14.decompose(), c15.decompose(), c16.decompose(), c17.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View, C10 : View, C11 : View, C12 : View, C13 : View, C14 : View, C15 : View, C16 : View, C17 : View, C18 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13, _ c14: C14, _ c15: C15, _ c16: C16, _ c17: C17, _ c18: C18) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose(), c9.decompose(), c10.decompose(), c11.decompose(), c12.decompose(), c13.decompose(), c14.decompose(), c15.decompose(), c16.decompose(), c17.decompose(), c18.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View, C10 : View, C11 : View, C12 : View, C13 : View, C14 : View, C15 : View, C16 : View, C17 : View, C18 : View, C19 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13, _ c14: C14, _ c15: C15, _ c16: C16, _ c17: C17, _ c18: C18, _ c19: C19) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose(), c9.decompose(), c10.decompose(), c11.decompose(), c12.decompose(), c13.decompose(), c14.decompose(), c15.decompose(), c16.decompose(), c17.decompose(), c18.decompose(), c19.decompose()].flatMap { $0 }
    }
    
    public static func buildBlock<C1 : View, C2 : View, C3 : View, C4 : View, C5 : View, C6 : View, C7 : View, C8 : View, C9 : View, C10 : View, C11 : View, C12 : View, C13 : View, C14 : View, C15 : View, C16 : View, C17 : View, C18 : View, C19 : View, C20 : View>(_ c1: C1, _ c2: C2, _ c3: C3, _ c4: C4, _ c5: C5, _ c6: C6, _ c7: C7, _ c8: C8, _ c9: C9, _ c10: C10, _ c11: C11, _ c12: C12, _ c13: C13, _ c14: C14, _ c15: C15, _ c16: C16, _ c17: C17, _ c18: C18, _ c19: C19, _ c20: C20) -> [AnyView] {
        return [c1.decompose(), c2.decompose(), c3.decompose(), c4.decompose(), c5.decompose(), c6.decompose(), c7.decompose(), c8.decompose(), c9.decompose(), c10.decompose(), c11.decompose(), c12.decompose(), c13.decompose(), c14.decompose(), c15.decompose(), c16.decompose(), c17.decompose(), c18.decompose(), c19.decompose(), c20.decompose()].flatMap { $0 }
    }
    
}

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

extension TupleView: Decomposable {
    func subviews() -> [AnyView] {
        let mirror = Mirror(reflecting: self)
        let tuple = mirror.children.first!.value
        let tupleMirror = Mirror(reflecting: tuple)
        return tupleMirror.children.map { AnyView(_fromValue: $0.value)! }
    }
}
