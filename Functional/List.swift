//
//  List.swift
//  Functional
//
//  Created by Dominik Personal on 23/02/2018.
//  Copyright © 2018 Dominik Olędzki. All rights reserved.
//

import Foundation

public enum List<T> {
    case end
    indirect case value(T, List)
    
    public init(_ array: [T]) {
        var list = List.end
        for x in array.reversed() {
            list = list.insert(x)
        }
        self = list
    }
    
    public var head: T {
        guard case let .value(head, _) = self else { fatalError("Empty list!") }
        return head
    }
    
    public var tail: List {
        switch self {
        case .end:
            return .end
        case let .value(_, tail):
            return tail
        }
    }
    
    public var count: Int {
        guard case let .value(_, tail) = self else { return 0 }
        return 1 + tail.count
    }
    
    public func insert(_ value: T) -> List {
        return List.value(value, self)
    }
    
    public func drop(_ n: Int) -> List {
        if n == 0 {
            return self
        } else {
            switch self {
            case .end:
                fatalError("Too few elements!")
            case let .value(_, next):
                return next.drop(n-1)
            }
        }
    }
}

public extension List where T == Int {
    public func sum() -> Int {
        return sumTCO(list: self, acc: 0)
    }
}

private func sumTCO(list: List<Int>, acc: Int) -> Int {
    guard case let .value(head, tail) = list else { return acc }
    return sumTCO(list: tail, acc: acc + head)
}

