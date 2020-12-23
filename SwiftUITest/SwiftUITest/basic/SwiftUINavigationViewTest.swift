//
//  SwiftUINavigationViewTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUINavigationViewTest: View {
    var body: some View {
        //Navigation View
        //navigation View와 navigation link
        //navigation link는 navigation view의 다음 링크로 넘어갈 수 있게 해줌
//        NavigationView(){
//            NavigationLink(
//                destination: _,
//                isActive: Binding<Bool>,
//                label: () -> _)
//        }

        
        //두 view link하기
        //다음과 같이 navigation link의 destination 파라미터에 detail 뷰를 넣어줌
        NavigationView(){
            NavigationLink(
                destination: SwiftUINavigarionDetailView()){
                Text("아녕")
            }.navigationTitle("움직여")
                
        }
    }
}

struct SwiftUINavigationViewTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUINavigationViewTest()
    }
}
