//
//  SwiftTestingTests.swift
//  SwiftTestingTests
//
//  Created by Burak Afyonlu on 7.05.2023.
//

import XCTest
@testable import SwiftTesting

final class SwiftTestingTests: XCTestCase {

   
    let math = mathematicFunc()
    
    func testAddIntegers() {
        
        let result = math.addIntegers(x: 3, y: 5)
        
        XCTAssertEqual(result, 8)
        
    }
    
    func testmultiplyIntegers() {
        
        let result = math.multiplyIntegers(x: 3, y: 5)
        
        XCTAssertEqual(result, 15)
        
    }
    
    func testDivideIntegers() {
        
        let result = math.divideIntegers(x: 10, y: 2)
        
        XCTAssertEqual(result, 5)
        
    }

}
