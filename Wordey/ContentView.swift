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
    @State private var textColor: Color = .primary
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
                    RenderedTextView(rawText: rawText)
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
                TextOptionsView(isBold: $isBold, textColor: $textColor)
                
            }
            .padding(.horizontal)
            .padding(.bottom, 20)
        }
    }
    
}

struct RenderedTextView: View {
    let rawText: String
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
    @Binding var textColor: Color
    var body: some View {
        VStack(alignment: .leading) {
            Text("Options")
                .font(.subheadline)
            VStack {
                Toggle(isOn: $isBold) {
                    Text("Hi")
                }
                Divider()
                Toggle(isOn: $isBold) {
                    Text("Hellow")
                }
            }
            .padding()
            .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
            
        }
    }
}
