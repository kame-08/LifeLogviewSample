//
//  HabitListView.swift
//  LifeLogviewSample
//
//  Created by Ryo on 2022/10/07.
//

import SwiftUI

struct HabitListView: View {
    var body: some View {
            List{
                Section("習慣") {
                    ForEach(1..<5) { num in
                        ReminderListView(title: "習慣のタスク\(num)")
                    }
                }
            }
        
//        .listStyle(InsetListStyle())
    }
}

struct HabitListView_Previews: PreviewProvider {
    static var previews: some View {
        HabitListView()
    }
}
