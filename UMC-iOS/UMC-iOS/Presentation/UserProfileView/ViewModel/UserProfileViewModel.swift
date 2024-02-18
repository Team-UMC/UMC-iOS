//
//  UserProfileViewModel.swift
//  BulletinBoard
//
//  Created by 나예은 on 2024/02/06.
//

import SwiftUI
import UIKit

class UserProfileViewModel: ObservableObject {
    @Published var userNickname: String = ""
    @Published var userName: String = ""
    @Published var message: String = ""
    @Published var selectedImage: UIImage?
    
    @Published var member = Member()

    // Image selection
    func pickImage() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = context
    }
    
    private class Coordinator: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var parent: UserProfileViewModel

        init(parent: UserProfileViewModel) {
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

extension UserProfileViewModel {
    
    
    
}
