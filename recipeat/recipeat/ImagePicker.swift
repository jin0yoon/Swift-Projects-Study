//
//  ImagePicker.swift
//  recipeat
//
//  Created by 윤진영 on 2020/10/23.
//

import Foundation
import SwiftUI

//----------- imagePicker - UIViewControllerRepresentable


struct imagePicker:UIViewControllerRepresentable {
    @Binding var image: UIImage?
    
    typealias UIViewControllerType = UIImagePickerController
    typealias Coordinator = imagePickerCoordinator
    
    var sourceType:UIImagePickerController.SourceType = .camera
    
    
    func makeUIViewController(context: UIViewControllerRepresentableContext<imagePicker>) -> UIImagePickerController {
        let picker = UIImagePickerController()
        picker.sourceType = sourceType
        picker.delegate = context.coordinator
        return picker
    }
    
    
    func makeCoordinator() -> imagePicker.Coordinator {
        return imagePickerCoordinator(image: $image)
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>) {
        
    }
    
}


//------------------ COORDINATOR
class imagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var image: UIImage?
    init(image:Binding<UIImage?>) {
        _image = image
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            image = uiimage
        }
    }
}
