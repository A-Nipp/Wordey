//
//  RenderedTextView.swift
//  Wordey
//
//  Created by AlecNipp on 10/10/22.
//

import SwiftUI

struct RenderedTextView: View {
    let rawText: String
    let fontColor: FontColor
    let isBold: Bool
    let isItalicized: Bool
    let fontSize: CGFloat
    private var renderedText: AttributedString {
        do {
            let rendered = try AttributedString(
                markdown: rawText)
            return rendered
        } catch {
            return "Couldn't parse markdown!"
        }
    }
    
    var body: some View {
        var out = Text(renderedText)
        out = out.font(.system(size: fontSize))
        out = out.foregroundColor(fontColor.getColor())
        if isBold {
            out = out.bold()
        }
        if isItalicized {
            out = out.italic()
        }
        return out
        
    }
    
    
}

//struct RenderedTextView_Previews: PreviewProvider {
//    static var previews: some View {
//        RenderedTextView(rawText: , fontColor: <#FontColor#>, isBold: <#Bool#>, isItalicized: <#Bool#>, fontSize: <#CGFloat#>)
//    }
//}
