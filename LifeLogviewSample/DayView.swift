//
//  DayView.swift
//  LifeLogviewSample
//
//  Created by Ryo on 2022/10/07.
//

import SwiftUI

struct DayView: View {
    
    @State private  var sheet = false
    var body: some View {
        NavigationStack{
            HStack(spacing: 0) {
                CalendarView()
                ReminderView()
                VStack(spacing: 0){
                    HabitListView()
                    MemoView()
                }
                
            }
            
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    Button {
                        sheet.toggle()
                    } label: {
                        Label("追加", systemImage: "plus")
                    }

                   
                }
            }
            .navigationTitle("2022年10月7日")
            .navigationBarTitleDisplayMode(.inline)
        }
        .sheet(isPresented: $sheet) {
                    AddTaskView()
                        .presentationDetents([.medium])
                }
    }
}

struct DayView_Previews: PreviewProvider {
    static var previews: some View {
        DayView()
    }
}
