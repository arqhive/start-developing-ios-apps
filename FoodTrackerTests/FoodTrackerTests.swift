//
//  FoodTrackerTests.swift
//  FoodTrackerTests
//
//  Created by user on 25/03/2020.
//  Copyright © 2020 arqhive. All rights reserved.
//

import XCTest
@testable import FoodTracker

// Command + U로 테스트 시작
class FoodTrackerTests: XCTestCase {

    //MARK: Meal Class Tests
    // 적절한 파라미터가 넘겨졌을때 Meal 이니셜라이저가 Meal 객체를 반환하는지 확인
    func testMealInitializationSucceeds() {
        // Zero rating
        let zeroRatingMeal = Meal.init(name: "Zero", photo: nil, rating: 0)
        XCTAssertNotNil(zeroRatingMeal)
        
        // 가능한 높은 평점
        let positiveRatingMeal = Meal.init(name: "Positive", photo: nil, rating: 5)
        XCTAssertNotNil(positiveRatingMeal)
    }
    
    // 초기화에 실패한 테스트 사례
    func testMealInitializationFails() {
        // Negative rating
        let negativeRatingMeal = Meal.init(name: "Negative", photo: nil, rating: -1)
        XCTAssertNil(negativeRatingMeal)
         
        // Empty String
        let emptyStringMeal = Meal.init(name: "", photo: nil, rating: 0)
        XCTAssertNil(emptyStringMeal)
        
        // Rating exceeds maximum
        let largeRatingMeal = Meal.init(name: "Large", photo: nil, rating: 6)
        XCTAssertNil(largeRatingMeal)
    }

}
