//
//  SwiftUIFormSectionTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUIFormSectionTest: View {
    @State var toggling = false
    var body: some View {
        //섹션 나누기
        //Form의 섹션을 나누기 위해서는 Form 안에서 Section 별로 구분 지어주면 됨
        //Form을 두개의 section으로 나눔
        //하나의 섹션에는 토글 스위치와 fotter가 있고
        //다른 섹션에는 버튼이 있음
        NavigationView{
            Form{
                Section(footer: Text("footer")){
                    Toggle(isOn: $toggling){
                        Text("Toggly")
                    }
                }

                Section{
                    Button(action: {

                    }){
                        Text("Save changes")
                    }
                }
                
            }.navigationBarTitle(Text("Settings"))
        }
    }
}

struct SwiftUIFormSectionTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIFormSectionTest()
    }
}
