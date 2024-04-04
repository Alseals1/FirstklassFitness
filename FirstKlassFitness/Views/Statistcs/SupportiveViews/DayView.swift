import SwiftUI

struct DayView: View {
    @State var date: Date
    
    var body: some View {
        HStack {
                    VStack {
                        Text(date.getWeekDay(from: date))
                        Text(date.getDay(from: date))
                            .lineLimit(1)
                    }
                    .foregroundColor(.white)
                    .frame(width: 40, height: 64)
                }
        }
    
    

}
#Preview {
    DayView(date: .now)
}


