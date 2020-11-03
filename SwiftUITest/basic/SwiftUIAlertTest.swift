//
//  SwiftUIAlertTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUIAlertTest: View {
    @State private var showingAlert = false
    
    var body: some View {
        //Alert 형식
        //title -> Alert 창의 큰 글씨
        //message -> Alert 창의 작은 글씨
        //dismissbutton -> Alert 창을 닫는 버튼
//        Alert(title: Text, message: Text?, dismissButton: Alert.Button?)
        
        //다음 코드와 같이 버튼과 @State 변수를 만들어 버튼을 누르면 원하는 alert 창이 나오게 할 수 있음
        Button(action: {
            self.showingAlert = true
        }){
            Text("Show Alert")
        }
        .alert(isPresented: $showingAlert){
            Alert(title: Text("Title"), message: Text("This is a alert message"), dismissButton: .default(Text("Dismiss")))
        }
        
        //Alert 액션
        //primary button, secondary button으로 액션 추가
        Button(action: {
            self.showingAlert = true
        }){
            Text("Show Alert")
        }
        .alert(isPresented: $showingAlert){
            Alert(title: Text("Title"), message: Text("This is a alert message"), primaryButton: .destructive(Text("Primary"), action: {
                //Some action
            }), secondaryButton: .cancel())
        }
    }
}

struct SwiftUIAlertTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUIAlertTest()
    }
}
