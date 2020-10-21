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
    
    var body: some View {
        VStack(spacing:0){
            Image("fadeCarousel_2")
                .resizable()
                .scaledToFill()
                .clipped()
                .frame(height:350)
                .frame(minWidth:0, maxWidth:.infinity)
                .background(Color.blue)
                .edgesIgnoringSafeArea(.top)
            
            TextField("Username", text: $username)
                .padding()
                .background(Color.clear)
            TextField("Password", text: $password)
                .padding()
                .background(Color.clear)
            
            Spacer().frame(height:20)
            
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
                }.padding()
            }).background(Color.init(red: 0.85, green: 0.85, blue: 0.85))
            .cornerRadius(10)
            
            Spacer()
            
            Button(action: {
                self.signUp_visible.toggle()
            }, label: {
                Text("Sign up?").padding()
            }).background(Color.clear)
            .foregroundColor(Color.init(red: 0.8, green: 0.8, blue: 0.8))
            .sheet(isPresented: $signUp_visible, content: {
                SignUp()
            })
            
            Spacer()
        }.background(Color.clear)
        
    }
}

struct LoginView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
