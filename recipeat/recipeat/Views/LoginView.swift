//
//  LoginView.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/18.
//

import SwiftUI
import Firebase
import SPAlert

struct LoginView: View {
    
    @State private var signUp_visible = false
    
    @State private var username: String = ""
    @State private var password: String = ""
    
    @State private var isLoggedIn = false
    
    var body: some View {
        NavigationView {
            ZStack {
                LinearGradient(gradient: Gradient(colors: [darkBlue, vDarkBlue]), startPoint: .top, endPoint: .bottom).edgesIgnoringSafeArea(.all)
                
                VStack(spacing:0){
                    Image("recipeat_slogan")
                        .resizable()
                        .scaledToFit()
                        .frame(width: UIScreen.main.bounds.size.width/2)
                    
                    TextField("Username", text: $username)
                        .padding()
                        .background(Color.clear)
                        .frame(height: 50)
                        .overlay(
                            Capsule()
                                .stroke(lineWidth: 2)
                                .foregroundColor(.white))
                        .padding()
                    
                    TextField("Password", text: $password)
                        .padding()
                        .background(Color.clear)
                        .frame(height: 50)
                        .overlay(
                            Capsule()
                                .stroke(lineWidth: 2)
                                .foregroundColor(.white))
                        .padding()
                    
                    
                    
                    Button(action: {
                        Firestore.firestore().collection("users").whereField("username", isEqualTo: self.username).getDocuments(){ (querySnapshot, err) in
                            
                            if let err = err{
                                print("Error getting documents: \(err)")
                            }else{
                                if querySnapshot!.documents.count <= 0{
                                    let alertView = SPAlertView(title: "No users found", message: "No users have the username you entered", preset: SPAlertPreset.error)
                                    alertView.duration = 3
                                    alertView.present()
                                }else{
                                    let alertView = SPAlertView(title: "\(querySnapshot!.documents.count) users found", message: "Your login query came back positive", preset: SPAlertPreset.done)
                                    alertView.duration = 3
                                    alertView.present()
                                }
                                for document in querySnapshot!.documents {
                                    print("\(document.documentID) => \(document.data())")
                                }
                            }
                        }
                    }, label: {
                        HStack {
                            Text("Login")
                            Image(systemName: "arrow.right")
                        }.frame(height: 50)
                        .frame(minWidth:0, maxWidth: .infinity)
                        
                    }).background(lightBlue)
                    .cornerRadius(25)
                    
                    Spacer()
                    
                    Text("Don't have an account?").foregroundColor(.white)
                    
                    Button(action: {
                        self.signUp_visible.toggle()
                    }, label: {
                        Text("Sign up?").padding()
                    }).background(Color.clear)
                    .foregroundColor(lightBlue)
                    .sheet(isPresented: $signUp_visible, content: {
                        SignUp()
                    })
                    
                    Spacer()
                }.background(Color.clear)
            }
        }
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
