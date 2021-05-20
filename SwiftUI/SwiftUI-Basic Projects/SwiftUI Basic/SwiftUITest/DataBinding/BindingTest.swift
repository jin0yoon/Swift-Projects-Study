//
//  BindingTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/11/03.
//

import SwiftUI

/*
 - 만약 리스트뷰와 토글 뷰가 나뉘어 토글에 따라 리스트를 바꿔야 하는 경우처럼 두 개의 뷰가 동시에 하나의 State를 참조해야 하는 경우가 생길 수 있음
 - 이때 @Binding을 사용
 - 단순히 @Binding 어노테이션으로 선언하여 초기화할 때 State값을 받는 것 만으로 여러 개의 뷰가 동시에 State값을 참조할 수 있음
 */
struct BindingTest: View {
    @State var isToggleOn: Bool = true

        var body: some View {

            VStack {

                // isToggleOn을 Binding<Bool> 형태로 리턴하기위에
                // $를 붙여 초기화합니다.
                ChildView(isToggleOn: $isToggleOn)
                if isToggleOn {
                    Text("그으으을자!")
                }

            }
        }
    }


    struct ChildView :View{

        
        //Binding Annoation을 붙이면 Binding<Bool>을 인자로받아 초기화 시킬 수 있습니다.
        @Binding var isToggleOn:Bool

        var body: some View{

            //$가 붙으면 값을 수정가능한 Binding타입 참조합니다.
            Toggle(isOn: $isToggleOn) {
                Text("글자를 가립니다")
            }.padding()
        }
    }

struct BindingTest_Previews: PreviewProvider {
    static var previews: some View {
        BindingTest()
    }
}
