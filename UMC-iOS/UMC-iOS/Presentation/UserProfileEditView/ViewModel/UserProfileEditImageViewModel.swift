//
//  UserProfileEditViewModel.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI
import UIKit

class UserProfileEditImageViewModel: ObservableObject {
    @Published var selectedImage: UIImage?

    func pickImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context
    }
    
    private class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: UserProfileEditImageViewModel

        init(parent: UserProfileEditImageViewModel) {
            self.parent = parent
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let pickedImage = info[.originalImage] as? UIImage {
                parent.selectedImage = pickedImage
            }
            picker.dismiss(animated: true, completion: nil)
        }
    }
    

    private lazy var context: Coordinator = {
        return Coordinator(parent: self)
    }()
}



