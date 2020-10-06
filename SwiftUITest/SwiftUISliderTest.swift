//
//  SwiftUISliderStepperTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUISliderStepperTest: View {
    @State var grade: Double = 0
    
    
    var body: some View {
        //swiftUI의 slider는 uiKit의 uislider와 같은 역할
        //slider에는 넣을 수 있는 여러개의 파라미터가 있음
        //가장 많이 쓰이는 파라미터
        //value: binding되는 값이 들어감
        //label: slider의 범위를 설정
        //step: slider의 단위를 설정
//        Slider(value: <#T##Binding<BinaryFloatingPoint>#>, Label: () -> _, step: Int)
        
        //slider 전체 코드
        VStack{
            Slider(value: $grade, in:0...100, step: 1)
            Text("Your grade is \(grade)")
        }
        
        
    }
}

struct SwiftUISliderStepperTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUISliderStepperTest()
    }
}
