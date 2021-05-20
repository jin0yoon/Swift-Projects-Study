//
//  SwiftUITextFieldTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/10/04.
//

import SwiftUI

struct SwiftUITextFieldTest: View {
    @State var name: String = "Munon"
    @State var emailAddress = ""
    @State private var password: String = ""
    
    var body: some View {
        //텍스트필드로부터 텍스트 읽어오기
        //텍스트필드는 텍스트의 입력을 읽어오기 위한 component
        //텍스트필드를 사용하기 위해서는 TextField 명령어를 사용
        VStack{
            //인자 값으로 @State로 선언된 변수를 넣어주면
            //이 변수에 텍스트가 입력됨
            TextField("Enter your name", text: $name)
            Text("Hello, \(name)!")
        }
        
        //텍스트필드에 placeholder 추가
        //TextField의 첫 번째 인자 값으로 placeholder 텍스트가 입력됨
        //아래의 코드는 기본으로 wwwz4805@kakao.com을 띄워주고
        //입력되는 값을 emailAddress 변수에 담아준다.
        TextField("wwwz4805@kakao.com", text: $emailAddress)
        
        //텍스트필드에 테두리 만들기
        //텍스트필드의 스타일을 변경하기 위해서는 textFieldStyle을 사용
        //특히 텍스트필드에 테두리 스타일을 주기 위해서는
        //roundedBorder을 사용하면 됨
        TextField("wwwz4805@kakao.com", text: $emailAddress)
            .textFieldStyle(RoundedBorderTextFieldStyle())
        
        //Secure 텍스트필드 사용하기
        //Secure TextField는 입력되는 텍스트의 값을 보호해주기 때문에
        //암호와 같은 텍스트를 입력 받을 때 사용됨
        //SecureField 명령어를 입력하고,
        //첫 인자 값으로 placeholder 텍스트를,
        //두 번째 입력 값으로 입력 받은 텍스트를 담을 변수를 넣어주면 됨
        VStack{
            SecureField("Enter a password", text: $password)
            Text("You entered: \(password)")
        }
    }
}

struct SwiftUITextFieldTest_Previews: PreviewProvider {
    static var previews: some View {
        SwiftUITextFieldTest()
    }
}
