//
//  SwiftUIFormDisableTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUIFormDisableTest: View {
    @State var toggling = false
    var body: some View {
        
        //Form의 특정 뷰를 활성 또는 비활성 할 수 있음
        //Toggle 스위치에 따라 toggling 변수에 담기는 bool값이 변경되고,
        //그 값이 버튼 뷰의 활성화 여부를 결정함
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
                    }.disabled(!toggling)
                }
                
            }.navigationBarTitle(Text("Settings"))
        }
    }
}

struct SwiftUIFormDisableTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIFormDisableTest()
    }
}
