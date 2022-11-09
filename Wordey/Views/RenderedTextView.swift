//
//  RenderedTextView.swift
//  Wordey
//
//  Created by AlecNipp on 10/10/22.
//

import SwiftUI

struct RenderedTextView: View {
    let model: WordeyData
    private var renderedText: AttributedString {
        do {
            let rendered = try AttributedString(
                markdown: model.rawText)
            return rendered
        } catch {
            return "Couldn't parse markdown!"
        }
    }
    
    var body: some View {
        var out = Text(renderedText)
        out = out.font(.system(size: model.fontSize))
        out = out.foregroundColor(model.textColor.getColor())
        if model.isBold {
            out = out.bold()
        }
        if model.isItalicized {
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
