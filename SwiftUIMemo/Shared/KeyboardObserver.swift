//
//  KeyboardObserver.swift
//  SwiftUIMemo
//
//  Created by 윤진영 on 2020/10/10.
//

import UIKit
import Combine

class KeyboardObserver: ObservableObject{
    //애니메이션 시간과 키보드 높이를 저장하는 구조체 선언
    struct Context {
        let animationDuration: TimeInterval
        let height: CGFloat
        
        //키보드가 숨겨진 상태의 기본값을 타입 프로퍼티로 저장
        static let hide = Self(animationDuration: 0.25, height: 0.0)
    }
    
    //binding에 사용하는 속성 선언
    //값이 업데이트 되면 연괸되어있는 뷰가 자동으로 업데이트되도록
    @Published var context = Context.hide
    
    //메모리 관리에 사용되는 속성 선언
    private var cancellabled = Set<AnyCancellable>()
    
    //생성자 선언
    init() {
        //여기에서 Observer를 등록
        //UIkit 방식으로 구현하지 않고 Combine을 활용해서 구현
        let willShow = NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
        
        let willHide = NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
        
        //merge 연산자로 합침
        //키보드 willShow notification과 willHide notification이
        //전달되면, parse 메소드가 실행되고,
        //parse가 return하는 결과가 context속성에 자동으로 저장됨
        //keyboardObserver 객체가 사라지면 관련된 메모리가 자동으로 정리됨
        willShow.merge(with: willHide)
            //notification에서 필요한 데이터를 추출한 다음
            //compactMap연산자를 활용해서 context형식으로 변환
            .compactMap(parse)
            //변환된 context instance를 context 속성에 bind
            .assign(to: \.context, on: self)
            //메모리 처리에 필요한 코드
            .store(in: &cancellabled)
    }
    
    func parse(notification: Notification) -> Context?{
        //keyboard 높이를 꺼내야 함
        guard let userInfo = notification.userInfo else { return nil}
        
        let safeAreaInsets = UIApplication.shared.windows.first?.safeAreaInsets
        
        let animationDuration = (userInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as? NSNumber)?.doubleValue ?? 0.25
        
        
        //높이를 저장할 변수를 선언하고 0으로 초기화
        var height: CGFloat = 0.0
        
        if let value = userInfo[UIResponder.keyboardFrameEndUserInfoKey] as? NSValue{
            let frame = value.cgRectValue
            
            if frame.origin.y < UIScreen.main.bounds.height {
                height = frame.height - (safeAreaInsets?.bottom ?? 0.0)
            }
        }
        
        return Context(animationDuration: animationDuration, height: height)
    }
    
}
