//
//  Food_TrackerTests.swift
//  Food TrackerTests
//
//  Created by Mike Gilroy on 23/09/2015.
//  Copyright (c) 2015 Mike Gilroy. All rights reserved.
//

import UIKit
import XCTest

class Food_TrackerTests: XCTestCase {
    
    // MARK: Food Tracker Tests
    
    // Tests to confirm that the Meal initializer returns when no name or a negative rating is provided.
    func testMealInitialization() {
        
        // Success case.
        let potentialItem = Meal(name: "Newest meal", photo: nil, rating: 5)
        XCTAssertNotNil(potentialItem)
        
        // Failure cases.
        let noName = Meal(name: "", photo: nil, rating: 0)
        XCTAssertNil(noName, "Empty name is invalid")
        
        let badRating = Meal(name: "Really bad rating", photo: nil, rating: -1)
        XCTAssertNil(badRating, "Negative ratings are invalid, be positive.")
    }
}
