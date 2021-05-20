//
//  ContentViewDateTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/09/29.
//

import SwiftUI

struct SwiftUIDateTest: View {
    static let taskDateFormat: DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
        
    }()
    
    var dueDate = Date()
    var body: some View {
        Text("Task due date: \(dueDate, formatter: Self.taskDateFormat)")
    }
}

struct SwiftUIDateTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIDateTest()
    }
}
