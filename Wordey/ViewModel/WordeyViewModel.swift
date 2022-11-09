//
//  WordeyViewModel.swift
//  Wordey
//
//  Created by AlecNipp on 11/8/22.
//

import Foundation

class WordeyViewModel: ObservableObject {
    @Published var model: WordeyData = WordeyData.example
    @Published var presets = [WordeyData]()
    
    func savePreset() -> Void {
        presets.append(model)
    }
    
    
}
