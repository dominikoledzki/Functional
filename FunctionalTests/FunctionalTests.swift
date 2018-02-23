//
//  FunctionalTests.swift
//  FunctionalTests
//
//  Created by Dominik Personal on 23/02/2018.
//  Copyright © 2018 Dominik Olędzki. All rights reserved.
//

import XCTest
import Functional

class FunctionalTests: XCTestCase {
    var list: List<Int> = List.end
    var array = Array<Int>()
    let elementsCount = 1_000_000
    
    override func setUp() {
        for _ in 0..<elementsCount {
            array.append(Int(arc4random()))
        }
        list = List(array)
    }
    
    func testArrayPerformance() {
        var sum = 0
        self.measure {
            for x in array {
                sum += x
            }
        }
        print(sum)
    }
    
    func testListPerformance() {
        var sum = 0;
        self.measure {
            sum = list.sum()
        }
        print(sum)
    }
}
