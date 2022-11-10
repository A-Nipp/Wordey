//
//  SettingsView.swift
//  Wordey
//
//  Created by AlecNipp on 10/16/22.
//

import SwiftUI

struct TextOptionsView: View {
    @ObservedObject var vm: WordeyViewModel
    var body: some View {
        ZStack {
            Color(UIColor.systemGroupedBackground)
                .ignoresSafeArea()
            
            VStack(spacing: 30) {
                RenderedTextView(model: vm.model)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: vm.model.hAlignment.systemAlignment, vertical: vm.model.vAlignment.systemAlignment))
                    .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
                
                VStack(alignment: .leading) {
                    Text("FONT")
                        .font(.footnote)
                        .foregroundColor(.secondary)
                        .padding(.leading)
                    VStack {
                        Toggle(isOn: $vm.model.isBold) {
                            Text("Bold")
                        }
                        Divider()
                        Toggle(isOn: $vm.model.isItalicized) {
                            Text("Italics")
                        }
                        Divider()
                        Picker("Please choose a color", selection: $vm.model.textColor) {
                            ForEach(FontColor.allCases, id: \.self) {
                                Text($0.stringValue)
                            }
                        }
                        .pickerStyle(.segmented)
                        Divider()
                        Slider(
                            value: $vm.model.fontSize,
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
                            Picker("Horizontal", selection: $vm.model.hAlignment) {
                                ForEach(HorizontalTextAlignment.allCases, id: \.self) {
                                    Text($0.rawValue)
                                }
                            }
                            .pickerStyle(.menu)
                        }
                        Divider()
                        
                        HStack {
                            Text("Vertical")
                            Picker("Vertical", selection: $vm.model.vAlignment) {
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
        .toolbar {
            ToolbarItemGroup(placement: .bottomBar) {
                NavigationLink("Load Preset") {
                    PresetListView(vm: vm)
                }
                Button("Save Preset") {
                    vm.savePreset()
                }
            }
        }
        
        
    }
}


struct TextOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        NavigationStack {
            TextOptionsView(vm: WordeyViewModel())
        }
    }
}
