//
//  Structs_Enums_Classes.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/11.
//

import Foundation
import SwiftUI

struct recipePost: Identifiable {
    var id = UUID()
    
    var postingUser: String
    var description: String
    var numberOfLikes: Int
    var image: Image
}

var lightBlue = Color.init(red: 91/255, green: 152/255, blue: 198/255)
var darkBlue = Color.init(red: 47/255, green: 75/255, blue: 135/255)
var vDarkBlue = Color.init(red: 2/255, green: 51/255, blue: 92/255)
