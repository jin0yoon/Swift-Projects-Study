//
//  SwiftUIPickerInFormTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUIPickerInFormTest: View {
    var frameworks = ["UIKit", "Core Data", "CloudKit", "SwiftUI"]
    @State private var selectedFrameworkIndex = 0
    
    var body: some View {
        NavigationView {
               Form {
                   Section {
                       Picker(selection: $selectedFrameworkIndex, label: Text("Favorite Framework")) {
                           ForEach(0 ..< frameworks.count) {
                               Text(self.frameworks[$0])
                           }
                       }
                   }
               }
               .navigationBarTitle("Favorites")
           }
    }
}

struct SwiftUIPickerInFormTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPickerInFormTest()
    }
}
