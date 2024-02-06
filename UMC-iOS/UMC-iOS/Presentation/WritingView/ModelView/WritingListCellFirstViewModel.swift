//
//  WritingListCellFirstViewModel.swift
//  UMC-iOS
//
//  Created by 나예은 on 2024/02/05.
//


import SwiftUI
import UIKit

class WritingListCellFirstViewModel: ObservableObject {
    @Published var selectedFileURL: URL?

    func presentFilePicker() {
        let picker = UIImagePickerController()
        picker.delegate = context
        picker.sourceType = .photoLibrary
        picker.mediaTypes = ["public.image", "public.audio", "public.movie", "public.text", "public.pdf"]

        UIApplication.shared.windows.first?.rootViewController?.present(picker, animated: true, completion: nil)
    }

    private lazy var context: Context = {
        Context(viewModel: self)
    }()

    class Context: NSObject, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
        var viewModel: WritingListCellFirstViewModel

        init(viewModel: WritingListCellFirstViewModel) {
            self.viewModel = viewModel
        }

        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
            if let url = info[.imageURL] as? URL {
                viewModel.selectedFileURL = url
            } else if let url = info[.mediaURL] as? URL {
                viewModel.selectedFileURL = url
            }

            picker.dismiss(animated: true, completion: nil)
        }

        func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
            picker.dismiss(animated: true, completion: nil)
        }
    }
}
