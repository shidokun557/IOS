//
//  FoodManagement2021Tests.swift
//  FoodManagement2021Tests
//
//  Created by CNTT on 4/16/21.
//  Copyright © 2021 fit.tdc. All rights reserved.
//

import XCTest
@testable import FoodManagement2021

class FoodManagement2021Tests: XCTestCase {

    // Check if the meal create success or error
    func testMealCreateSuccessed() {
        // When the name id not empty
        let notEmptyName = Meal(mealName: "Mon an", mealImage: nil, mealRatingValue: 4)
        XCTAssertNotNil(notEmptyName)
        
        // When rating value if zero
        let zeroRatingValue = Meal(mealName: "Mon an", mealImage: nil, mealRatingValue: 0)
        XCTAssertNotNil(zeroRatingValue)
        let maxRatingValue = Meal(mealName: "Mon an", mealImage: nil, mealRatingValue: 5)
        XCTAssertNotNil(maxRatingValue)
    }
    
    // Check if the meal create fail
    func testMealCreateFail() {
        // When the name of the meal is empty
        let emptyMealName = Meal(mealName: "", mealImage: nil, mealRatingValue: 4)
        XCTAssertNil(emptyMealName)
        
        // When ratingvalue is over
        let overRating = Meal(mealName: "Mon an", mealImage: nil, mealRatingValue: 6)
        XCTAssertNil(overRating)
        
        // When ratingvalue is negative
        let negativeRatingValue = Meal(mealName: "Mon an", mealImage: nil, mealRatingValue: -1)
        XCTAssertNil(negativeRatingValue)
        
        // Mix condition
        let mixCondition = Meal(mealName: "", mealImage: nil, mealRatingValue: 6)
        XCTAssertNil(mixCondition)
        let mixCondition2 = Meal(mealName: "", mealImage: nil, mealRatingValue: -1)
        XCTAssertNil(mixCondition2)
        
    }

}
