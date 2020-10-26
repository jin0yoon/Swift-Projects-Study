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
    @Binding var images: [UIImage]
    
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
        return imagePickerCoordinator(images: $images)
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: UIViewControllerRepresentableContext<imagePicker>) {
        
    }
    
}


//------------------ COORDINATOR
class imagePickerCoordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @Binding var images: [UIImage]
    init(images:Binding<[UIImage]>) {
        _images = images
    }
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        if let uiimage = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            images.append(uiimage)
        }
    }
}
