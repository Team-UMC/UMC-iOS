//
//  GenerationPartViewModel.swift
//  UMC-iOS
//
//  Created by 이태현 on 1/26/24.
//

import SwiftUI

class GenerationPartViewModel: ObservableObject {
    @Published var items: [GenerationPart] = []
    
    func add(generation: String, part: String) {
        let newItem = GenerationPart(generation: generation, part: part)
        items.append(newItem)
    }
    
    func remove(at offsets: IndexSet) {
        items.remove(atOffsets: offsets)
    }
}
