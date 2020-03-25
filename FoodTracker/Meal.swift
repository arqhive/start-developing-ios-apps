//
//  Meal.swift
//  FoodTracker
//
//  Created by user on 25/03/2020.
//  Copyright © 2020 arqhive. All rights reserved.
//

import UIKit // UIKit을 가져오면 Foundation 에 액세스 할 수 있다.

class Meal {
    
    //MARK: Properties
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    //MARK: Initialization
    // 이것은 실패할 수 있는 이니셜라이저
    init?(name: String, photo: UIImage?, rating: Int) {
        // 매개 변수의 유효성을 검사하고 유효하지 않은경우 nil을 반환
//        if name.isEmpty || rating < 0  {
//               return nil // 실패 할 수 있는 이니셜라이저만이 nil을 반환 할 수있다.
//        }
        guard !name.isEmpty else {
            return nil
        }
        
        guard (rating >= 0) && (rating <= 5) else {
            return nil
        }
        
        // 저장된 프로퍼티들 초기화
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
}
