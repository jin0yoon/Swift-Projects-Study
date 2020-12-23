//
//  SwiftUIPickerTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUIPickerTest: View {
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State var selectedColor = 0
    
    var body: some View {
        //picker의 역할
        //swiftUI의 picker view는 기존의 uipicker 역할을 담당
        //내부적으로는 uipicker와 uitableview를 동시에 관리한다고 함
        
        //picker 형태
        //기본적으로 picker는 다음과 같은 형태
        //selection에는 binding 변수를
        //label에는 view를
        //content에는 클로저 형태로 view를 리턴하면 됨
//        Picker(selection: Binding<_>, label: _, content: () -> _)
        
        //색상을 선택하는 picker 예시
        //selection에는 $selectedcoler를
        //label에는 안내하는 텍스트 뷰를
        //content에는 foreach문으로 텍스트 뷰를 표시
//        Picker(selection: $selectedColor, label: Text("Choose a color")){
//            ForEach(0 ..< colors.count){
//                Text(self.colors[$0])
//            }
//        }
        
        //예시 전체 코드
        VStack{
            Picker(selection: $selectedColor, label: Text("Please Choose a color")){
                ForEach(0 ..< colors.count){
                    Text(self.colors[$0])
                }
            }
            
            Text("You selected \(colors[selectedColor])")
        }
        
    }
}

struct SwiftUIPickerTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIPickerTest()
    }
}
