import SwiftUI

struct SettingView: View {
    @State var name: String = ""
    @State var goal: String = ""
    @State var age: String = ""
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    var body: some View {
        VStack {
            ScrollView(.vertical) {
                VStack {
                    HStack {
                        Image("HIIT")
                            .resizable()
                            .frame(width: 250, height: 250)
                            .aspectRatio(contentMode: .fit)
                    }
                    .frame(maxWidth: .infinity, alignment: .center)
                    VStack(alignment: .leading) {
                        CustonTextField(textFieldTitle: "Name", name: $name)
                        CustonTextField(textFieldTitle: "Age", name: $age)
                        CustonTextField(textFieldTitle: "Calorie Goal", name: $goal)
                            .keyboardType(.numberPad)
                        
                        Spacer()
                    }
                }
                .padding(.horizontal)
            }
            
            HStack {
                Text("Save")
                    .foregroundStyle(.lavender)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.charcoalGray)
                    .onTapGesture {
                        save()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
                
                Text("Sign Out")
                    .foregroundStyle(.lavender)
                    .font(.headline)
                    .frame(height: 55)
                    .frame(maxWidth: .infinity)
                    .background(.charcoalGray)
                    .onTapGesture {
                        signOut()
                    }
                    .clipShape(RoundedRectangle(cornerRadius: 15))
            }
        }
       
    }
}

struct CustonTextField: View {
    var textFieldTitle: String
    @Binding var name: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(textFieldTitle)
                .font(.title)
                .foregroundStyle(.lighterGray)
            TextField("", text: $name)
                .padding()
                .background(RoundedRectangle(cornerRadius: 15).fill(Color.gray.opacity(0.2)))
                .foregroundStyle(.lighterGray)
                .tint(.royalPurple)
            
        }
        
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SettingView()
    }
}

extension SettingView {
    func save() {
        currentUserName = name
        currentUserAge = Int(age)
        //currentUserGender = gender
        withAnimation(.bouncy()) {
            currentUserSignedIn = true
        }
        
        #warning("Need to clear text field")
    }
    
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
#warning("Delete swift data")
#warning("Add alerts for delete")
        
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
}
