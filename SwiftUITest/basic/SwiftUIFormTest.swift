//
//  SwiftUIFormScrollViewTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUIFormScrollViewTest: View {
    @State var toggling = false
    var body: some View {
        //SwiftUI의 Form은 HStack이나 VStack과 같은 컨테이너와 비슷하게 작동
        //즉, Form 안에 여러 뷰룰 넣을 수 있음
        //단지, 특정 컨트롤 요소에 대해 더 보기 좋고 잘 작동하게 해줌
        //네비게이션 뷰 안에 Form이 있고,
        //그 안에 토글 스위치와 버튼이 있음
        //실행하면 Toggle 스위치와 버튼이 순서대로 보여짐
        NavigationView{
            Form{
                Toggle(isOn: $toggling){
                    Text("Toggly")
                }

                Button(action: {

                }){
                    Text("Save changes")
                }
            }.navigationBarTitle(Text("Settings"))
        }
    }
}

struct SwiftUIFormScrollViewTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIFormScrollViewTest()
    }
}
