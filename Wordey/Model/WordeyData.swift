//
//  WordeyPreset.swift
//  Wordey
//
//  Created by AlecNipp on 11/8/22.
//

import Foundation

struct WordeyData: Identifiable {
    let id = UUID()
    var presetName: String // The name of this preset (e.g. "Green italics")
    var rawText: String
    var isBold: Bool
    var isItalicized: Bool
    var textColor: FontColor
    var hAlignment: HorizontalTextAlignment = .center
    var vAlignment: VerticalTextAlignment = .center
    var fontSize: CGFloat = 16
}

extension WordeyData {
    static var example: WordeyData {
        WordeyData(presetName: "Example preset", rawText: "Example", isBold: false, isItalicized: true, textColor: .green, hAlignment: .center, vAlignment: .top)
    }
}
