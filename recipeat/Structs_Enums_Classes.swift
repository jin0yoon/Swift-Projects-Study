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
