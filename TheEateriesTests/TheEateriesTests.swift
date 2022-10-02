//
//  TheEateriesTests.swift
//  TheEateriesTests
//
//  Created by Tia on 4/5/21.
//

import XCTest
@testable import TheEateries

class TheEateriesTests: XCTestCase {
    var eatery: [Eateries]
    
    override init(eatery: [Eateries]) {
        self.eatery = eatery
    }
    
    func testName () throws {
        let nameToTest = "Name"
        
    }
    
//    func testSubHeadline () throws {
//        let subHeadlineToTest = "This is subHeadline"
//        let food = FoodModel(title: "titleToTest", subHeadline: subHeadlineToTest , body: "This is the body text", recipe: "This is the body text", ingredient: ["This is the body text"],image: "foodImage")
//        XCTAssertEqual (food.subHeadline, subHeadlineToTest)
//
//    }

//    @ObservedObject var eateryViewModel: ViewModel

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
