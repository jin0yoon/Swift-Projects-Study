//
//  SwiftUIScrollViewTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUIScrollViewTest: View {
    var body: some View {
        //ScrollView(){} 안에, 추가할 다른 view를 넣으면 됨
        ScrollView(){
            Image("images (1)")
            Text("Hello munon")
        }
    }
}

struct SwiftUIScrollViewTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIScrollViewTest()
    }
}
