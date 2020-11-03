//
//  SwiftUIStepperTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/06.
//

import SwiftUI

struct SwiftUIStepperTest: View {
    @State var age = 22
    
    var body: some View {
        //stepper 역할
        //swiftUI의 stepper는 uikit의 uistepper와 같은 역할
        //stepper에도 넣을 수 있는 여러개의 파라미터가 잇음
        //가장 많이 쓰이는 파라미터
        //title: stepper의 제목 view가 들어감
        //value: binding되는 값이 들어감
        //in : stepper의 범위를 설정
//        Stepper(StringProtocol, value: Binding<Strideable>, in: ClosedRange<Strideable>)
        
        //stepper 전체 코드
        VStack{
            Stepper("Enter your age", value: $age, in: 0...130)
            Text("Your age is \(age)")
        }
    }
}

struct SwiftUIStepperTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIStepperTest()
    }
}
