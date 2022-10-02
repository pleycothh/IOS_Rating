//
//  ActualTextField.swift
//  EateriesCoreData
//
//  Created by Tia on 29/5/21.
//

import SwiftUI

var editingMode = [ String : Bool ]()

struct ActualTextField: View {
    var prompt: String
    @State var string: String
    @Binding var text: String
    var commit: () -> Void

    func updateBinding() {
        text = string
        print("updateBinding")
    }

    var body: some View {
        let isEditing = editingMode[prompt]
        let isSetup = isEditing != nil
        if string != text {
            if isEditing == false {
                DispatchQueue.main.async {
                    string = text
                    print("dispath")
                }
            } else if !isSetup {
                editingMode[prompt] = false
                print("is Set up")
            }
        }
        return TextField(prompt, text: $string, onEditingChanged: {
            editingMode[prompt] = $0
            if !$0 { updateBinding() }
        }, onCommit: commit).onDisappear {
            updateBinding()
            editingMode[prompt] = nil
            print("update binding")
        }
    }
}
