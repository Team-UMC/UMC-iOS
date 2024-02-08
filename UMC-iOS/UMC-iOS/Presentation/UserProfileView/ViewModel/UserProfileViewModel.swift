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
    
    
    // GET
    func fetchGetUserProfile(memberId: String) async {
        do {
//            self.
        }
    }
    
    func getUserProfile(memberId: String) async throws -> MemberRequest.GetMemberProfile {
        var urlComponents = ApiEndpoints.getBasicUrlComponents()
        urlComponents.path = ApiEndpoints.Path.members.rawValue
        
        guard let url = urlComponents.url else {
            print("Error: cannot create URL")
            throw ExchangeRateError.cannotCreateURL
        }
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        
        let (data, response) = try await URLSession.shared.data(for: request)
        
        guard let jsonString = String(data: data, encoding: .utf8) else {
            print("Error: Failed to convert data to string")
            throw ExchangeRateError.decodeFailed
        }
        
        if let response = response as? HTTPURLResponse,
           !(200..<300).contains(response.statusCode) {
            throw ExchangeRateError.badResponse
        }
        
        return MemberRequest.GetMemberProfile(id: 1, memberId: "1", profileImage: "1", universityName: "1", name: "!", nickname: "!", semesterParts: [], statusMessage: "1", owner: "1")
        
    }
    
    
    // Update user profile
    func updateUserProfile() {
        guard let url = URL(string: "https://umcservice.shop:8000/members/update") else {
            print("유효하지 않은 URL")
            return
        }

        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")

        let parameters: [String: Any] = [
            "userNickname": userNickname,
            "userName": userName,
            "message": message
        ]

        do {
            let jsonData = try JSONSerialization.data(withJSONObject: parameters, options: [])
            request.httpBody = jsonData

            URLSession.shared.dataTask(with: request) { (data, response, error) in
                if let error = error {
                    print("에러: \(error.localizedDescription)")
                } else if let data = data {
                    print("응답: \(String(data: data, encoding: .utf8) ?? "")")
                }
            }.resume()
        } catch {
            print("매개변수를 JSON으로 변환하는 동안 에러 발생: \(error.localizedDescription)")
        }
    }
}
