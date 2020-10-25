//
//  NewPostView.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/22.
//

import SwiftUI

struct NewPostView: View {
    
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State private var image:UIImage?
    
    @State var halfModal_shown = false
    
    @State var halfModal_title = ""
    @State var halfModal_textField_placeholder = ""
    @State var halfModal_textField_val = ""
    
    //Sample Data
    var steps: [Step] = [
//        Step(description: "add eggs", orderNumber: 0),
//        Step(description: "add eggs", orderNumber: 1),
//        Step(description: "add eggs", orderNumber: 2),
//        Step(description: "add eggs", orderNumber: 3),
//        Step(description: "add eggs", orderNumber: 4),
//        Step(description: "add eggs", orderNumber: 5),
//        Step(description: "add eggs", orderNumber: 6),
//        Step(description: "add eggs", orderNumber: 7)
    ]
    var ingredients: [Ingredient] = [
//        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 0),
//        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 1),
//        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 2),
//        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 3),
//        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 4),
//        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 5),
//        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 6),
//        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 7),
//        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 8),
//        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 9),
//        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 10),
//        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 11),
//        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 12),
//        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 13),
//        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 14),
//        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 15),
//        Ingredient(name: "eggs", amount: 3, amountUnit: .whole, orderNumber: 14),
//        Ingredient(name: "parsley", amount: 2, amountUnit: .whole, orderNumber: 15)
    ]
    
    var body: some View {
        ZStack {
            VStack{
                Spacer().frame(height:65)
                ZStack{
                    HStack{
                        if image != nil {
                            Image(uiImage: image!)
                                .resizable()
                                .scaledToFit()
                                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)
                                .background(Color.black)
                        } else {
                            Image(systemName:"camera")
                                .resizable()
                                .scaledToFit()
                                .padding(130)
                                .frame(width: UIScreen.main.bounds.size.width, height: UIScreen.main.bounds.size.width)
                                .background(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                        }
                        
                    }
                    VStack{
                        HStack{
                            Spacer()
                            
                            Button(action: {
                                self.showSheet.toggle()
                            }) {
                                ZStack {
                                    
                                    Image(systemName: "plus.circle")
                                        .foregroundColor(.black)
                                    Image(systemName: "plus.circle.fill")
                                        .foregroundColor(.white)
                                }
                                .font(.system(size:30))
                                .foregroundColor(.white)
                                .shadow(radius: 4)
                                .opacity(0.7)
                                .padding()
                                
                            }.actionSheet(isPresented: $showSheet){
                                ActionSheet(title: Text("Add a picture to your post"), message: nil, buttons: [
                                    .default(Text("Camera"), action: {
                                        self.showImagePicker = true
                                        self.sourceType = .camera
                                    }),
                                    .default(Text("Photo Library"), action: {
                                        self.showImagePicker = true
                                        self.sourceType = .photoLibrary
                                    }),
                                    .cancel()
                                
                                ])
                            }
                            
                        }
                        Spacer()
                        
                    }
                }
                HStack{
                    //Ingredients
                        VStack {
                            Text("Ingredients").font(.headline)
                            ScrollView{
                                HStack {
                                    VStack(alignment: .leading){
                                        
                                        if ingredients.count > 0 {
                                            ForEach(ingredients, id: \.id){ thisIngredient in
                                                
                                                Text("\(thisIngredient.amount) \(thisIngredient.name)")
                                                
                                            }.foregroundColor(.init(red: 108/255, green: 204/255, blue: 108/255))
                                        } else{
                                            Button(action: {
                                                self.halfModal_title = "ADD AN INGREDIENT"
                                                self.halfModal_textField_placeholder = "Enter new Ingredient"
                                                self.halfModal_shown = true
                                            }, label: {
                                                Text("Add some ingredients").padding().foregroundColor(.gray)
                                            })
                                        }
                                        
                                        
                                    }.padding()
                                    Spacer()
                                }
                                
                                
                            }.frame(width: UIScreen.main.bounds.size.width/2)
                            .clipped()
                            Button(action: {
                                self.halfModal_title = "ADD AN INGREDIENT"
                                self.halfModal_textField_placeholder = "Enter new Ingredient"
                                self.halfModal_shown = true
                            }, label: {
                                Text("Add New").padding().font(.headline)
                            })
                            
                        }.background(Color.clear)
                       
                        
                    
                    
                    //Steps
                        VStack {
                            Text("Steps").font(.headline)
                            ScrollView{
                                HStack {
                                    VStack(alignment: .leading){
                                        if steps.count > 0 {
                                            ForEach(steps, id: \.id){ thisStep in
                                                Text("\(thisStep.description)")
                                                
                                            }.foregroundColor(.init(red: 108/255, green: 172/255, blue: 204/255))
                                        } else{
                                            Button(action: {
                                                self.halfModal_title = "ADD A STEP"
                                                self.halfModal_textField_placeholder = "Enter new step"
                                                self.halfModal_shown = true
                                            }, label: {
                                                Text("Add some steps").padding().foregroundColor(.gray)
                                            })
                                        }
                                        
                                    }.padding()
                                    Spacer()
                                }
                            }.frame(width: UIScreen.main.bounds.size.width/2)
                            .clipped()
                            Button(action: {
                                self.halfModal_title = "ADD A STEP"
                                self.halfModal_textField_placeholder = "Enter new step"
                                self.halfModal_shown = true
                            }, label: {
                                Text("Add New").padding().font(.headline)
                            })
                        }.background(Color.clear)
                        
                        
                    
                    
                }
                Spacer().frame(height:65)
            }
            .navigationBarTitle("").navigationBarHidden(true)
            .sheet(isPresented: $showImagePicker){
                VStack{
                    ScrollView(.horizontal) {
                        HStack{
                            ForEach(0..<8){_ in
                                Rectangle().frame(width:200, height: 200)
                                    .background(Color.red)
                            }
                        }.padding()
                    }.frame(height:240)
                    .background(Color.blue)
                    
                    imagePicker(image: self.$image, sourceType: self.sourceType)
                }
                
        }
            
            HalfModalView(isShown: $halfModal_shown, modalHeight: 300){
                VStack{
                    Spacer().frame(height:15)
                    Text("\(self.halfModal_title)").font(.headline)
                    TextField("\(self.halfModal_textField_placeholder)", text: self.$halfModal_textField_val)
                        .padding(10)
                        .background(
                            Rectangle()
                                .cornerRadius(10)
                                .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                        )
                        .padding(20)
                    
                    Image(systemName: "plus.circle.fill")
                        .font(.system(size: 35))
                        .foregroundColor(.init(red: 110/255, green: 210/255, blue: 110/255))
                    Spacer()
                }
            }
        }
        
    }
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}



