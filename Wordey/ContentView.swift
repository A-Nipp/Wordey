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
    @State private var hAlignment: HorizontalTextAlignment = .center
    @State private var vAlignment: VerticalTextAlignment = .center
    @State private var fontSize: CGFloat = 16
    
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
                    RenderedTextView(rawText: rawText, fontColor: textColor, isBold: isBold, isItalicized: isItalicized, fontSize: fontSize)
                        .padding()
                        .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: hAlignment.systemAlignment, vertical: vAlignment.systemAlignment))
                }
                .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
                Spacer()
                VStack(alignment: .leading) {
                    Text("Text Entry")
                        .font(.subheadline)
                    TextEditor(text: $rawText)
                }
                
                Spacer()
                TextOptionsView(isBold: $isBold, isItalicized: $isItalicized, textColor: $textColor, vAlignment: $vAlignment, hAlignment: $hAlignment, fontSize: $fontSize)
                
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
    
}

enum HorizontalTextAlignment: String, CaseIterable {
    case leading = "Leading"
    case center = "Center"
    case trailing = "Trailing"
    
    public var systemAlignment: HorizontalAlignment {
        switch self {
        case .leading:
            return .leading
        case .center:
            return .center
        case .trailing:
            return .trailing
        }
    }
}

enum VerticalTextAlignment: String, CaseIterable {
    case top = "Top"
    case center = "Center"
    case bottom = "Bottom"
    
    
    public var systemAlignment: VerticalAlignment {
        switch self {
        case .top:
            return .top
        case .center:
            return .center
        case .bottom:
            return .bottom
        }
    }
}


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
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct TextOptionsView: View {
    @Binding var isBold: Bool
    @Binding var isItalicized: Bool
    @Binding var textColor: FontColor
    @Binding var vAlignment: VerticalTextAlignment
    @Binding var hAlignment: HorizontalTextAlignment
    @Binding var fontSize: CGFloat
    var body: some View {
        VStack(alignment: .leading) {
            Text("Options")
                .font(.subheadline)
            VStack {
                HStack {
                    Toggle(isOn: $isBold) {
                        Text("Bold")
                    }
                    Divider()
                    Toggle(isOn: $isItalicized) {
                        Text("Italics")
                    }
                }
                
                Divider()
                Picker("Please choose a color", selection: $textColor) {
                    ForEach(FontColor.allCases, id: \.self) {
                        Text($0.stringValue)
                    }
                }
                .pickerStyle(.segmented)
                Divider()
                VStack(spacing: 2) {
                    Text("Alignment")
                    HStack {
                        Text("Horizontal")
                            .font(.footnote)
                        Picker("Choose an alignment", selection: $hAlignment) {
                            ForEach(HorizontalTextAlignment.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.menu)
                        Text("Vertical")
                            .font(.footnote)
                        Picker("Choose an alignment", selection: $vAlignment) {
                            ForEach(VerticalTextAlignment.allCases, id: \.self) {
                                Text($0.rawValue)
                            }
                        }
                        .pickerStyle(.automatic)
                    }
                }
                Divider()
                VStack(spacing: 5) {
                    Text("Font Size")
                    Slider(
                        value: $fontSize,
                        in: 1...100,
                        step: 1
                    ) {
                        Text("Font Size")
                    } minimumValueLabel: {
                        Text("0")
                    } maximumValueLabel: {
                        Text("100")
                    }
                }
            }
            .padding()
            .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
            
        }
    }
}

enum FontColor: CaseIterable {
    case black, blue, green, red
    func getColor() -> Color {
        switch self {
        case .red:
            return Color.red
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
        case .red:
            return "Red"
        case .black:
            return "Black"
        case .blue:
            return "Blue"
        case .green:
            return "Green"
        }
    }
    
}
