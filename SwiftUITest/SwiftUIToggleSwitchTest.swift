//
//  SwiftUIToggleSwitchTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/02.
//

import SwiftUI

//토글 스위치
//UIKit의 UISwitch의 역할을 SwiftUI에서는 Toggle이 함

struct SwiftUIToggleSwitchTest: View {
    @State var showGreeting = true
    var body: some View {
        VStack {
            /*
             Toggle(isOn:)을 사용하면
             showGreeting의 값은 토글 스위치가 눌릴 때마다 값이 변경되고
             그에 해당하는 코드가 실행됨
             */
            Toggle(isOn: $showGreeting){
                Text("Welcome")
            }.padding()
            if showGreeting {
                Text("Hello Munon")
            }
        }
    }
}

struct SwiftUIToggleSwitchTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIToggleSwitchTest()
    }
}
