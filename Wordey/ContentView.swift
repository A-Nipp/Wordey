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
    
    
    var body: some View {
        ZStack {
            Color.gray
                .opacity(0.3)
                .ignoresSafeArea()
            VStack {
                Text("Wordey")
                    .font(.largeTitle)
                VStack {
                        RenderedTextView(rawText: rawText)
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    
                }
                .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
                Spacer()
                Text("Text Entry")
                    .frame(maxWidth: .infinity, alignment: .leading)
                TextEditor(text: $rawText)
                Spacer()
                VStack {
                    Toggle(isOn: $isBold) {
                        Text("Hi")
                    }
                }
            }
            .padding(.horizontal)
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
        Text(renderedText)
    
}


}
struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
