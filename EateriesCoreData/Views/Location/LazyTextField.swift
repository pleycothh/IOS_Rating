//
//  LazyTextField.swift
//  EateriesCoreData
//
//  Created by Ben Li on 25/5/21.
//


import SwiftUI

struct LazyTextField: View {
    var prompt: String
    @Binding var text: String
    var onCommit: () -> Void

    var body: some View {
        ActualTextField(prompt: prompt, string: text, text: $text, commit: onCommit)
    }
}

