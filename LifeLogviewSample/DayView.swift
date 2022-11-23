//
//  DayView.swift
//  LifeLogviewSample
//
//  Created by Ryo on 2022/10/07.
//

import SwiftUI

struct DayView: View {
    
    @State private  var sheet = false
    @State private  var picker = 1
    
    var body: some View {
        NavigationStack{
            VStack(spacing: 0) {
                //                Rectangle()
                //                    .fill(Color(.secondarySystemBackground))
                //                    .frame(height: 1.0)
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 0) {
                        ForEach(1..<32){i in
                            Button {
                                
                            } label: {
                                ZStack {
//                                    Image("LifeLog")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .foregroundColor(i == 26 ? Color(.systemBackground) : Color.clear)
                                    Circle()
                                        .fill(i == 26 ? Color.orange : Color.clear)
                                    Text("\(i)")
//                                        .foregroundColor(Color.primary)
                                        
                                        .foregroundColor(i == 26 ? Color(.systemBackground) : Color.primary)
                                }
                            }
                            
                            .background(Color(.systemGroupedBackground))
                            .frame(height: 40.0)
                        }
                        ForEach(1..<32){i in
                            Button {
                                
                            } label: {
                                ZStack {
//                                    Image("LifeLog")
//                                        .resizable()
//                                        .scaledToFit()
//                                        .foregroundColor(i == 26 ? Color(.systemBackground) : Color.clear)
                                    Circle()
                                        .fill(Color.clear)
                                    Text("\(i)")
//                                        .foregroundColor(Color.primary)
                                        
                                        .foregroundColor(Color.primary)
                                }
                            }
                            
                            .background(Color(.systemGroupedBackground))
                            .frame(height: 40.0)
                        }
                    }
                }
                
                HStack(spacing: 0) {
                    CalendarView()
                    ReminderView()
                    VStack(spacing: 0){
                        HabitListView()
                        MemoView()
                    }
                    
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
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Picker("", selection: $picker) {
                        Text("日").tag(1)
                        Text("週").tag(2)
                        Text("月").tag(3)
                        Text("一覧").tag(4)
                    }
                    .pickerStyle(.segmented)
                }
            }
            .navigationTitle("2022年10月26日(水)")
            .navigationBarTitleDisplayMode(.inline)
            
            .background(Color(.systemGroupedBackground))
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

struct RoundedCorners: View {
    var color: Color = .clear
    var tl: CGFloat = 0.0
    var tr: CGFloat = 0.0
    var bl: CGFloat = 0.0
    var br: CGFloat = 0.0
    
    var body: some View {
        GeometryReader { geometry in
            Path { path in
                let w = geometry.size.width
                let h = geometry.size.height
                
                let tr = min(min(tr, h/2), w/2)
                let tl = min(min(tl, h/2), w/2)
                let bl = min(min(bl, h/2), w/2)
                let br = min(min(br, h/2), w/2)
                
                path.move(to: CGPoint(x: w/2.0, y: 0))
                path.addLine(to: CGPoint(x: w-tr, y: 0))
                path.addArc(center: CGPoint(x: w-tr, y: tr), radius: tr, startAngle: Angle(degrees: -90), endAngle: Angle(degrees: 0), clockwise: false)
                path.addLine(to: CGPoint(x: w, y: h-br))
                path.addArc(center: CGPoint(x: w-br, y: h-br), radius: br, startAngle: Angle(degrees: 0), endAngle: Angle(degrees: 90), clockwise: false)
                path.addLine(to: CGPoint(x: bl, y: h))
                path.addArc(center: CGPoint(x: bl, y: h-bl), radius: bl, startAngle: Angle(degrees: 90), endAngle: Angle(degrees: 180), clockwise: false)
                path.addLine(to: CGPoint(x: 0, y: tl))
                path.addArc(center: CGPoint(x: tl, y: tl), radius: tl, startAngle: Angle(degrees: 180), endAngle: Angle(degrees: 270), clockwise: false)
            }
            .fill(color)
        }
    }
}
