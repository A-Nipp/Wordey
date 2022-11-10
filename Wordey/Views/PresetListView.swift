//
//  PresetListView.swift
//  Wordey
//
//  Created by AlecNipp on 11/8/22.
//

import SwiftUI

struct PresetListView: View {
    @ObservedObject var vm: WordeyViewModel
    var body: some View {
        List {
            ForEach(vm.presets) { preset in
                Button {
                    vm.setPreset(newPreset: preset)
                } label: {
                    RenderedTextView(model: preset.data)
                }
            }
        }
    }
}

struct PresetListView_Previews: PreviewProvider {
    static var previews: some View {
        PresetListView(vm: WordeyViewModel())
    }
}
