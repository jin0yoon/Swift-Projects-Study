//
//  SwiftUIFormHideTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUIFormHideTest: View {
    @State var showingAdvanvedOptions = false
    @State var toggling = false
    
    var body: some View {
    
        //Form 안의 view를 비활성화 하는 것 뿐만 아니라
        //아예 숨길 수도 있음
        Form{
            Section{
                Toggle(isOn: $showingAdvanvedOptions){
                    Text("Show advanced options")
                }
                
                if showingAdvanvedOptions {
                    Toggle(isOn: $toggling){
                        Text("Toggly")
                    }
                }
            }
        }
    }
}

struct SwiftUIFormHideTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIFormHideTest()
    }
}
