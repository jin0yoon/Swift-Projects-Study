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
       //list와 id값을 인자로 lambda식으로 데이터 값에 맞추어 View를 리턴
        List(self.carMaker, id: \.name){ carMaker in
//            Text(carMaker.name)
            //각 Row에 CarMakerCell를 리턴
            CarMakerCell(carMaker: carMaker)
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

	
