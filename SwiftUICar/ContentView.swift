//
//  ContentView.swift
//  SwiftUICar
//
//  Created by 윤진영 on 2020/10/06.
//

import SwiftUI

struct ContentView: View {
    
    //더미로 만든 데이터를 가져옴
    let carMaker = CarMaker.all()
    
    var body: some View {
       
        //각 Row를 선택했을 때 다른 화면으로 이동하는 네비게이션
        NavigationView{
            //list와 id값을 인자로 lambda식으로 데이터 값에 맞추어 View를 리턴
             List(self.carMaker, id: \.name){ carMaker in
     //            Text(carMaker.name)
                
                //목적지의 UI를 Text로 전달
                NavigationLink(destination:
                    //text 뷰만 주어졌으므로 텍스트 라벨 하나만 보여짐
                    Text(carMaker.name)){
                    
                    //각 Row에 CarMakerCell를 리턴
                    CarMakerCell(carMaker: carMaker)
                }
                 
             }.navigationBarTitle("자동차 제조사")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

	
