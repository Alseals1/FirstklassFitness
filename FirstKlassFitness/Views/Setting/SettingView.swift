import SwiftUI
import SwiftData

struct SettingView: View {
    @State var name: String = ""
    @State var goal: String = ""
    @State var age: String = ""
    @AppStorage("name") var currentUserName: String?
    @AppStorage("age") var currentUserAge: Int?
    @AppStorage("gender") var currentUserGender: String?
    @AppStorage("weight") var currentUserWeight: String?
    @AppStorage("height") var currentUserHeight: String?
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    @Environment(\.modelContext) var modelContext
    
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
                    
                   userEntry
                }
                .padding(.horizontal)
            }
           bottomButton
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        SettingView()
    }
}

/// View Extension
extension SettingView {
    var userEntry: some View {
        VStack(alignment: .leading) {
            CustomTextField(textFieldTitle: "Name", name: $name)
            CustomTextField(textFieldTitle: "Age", name: $age)
            CustomTextField(textFieldTitle: "Calorie Goal", name: $goal)
                .keyboardType(.numberPad)
        }
    }
    
    var bottomButton: some View {
        HStack {
            Text("Save")
                .font(.custom("Oswald-Bold", size: 14))
                .foregroundStyle(.lavender)
                .font(.headline)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .background(.charcoalGray)
                .onTapGesture {
                    save()
                    
                    print(goal)
                }
                .clipShape(RoundedRectangle(cornerRadius: 15))
            
            Text("Sign Out")
                .font(.custom("Oswald-Bold", size: 14))
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
        .padding(.bottom)
    }
}

/// Function Extension
extension SettingView {
    func save() {
        currentUserName = name
        currentUserAge = Int(age)
        //currentUserGender = gender
        withAnimation(.bouncy()) {
            name = ""
            age = ""
            goal = ""
        }
        
    }
    
    func signOut() {
        currentUserName = nil
        currentUserAge = nil
        currentUserGender = nil
        currentUserHeight = nil
        currentUserWeight = nil
        

        #warning("Add alerts for delete")
        
        withAnimation(.spring()) {
            currentUserSignedIn = false
            
            do {
                try modelContext.delete(model: Meal.self)
                try modelContext.delete(model: Notes.self)
            } catch {
                print("Failed to clear all Country and City data.")
            }
        }
    }
}
