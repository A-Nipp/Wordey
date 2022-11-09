//
//  ContentView.swift
//  Wordey
//
//  Created by AlecNipp on 10/7/22.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = WordeyViewModel()
    
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
                            TextOptionsView(vm: vm)
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
                        RenderedTextView(model: vm.model)
                            .padding()
                            .frame(maxWidth: .infinity, maxHeight: .infinity, alignment: Alignment(horizontal: vm.model.hAlignment.systemAlignment, vertical: vm.model.vAlignment.systemAlignment))
                    }
                    .background(Color.white, in: RoundedRectangle(cornerRadius: 5))
                    Spacer()
                    VStack(alignment: .leading) {
                        Text("Text Entry")
                            .font(.subheadline)
                        TextEditor(text: $vm.model.rawText)
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

