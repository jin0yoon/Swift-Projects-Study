//
//  CarMakerCell.swift
//  SwiftUICar
//
//  Created by 윤진영 on 2020/10/06.
//

import SwiftUI

struct CarMakerCell: View {
    
    let carMaker: CarMaker
    
    var body: some View {
        HStack{
            Image(carMaker.imageUrl)
                .resizable()
                .frame(width: 100, height: 100)
                .cornerRadius(16)
            
            VStack(alignment: .leading){
                Text(carMaker.name).font(.largeTitle)
                Text("\(carMaker.numberOfStore) 지점")
            }
        }
    }
}

