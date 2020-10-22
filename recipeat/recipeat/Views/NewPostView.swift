//
//  NewPostView.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/22.
//

import SwiftUI

struct NewPostView: View {
    
    var steps: [Step] = [
        Step(description: "add eggs", orderNumber: 0),
        Step(description: "add eggs", orderNumber: 1),
        Step(description: "add eggs", orderNumber: 2),
        Step(description: "add eggs", orderNumber: 3),
        Step(description: "add eggs", orderNumber: 4),
        Step(description: "add eggs", orderNumber: 5),
        Step(description: "add eggs", orderNumber: 6),
        Step(description: "add eggs", orderNumber: 7)
    ]
    var ingredients: [Ingredient] = [
        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 0),
        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 1),
        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 2),
        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 3),
        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 4),
        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 5),
        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 6),
        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 7),
        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 8),
        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 9),
        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 10),
        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 11),
        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 12),
        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 13),
        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 14),
        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 15),
        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 14),
        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 15)
    ]
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: "timeLapse")
                    .resizable()
                    .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)
                    .scaledToFit()
                    .background(Color.blue)
            }
            
            HStack{
                VStack {
                    Text("Ingredients")
                    ScrollView{
                        HStack {
                            VStack(alignment: .leading){
                                ForEach(ingredients, id: \.id){ thisIngredient in
                                    
                                    Text("\(thisIngredient.amount) \(thisIngredient.name)")
                                    
                                }
                            }.padding()
                            Spacer()
                        }
                        
                        
                    }.frame(width: UIScreen.main.bounds.size.width/2).clipped()
                }.background(Color.yellow)
                
                VStack {
                    Text("Steps")
                    ScrollView{
                        HStack {
                            VStack(alignment: .leading){
                                ForEach(steps, id: \.id){ thisStep in
                                    Text("\(thisStep.description)")
                                    
                                }
                            }.padding()
                            Spacer()
                        }
                    }.frame(width: UIScreen.main.bounds.size.width/2).clipped()
                }.background(Color.green)
                
                
            }
        }
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}
