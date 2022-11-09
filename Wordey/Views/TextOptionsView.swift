//
//  SettingsView.swift
//  Wordey
//
//  Created by AlecNipp on 10/16/22.
//

import SwiftUI

struct TextOptionsView: View {
    ///  The text that is passed from ContentView. It is a let constant here because there is no way to modify it in this screen.
    let rawText: String
    // MARK: Fix this. Too many bindings :(
    @Binding var isBold: Bool
    @Binding var isItalicized: Bool
    @Binding var fontColor: FontColor
    @Binding var vAlignment: VerticalTextAlignment
    @Binding var hAlignment: HorizontalTextAlignment
    @Binding var fontSize: CGFloat
    var body: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                RenderedTextView(rawText: rawText, fontColor: fontColor, isBold: isBold, isItalicized: isItalicized, fontSize: fontSize)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: hAlignment.systemAlignment, vertical: vAlignment.systemAlignment))
                    .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
                
                VStack(alignment: .leading) {
                    Text("FONT")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                    VStack {
                        Toggle(isOn: $isBold) {
                            Text("Bold")
                        }
                        Divider()
                        Toggle(isOn: $isItalicized) {
                            Text("Italics")
                        }
                        Divider()
                        Picker("Please choose a color", selection: $fontColor) {
                            ForEach(FontColor.allCases, id: \.self) {
                                Text($0.stringValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        Divider()
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
                    .padding()
                    .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
                    
                }
                
                VStack(alignment: .leading) {
                    Text("ALIGNMENT")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                    VStack {
                        HStack {
                            Text("Horizontal")
                            Picker("Horizontal", selection: $hAlignment) {
                                ForEach(HorizontalTextAlignment.allCases, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                        Divider()
                        
                        HStack {
                            Text("Vertical")
                            Picker("Vertical", selection: $vAlignment) {
                                ForEach(VerticalTextAlignment.allCases, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }
                            .pickerStyle(.automatic)
                        }
                        
                    }
                    .padding()
                    .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
                    
                }
            }
            .padding(.horizontal, 20.0)
        }
        
        
    }
}


struct TextOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        TextOptionsView(rawText: "Hello", isBold: .constant(true), isItalicized: .constant(true), fontColor: .constant(FontColor.red), vAlignment: .constant(.center), hAlignment: .constant(.center), fontSize: .constant(20))
    }
}
