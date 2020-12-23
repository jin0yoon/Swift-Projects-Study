//
//  NewPostView.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/22.
//

import SwiftUI
import SPAlert



enum new_StepOrIngredient {
    case Step, Ingredient
}

struct NewPostView: View {
    
    @EnvironmentObject var env: GlobalEnvironment
    
    @State var show_reviewSheet = false
    @State var showSheet = false
    @State var showImagePicker = false
    @State var sourceType:UIImagePickerController.SourceType = .camera
    @State private var images:[Identifiable_UIImage] = []
    
    @State var halfModal_shown = false
    
    @State var halfModal_title = ""
    @State var halfModal_textField_placeholder = ""
    @State var halfModal_textField1_val = ""
    @State var halfModal_textField2_val = ""
    @State var halfModal_height:CGFloat = 380
    
    
    @State var newItem_type:new_StepOrIngredient = .Step
    @State var ingredientUnit_index = 0
    
    @State var newRecipe_title = ""
    //Sample Data
    @State var steps: [Step] = [

    ]
    @State var ingredients: [Ingredient] = [

    ]
    
    var body: some View {
        ZStack {
            VStack(spacing:0){
                Spacer().frame(height:65)
                ZStack{
                        HStack(spacing:0){
                            if images.count > 0 {
                                ScrollView(.horizontal) {
                                    HStack(spacing:0){
                                        ForEach(self.images, id: \.id){ i in
                                            
                                            Image(uiImage: i.image)
                                                .resizable()
                                                .scaledToFit()
                                                .frame(width: UIScreen.main.bounds.size.width, height: 300)
                                        }
                                    }.background(Color.black)
                                }.background(Color.black)
                
                                
                            } else {
                                Button(action: {
                                    self.showSheet.toggle()
                                }) {
                                    //Icons made by <a href="https://www.flaticon.com/authors/good-ware" title="Good Ware">Good Ware</a> from <a href="https://www.flaticon.com/" title="Flaticon"> www.flaticon.com</a>
                                    Image("pasta_icon")
                                        .renderingMode(.original)
                                        .resizable()
                                        .scaledToFit()
                                        .padding(50)
                                        .frame(width: UIScreen.main.bounds.size.width, height: 300)
                                        .background(Color.init(red: 1, green: 1, blue: 1))
                                }
                                
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
                                        self.sourceType = .savedPhotosAlbum
                                    }),
                                    .cancel()
                                
                                ])
                            }
                            
                        }
                        Spacer()
                        
                    }.frame(height:300)
                }
                
                VStack{
                    HStack(spacing:0){
                        //Ingredients
                            VStack {
                                Text("INGREDIENTS")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .padding(10)
                                    .background(darkBlue)
                                    .foregroundColor(.white)
                                ScrollView{
                                    HStack {
                                        VStack(alignment: .leading){
                                            
                                            if ingredients.count > 0 {
                                                ForEach(ingredients, id: \.id){ thisIngredient in
                                                    
                                                    Text("\(thisIngredient.amount.stringWithoutZeroFraction) \(thisIngredient.amountUnit.rawValue) \(thisIngredient.name)")
                                                        .padding(5).padding(.leading, 3).padding(.trailing, 3)
                                                        .background(Color.init(red: 0.85, green: 0.85, blue: 0.85))
                                                        .padding(.bottom, 4)
                                                    .cornerRadius(5)
                                                    
                                                }.foregroundColor(.init(red: 0.3, green: 0.3, blue: 0.3))
                                            } else{
                                                Button(action: {
                                                    self.update_halfModal(title: "ADD AN INGREDIENT", placeholder: "Enter new ingredient", itemType: .Ingredient, height: 470)
                                                    self.halfModal_shown = true
                                                }, label: {
                                                    Text("Add some ingredients").padding().foregroundColor(.gray)
                                                        .multilineTextAlignment(.center)
                                                        .frame(maxWidth: .infinity)
                                                })
                                            }
                                            
                                            
                                        }.padding(5)
                                        Spacer()
                                    }
                                    
                                    
                                }.frame(width: UIScreen.main.bounds.size.width/2)
                                .clipped()
                                Button(action: {
                                    self.update_halfModal(title: "ADD AN INGREDIENT", placeholder: "Enter new ingredient", itemType: .Ingredient, height: 470)
                                    self.halfModal_shown = true
                                }, label: {
                                    Text("+ INGREDIENT")
                                        .padding()
                                        .font(.system(size:12, weight:.bold))
                                        .foregroundColor(.white)
                                        .frame(height:24)
                                        .background(mediumBlue)
                                        .cornerRadius(12)
                                        .padding(.bottom, 8)
                                })
                                
                            }.background(Color.clear)
                           
                            
                        
                        
                        //Steps
                            VStack {
                                Text("STEPS")
                                    .font(.headline)
                                    .frame(maxWidth: .infinity)
                                    .padding(10)
                                    .background(darkBlue)
                                    .foregroundColor(.white)
                                ScrollView{
                                    HStack {
                                        VStack(alignment: .leading){
                                            if steps.count > 0 {
                                                ForEach(steps, id: \.id){ thisStep in
                                                    Text("\(thisStep.orderNumber + 1)." + thisStep.description)
                                                        .padding(5).padding(.leading, 3).padding(.trailing, 3)
                                                        .background(Color.init(red: 0.85, green: 0.85, blue: 0.85))
                                                        .padding(.bottom, 4)
                                                    .cornerRadius(5)
                                                    
                                                }.foregroundColor(.init(red: 0.3, green: 0.3, blue: 0.3))
                                            } else{
                                                Button(action: {
                                                    self.update_halfModal(title: "ADD A STEP", placeholder: "Enter new step", itemType: .Step, height: 380)
                                                    self.halfModal_shown = true
                                                }, label: {
                                                    Text("Add some steps").padding().foregroundColor(.gray)
                                                        .multilineTextAlignment(.center)
                                                        .frame(maxWidth: .infinity)
                                                })
                                            }
                                            
                                        }.padding(5)
                                        Spacer()
                                    }
                                }.frame(width: UIScreen.main.bounds.size.width/2)
                                .clipped()
                                Button(action: {
                                    self.update_halfModal(title: "ADD A STEP", placeholder: "Enter new step", itemType: .Step, height: 380)
                                    self.halfModal_shown = true
                                }, label: {
                                    Text("+ STEP")
                                    .padding()
                                    .font(.system(size:12, weight:.bold))
                                    .foregroundColor(.white)
                                    .frame(height:24)
                                    .background(mediumBlue)
                                    .cornerRadius(12)
                                    .padding(.bottom, 8)
                                })
                            }.background(Color.clear)
                            
                            
                        
                        
                    }
                    
                    Button(action: {
                        self.show_reviewSheet = true
//                        self.submitRecipe()
                    }) {
                        Text("SUBMIT RECIPE")
                            .font(.headline)
                            .foregroundColor(.white)
                            .padding(20)
                            .frame(height:48)
                            .frame(maxWidth: .infinity)
                            .background(vDarkBlue)
                            .shadow(radius: 3)
                            .padding(.top, 10)
                    }
                    
                    //TabBar space
                    Spacer().frame(height:65)
                }.background(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                
            }
            .navigationBarTitle("").navigationBarHidden(true)
            .sheet(isPresented: $showImagePicker){
                VStack(spacing:0){
                    if self.images.count > 0{
                        ScrollView(.horizontal) {
                            HStack{
                                ForEach(self.images, id: \.id){ i in
                                    
                                    Image(uiImage: i.image)
                                        .resizable()
                                        .frame(width:200)
                                        .scaledToFit()
                                        .shadow(radius:3)
                                }
                            }.padding()
                        }
                        .frame(height:240)
                        .background(Color.white)
                    }else{
                        HStack{
                            Spacer()
                            Text("Please select an image from below")
                            Spacer()
                        }.frame(height:240)
                        .background(Color.white)
                    }
                    
                    
                    HStack{
                        Button(action: {self.showImagePicker.toggle()}){
                            Text("DONE")
                                .padding()
                                .font(.system(size:12, weight:.bold))
                                .foregroundColor(.white)
                                .frame(height:24)
                                .background(mediumBlue)
                                .cornerRadius(12)
                                
                            
                        }
                    }.frame(height:57).frame(maxWidth: .infinity).background(Color.white)
                    .zIndex(1)
                    
                    imagePicker(images: self.$images, sourceType: self.sourceType).offset(y: -57)
                }
                
        }
            .sheet(isPresented: $show_reviewSheet, content: {
                ModifyRecipePost(recipeTitle: self.$newRecipe_title)
            })
            
            HalfModalView(isShown: $halfModal_shown, modalHeight: halfModal_height){
                
                VStack{
                    Spacer().frame(height:15)
                    Text("\(self.halfModal_title)").font(.headline)
                    VStack {
                        HStack {
                            if self.newItem_type == .Ingredient{
                                TextField("#", text: self.$halfModal_textField1_val)
                                    .frame(width: 40)
                                    .padding(10)
                                    .background(
                                        Rectangle()
                                            .cornerRadius(10)
                                            .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                                    )
                                    .padding(20)
                                    .keyboardType(.numberPad)
                            }
                            
                            
                            TextField("\(self.halfModal_textField_placeholder)", text: self.$halfModal_textField2_val)
                                .padding(10)
                                .background(
                                    Rectangle()
                                        .cornerRadius(10)
                                        .foregroundColor(Color.init(red: 0.95, green: 0.95, blue: 0.95))
                                )
                                .padding(20)
                        }
                        
                        if self.newItem_type == .Ingredient{
                            Picker(selection: self.$ingredientUnit_index, label: Text("Unit")) {
                                ForEach(0..<IngredientUnit.allCases.count){
                                    Text(IngredientUnit.allCases[$0].rawValue).tag($0)
                                }
                            }
                            .labelsHidden()
                            .frame(height: 90)
                            .clipped()
                            .padding()
                        }
                    }
                    
                    
                    Button(action: {
                        self.add_newItem()
                    }) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 35))
                            .foregroundColor(.init(red: 110/255, green: 210/255, blue: 110/255))
                    }
                    
                    Spacer()
                }
            }
        }
        
    }
    
    func update_halfModal(title:String, placeholder:String, itemType:new_StepOrIngredient, height:CGFloat){
        halfModal_textField1_val = ""
        halfModal_textField2_val = ""
        halfModal_title = title
        halfModal_textField_placeholder = placeholder
        newItem_type = itemType
        halfModal_height = height
        
    }
    
    func possible_stringToDouble(_ stringToValidate:String) -> Double? {
        let val:Double? = Double(stringToValidate) ?? nil
        
        if let val = val{
            return val
        }else{
            return nil
        }
    }
    
    func hideModal() {
        UIApplication.shared.endEditing()
        halfModal_shown = false
    }
    
    func add_newItem(){
        if halfModal_textField2_val == "" {
            let alertView = SPAlertView(title: newItem_type == .Step ? "Please add a step" : "Please add an Ingredient", message: "Make sure no textfields are left blank", preset: SPAlertPreset.error)
            alertView.duration = 3
            alertView.present()
        }else{
            if newItem_type == .Step {
                steps.append(Step(description: halfModal_textField2_val, orderNumber: steps.count))
                hideModal()
            }else if newItem_type == .Ingredient{
                
                if let amount = possible_stringToDouble(halfModal_textField1_val){
                    let thisIngredientUnit = IngredientUnit.allCases[ingredientUnit_index]
                    
                    ingredients.append(Ingredient(name: halfModal_textField2_val,
                                                  amount: amount,
                                                  amountUnit: thisIngredientUnit,
                                                  orderNumber: ingredients.count))
                    
                    hideModal()
                }else{
                    let alertView = SPAlertView(title: "Check the amount", message: "Please enter a number (i.e. \"1\" or \"3.4\")", preset: SPAlertPreset.error)
                    alertView.duration = 3
                    alertView.present()
                }
                
                
            }
        }
        
        
    }
    
    func clearPage(){
        images.removeAll()
        halfModal_textField1_val = ""
        halfModal_textField2_val = ""
        ingredients = []
        steps = []
    }
    
    func submitRecipe(){
        var actionsToComplete = 2 + self.images.count
        var actionsCompleted = 0
        
        func check_success(){
            print("\(actionsCompleted)/\(actionsToComplete)")
            if actionsCompleted == actionsToComplete {
                //Add a function to clear all the data on this page
                let alertView = SPAlertView(title: "Recipe Submitted", message: "Recipe submitted successfully!", preset: SPAlertPreset.done)
                alertView.duration = 3
                alertView.present()
                self.clearPage()
            }
        }
        
        if images.count > 0 {
            let thisRecipePost = RecipePost(title: self.newRecipe_title,
                                            steps: self.steps,
                                            ingredients: self.ingredients,
                                            postingUser: self.env.currentUser.establishedID,
                                            description: "",
                                            numberOfLikes: 0,
                                            image: Image(uiImage: images[0].image)
                
            )
            
            print(thisRecipePost.dictionary)
            
            self.env.currentUser.publishedRecipes.append(thisRecipePost.id.uuidString)
            firestoreSubmit_data(docRef_string: "recipe/\(thisRecipePost.id)", dataToSave: thisRecipePost.dictionary, completion: {_ in
                actionsCompleted += 1
                check_success()
            })
            firestoreUpdate_data(docRef_string: "users/\(self.env.currentUser.establishedID)", dataToUpdate: ["publishedRecipes": self.env.currentUser.publishedRecipes], completion: {_ in
                actionsCompleted += 1
                check_success()
            })
            for i in 0...self.images.count-1{
                let image = self.images[i].image
                uploadImage("recipe_\(thisRecipePost.id)_\(i)", image: image, completion: {_ in
                    actionsCompleted += 1
                    check_success()
                })
            }
            
            
        } else {
            let alertView = SPAlertView(title: "Add a photo", message: "You cannot submit a recipe without a photo", preset: SPAlertPreset.error)
            alertView.duration = 3
            alertView.present()
        }
    }
   
}

struct NewPostView_Previews: PreviewProvider {
    static var previews: some View {
        NewPostView()
    }
}



