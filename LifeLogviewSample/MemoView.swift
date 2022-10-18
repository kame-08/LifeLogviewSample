//
//  MemoView.swift
//  LifeLogviewSample
//
//  Created by Ryo on 2022/10/07.
//

import SwiftUI

struct MemoView: View {
    var body: some View {
        List{
            Section("メモ") {
                TextEditor(text: .constant("メモの内容"))
                    .frame(height: 290.0)
            }
            
            
        }
//        .listStyle(InsetListStyle())
    }
}

struct MemoView_Previews: PreviewProvider {
    static var previews: some View {
        MemoView()
    }
}
