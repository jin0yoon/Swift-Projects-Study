//
//  HelperFuncs.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/22.
//

import Foundation
import SwiftUI
import Combine
import Firebase
import FirebaseStorage

extension GlobalEnvironment{
    
    //maintain who is logged in
    func save_UserDefaults(){
        
        let data_Dictionary:[String:Any?] = [
            "lastLogin_user":currentUser,
//            "lastLogin_username":currentUser.username,
//            "lastLogin_password":currentUser.password,
        ]

        let save_UserDefaults = UserDefaults.standard
        
        do{
            
            let sessionData = try
                NSKeyedArchiver.archivedData(withRootObject: data_Dictionary, requiringSecureCoding: false)
            save_UserDefaults.set(sessionData, forKey: "lastLogin_objects")
            print("saved successful")
        }catch{
            print("could't write file")
    }
    
}
    
    func initializeListener_currentUser(){
        Firestore.firestore().document("users/\(self.currentUser.establishedID)")
            .addSnapshotListener { querySnapshot, error in
                guard let document = querySnapshot else {
                    print("Error fetching documents: \(error!)")
                    return
                }
                
                print("new information found with listener")
                print("\(document.documentID) => \(document.data())")
                if let thisData = document.data() {
                    
                    self.currentUser = user.init(
                        username: thisData["username"] as? String ?? "",
                        password: thisData["password"] as? String ?? "",
                        name: thisData["name"] as? String ?? "",
                        email: thisData["email"] as? String ?? "",
                        publishedRecipes: thisData["publishedRecipes"] as? [String] ?? [],
                        document.documentID
                    )
                    
                    self.save_UserDefaults()
                }
                
                
                
        }
    }

}

//hide keyboard
extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

func fraction_progress(lowerLimit: Double = 0, upperLimit:Double, current:Double, inverted:Bool = false) -> Double{
    var val:Double = 0
    if current >= upperLimit {
        val = 1
    } else if current <= lowerLimit {
        val = 0
    } else {
        val = (current - lowerLimit)/(upperLimit - lowerLimit)
    }
    
    if inverted {
        return (1 - val)
        
    } else {
        return val
    }
    
}

enum DragState {
    case inactive
    case dragging(translation: CGSize)
    
    var translation: CGSize {
        switch self {
        case .inactive:
            return .zero
        case .dragging(let translation):
            return translation
        }
    }
    
    var isDragging: Bool {
        switch self {
        case .inactive:
            return false
        case .dragging:
            return true
        }
    }
}

extension Double{
    var stringWithoutZeroFraction: String{
        return truncatingRemainder(dividingBy: 1) == 0 ? String(format: "%.0f", self) : String(self)
    }
}

//funtion to submit data
func firestoreSubmit_data(docRef_string:String, dataToSave:[String:Any], completion: @escaping (Any) -> Void, showDetails: Bool = false){
    
    let docRef = Firestore.firestore().document(docRef_string)
    print("setting data")
    docRef.setData(dataToSave){ (error) in
        if let error = error {
            print("error = \(error)")
            
        }else{
            print("data uploaded successfully")
            if showDetails{
                print("dataUploaded = \(dataToSave)")
            }
            completion(true)
        }
    }
}

func firestoreUpdate_data(docRef_string:String, dataToUpdate:[String:Any], completion: @escaping (Any) -> Void, showDetails: Bool = false){
    
    let docRef = Firestore.firestore().document(docRef_string)
    print("updating data")
    docRef.setData(dataToUpdate, merge: true){ (error) in
        if let error = error {
            print("error = \(error)")
            
        }else{
            print("data uploaded successfully")
            if showDetails{
                print("dataUploaded = \(dataToUpdate)")
            }
            completion(true)
        }
    }
}


func uploadImage(_ referenceString:String, image:UIImage, completion: @escaping (Any) -> Void, showDetails: Bool = false){
    if let imageData = image.jpegData(compressionQuality: 1){
        let storage = Storage.storage()
        storage.reference().child(referenceString).putData(imageData, metadata: nil){
            (strgMtdta, err) in
            
            if let err = err {
                print("an error has occurred - \(err.localizedDescription)")
                
            } else {
                print("image uploaded successfully")
                completion(true)
            }
        }
    } else {
        print("couldn't unwrap image as data")
    }
    
    
}

//Need to add this function for step and ingredient
extension Array where Element == Step{
    func formatForFirebase() -> [[String:Any]] {
        var returnVal: [[String:Any]] = []
        for element in self {
            returnVal.append(element.dictionary)
        }
        
        return returnVal
    }
}

extension Array where Element == Ingredient{
    func formatForFirebase() -> [[String:Any]] {
        var returnVal: [[String:Any]] = []
        for element in self {
            returnVal.append(element.dictionary)
        }
        
        return returnVal
    }
}
