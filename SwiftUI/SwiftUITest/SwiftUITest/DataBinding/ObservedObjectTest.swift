//
//  ObservedObjectTest.swift
//  SwiftUITest
//
//  Created by 윤진영 on 2020/11/03.
//

import SwiftUI

/*
 - 하지만 State는 Toggle 유무와 같은 UI의 상태 값과 같은 아주 한정된 용도로만 사용하기를 권고하고 있는데 그 이유는 뷰 안에만 사용하는 메모리 공간이기 때문
 - 만약 뷰 밖의 클래스에서 사용한다면 ObservableObject를 사용할 수 있음
 - 별도의 클래스를 만든 다음 ObservableObject 프로토콜을 상속받으면 SwiftUI에서 사용할 수 있음
 - count 앞에 있는 Published 어노테이션은 값이 변동되었을 때 바로 View에게 즉각적으로 알려주는 Annotation
 - 이제 View 안에서도 외부 클래스를 사용할 수 있음
 - 만약 @Published를 지우고 실행한다면 버튼을 눌러도 값은 바뀌지만 UI는 바뀌지 않음
 - 만약 즉각적으로 UI가 바뀌는 것이 아닌 특정한 조건식에 의해 UI를 변동시킬 수도 있음
 */

class CountRepo: ObservableObject {
    @Published var count: Int = 0
}

//조건식에 의해 UI를 변동
//objectWillChange.send()는 SwiftUI에 값이 변동됐음을 알려주는 메서드로 위에서는 값이 5 단위일 때만 실행되기 때문에 이제 버튼을 눌렀을 때 5번씩 눌렀을 때만 텍스트가 바뀌게 된다.
//class CountRepo: ObservableObject {
//
//    var count:Int = 0 {
//        willSet(newVal){
//            print(newVal % 5)
//            if(newVal % 5 == 0){
//                objectWillChange.send()
//            }
//        }
//    }
//
//}

struct ObservedObjectTest: View {
    @ObservedObject var countRepo = CountRepo()

        var body: some View {
            VStack {
                Text("\(self.countRepo.count)").font(.largeTitle)
                
                Button("숫자증가") {
                    self.countRepo.count += 1
                }
            }
        }
    }
struct ObservedObjectTest_Previews: PreviewProvider {
    static var previews: some View {
        ObservedObjectTest()
    }
}

