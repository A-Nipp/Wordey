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
        NavigationStack {
            ZStack {
                Color.gray
                    .opacity(0.3)
                    .ignoresSafeArea()
                VStack(spacing: 10) {
                    HStack {
                        Text("Wordey")
                            .font(.largeTitle)
                            .bold()
                        Spacer()
                        NavigationLink {
                            TextOptionsView(rawText: rawText, isBold: $isBold, isItalicized: $isItalicized, textColor: $textColor, vAlignment: $vAlignment, hAlignment: $hAlignment, fontSize: $fontSize)
                        } label: {
                            Image(systemName: "gear")
                                .font(.largeTitle)
//                                .resizable()
//                                .font(.caption)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.bottom)
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
                            .cornerRadius(5)
                    }
                    
                    Spacer()
                    
                    
                }
                .padding(.horizontal)
                .padding(.bottom, 20)
            }
        }
    }
    
}

extension ContentView {
    public static var example: some View {
        return ContentView()
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

