//
//  CarMaker.swift
//  SwiftUICar
//
//  Created by 윤진영 on 2020/10/06.
//

import Foundation

struct CarMaker {
    let name: String
    let imageUrl: String
    let numberOfStore: Int
}

extension CarMaker{
    //정적함수를 이용하여 모든 데이터를 가져옴
    static func all() -> [CarMaker]{
        return[
            CarMaker(name: "기아자동차", imageUrl: "car1", numberOfStore: 2000),
            
            CarMaker(name: "현대자동차", imageUrl: "car2", numberOfStore: 2100),
            
            CarMaker(name: "쌍용자동차", imageUrl: "car3", numberOfStore: 2200)
        ]
    }
}
