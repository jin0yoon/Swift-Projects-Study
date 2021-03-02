//
//  StateTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/11/03.
//

import SwiftUI

/*
 - State는 뷰가 접근 가능하도록 값을 가지고 있는 프로퍼티 래퍼(Property Wrapper)
 - 프로퍼티 래퍼는 Swift 5.1부터 추가된 어노테이션
 - 프로퍼티 래퍼는 쉽게 말해 사용자가 별도의 코딩 없이 어노테이션만 선언해도 뷰에서 수정이나 읽기가 가능하도록 캡슐화를 대신 해줌
 - isToggleOn -> Bool값
   $isToggleOn -> Bindind<Bool>
 - $가 붙으면 프로퍼티 래퍼 자체를 받기 때문에 안에 있는 WrapperValue 자체를 변경할 수 있음
 - @State는 해당 View 외부로는 사용할 수가 없고 private 형태로 내부에서만 사용 가능
 */
struct StateTest: View {
    @State var isToggleOn: Bool = true

    var body: some View {

        VStack {
            //$가 붙으면 값을 수정가능한 Binding타입 참조합니다.
            Toggle(isOn: $isToggleOn) {
                Text("글자를 가립니다")
            }.padding()

            if isToggleOn {
                Text("그으으을자!")
            }

        }
    }
}

struct StateTest_Previews: PreviewProvider {
    static var previews: some View {
        StateTest()
    }
}
