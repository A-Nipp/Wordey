//
//  ContentView.swift
//  Wordey
//
//  Created by AlecNipp on 10/7/22.
//

import SwiftUI

struct ContentView: View {
    @State private var rawText: String = "**Hi**"
    @State private var isBold: Bool = false
    @State private var isItalicized: Bool = false
    @State private var textColor: FontColor = .black
    @State private var textAlignment: HorizontalAlignment = .center
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.3)
                .ignoresSafeArea()
            VStack(spacing: 10) {
                Text("Wordey")
                    .font(.largeTitle)
                    .bold()
                    .padding()
                VStack {
                    RenderedTextView(rawText: rawText, fontColor: textColor, isBold: isBold, isItalicized: isItalicized)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                }
                .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
                Spacer()
                VStack(alignment: .leading) {
                    Text("Text Entry")
                        .font(.subheadline)
                    TextEditor(text: $rawText)
                }
                
                Spacer()
                TextOptionsView(isBold: $isBold, isItalicized: $isItalicized, textColor: $textColor)
                
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
    
}

struct RenderedTextView: View {
    let rawText: String
    let fontColor: FontColor
    let isBold: Bool
    let isItalicized: Bool
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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextOptionsView: View {
    @Binding var isBold: Bool
    @Binding var isItalicized: Bool
    @Binding var textColor: FontColor
    var body: some View {
        VStack(alignment: .leading) {
            Text("Options")
                .font(.subheadline)
            VStack {
                Toggle(isOn: $isBold) {
                    Text("Bold")
                }
                Toggle(isOn: $isItalicized) {
                    Text("Italics")
                }
                Divider()
                Picker("Please choose a color", selection: $textColor) {
                    ForEach(FontColor.allCases, id: \.self) {
                        Text($0.stringValue)
                    }
                }
                .pickerStyle(.segmented)
            }
            .padding()
            .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
            
        }
    }
}

enum FontColor: CaseIterable {
    case white, black, blue, green
    func getColor() -> Color {
        switch self {
        case .white:
            return Color.white
        case .black:
            return Color.black
        case .blue:
            return Color.blue
        case .green:
            return Color.green
        }
    }
    
    var stringValue: String {
        switch self {
        case .white:
            return "White"
        case .black:
            return "Black"
        case .blue:
            return "Blue"
        case .green:
            return "Green"
        }
    }
    
}
