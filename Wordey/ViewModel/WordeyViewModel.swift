//
//  WordeyViewModel.swift
//  Wordey
//
//  Created by AlecNipp on 11/8/22.
//

import Foundation

class WordeyViewModel: ObservableObject {
    @Published var model: WordeyData = WordeyData.example
    var presets = [WordeyPreset]()
    
    func savePreset() -> Void {
        presets.append(WordeyPreset(data: model))
    }
    func setPreset(newPreset: WordeyPreset) -> Void {
        model = newPreset.data
    }
    
    
}
