//
//  CarMakerDetail.swift
//  SwiftUICar
//
//  Created by 윤진영 on 2020/10/06.
//

import SwiftUI

struct CarMakerDetail: View {
    
    //양방향 바인딩을 위해 State Annotation을 붙임
    //State Annotation이 붙으면 뷰 안에서 값을 참조할 수 있는 랩핑클래스인
    //Binding<T>의 형태로 받음
    @State var isPresent: Bool = false
    let carMaker: CarMaker
    
    var body: some View {
        
        VStack{
            Image(carMaker.imageUrl)
                .resizable()
                .aspectRatio(contentMode: .fit)
            //탭을 2번 연속해서 눌렀을 때 perform 블록을 실행
                .onTapGesture(count: 2, perform: {
                    //isPresent를 true로 바꾸어 alert이 Present되도록
                    self.isPresent = true
                })
            
            Text(carMaker.name)
            //$를 추가하면 isPresent를 Binding<Bool> 형태로 받음
        }.alert(isPresented: $isPresent, content: {
            //화면에 Alert를 띄움
            Alert(title: Text("더블클릭"), message: Text("하셨습니다!"), dismissButton: .default(Text("OK")))
        })
    }
}

//CarMakerDetail 뷰는 carMaker를 인자로 받음
//Xcode의 Preview화면에서는 인자가 정의되어있지 않기 때문에
//PreviewProvider를 정의하지 않으면 렌더링할 데이터가 없어 미리보기를 할 수 없음
//미리보기를 위한 코드
struct CarMarkerDetail_Previews: PreviewProvider {
    
    //view 내부에서의 참조를 위해 정적변수로 선언합니다.
    static let previewMaker = CarMaker(name: "hello world", imageUrl: "car1", numberOfStore: 10000)
    static var previews: some View {
        CarMakerDetail(carMaker: previewMaker)
    }
}
