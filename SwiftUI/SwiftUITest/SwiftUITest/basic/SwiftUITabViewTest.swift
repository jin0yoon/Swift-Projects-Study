//
//  SwiftUITabViewTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUITabViewTest: View {
    var body: some View {
        //swiftUI tabview의 역할은 uikit의 uitabbar controller와 비슷
        //하나의 화면에 여러 개의 view를 tab 방식으로 보여주는 것
        //tabview 형태 -> TabView{} 안에 여러개의 view를 넣는 형태
        TabView{
            SwiftUITabViewContent1()
                //tabItem 속성 값으로 이미지와 텍스트를 넣음
                //image는 sf symbols값을 넣음
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("Menu")
                }
            
            SwiftUITabViewContent2()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Order")
                }
        }
    }
}

struct SwiftUITabViewTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITabViewTest()
    }
}
