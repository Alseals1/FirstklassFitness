import Foundation
import SwiftData

@Model
class Notes: Identifiable {
    var id = UUID()
    var title: String
    var abstract: String
    var noteDate: Date
    
    init(id: UUID = UUID(), title: String, abstract: String, noteDate: Date = .now) {
        self.id = id
        self.title = title
        self.abstract = abstract
        self.noteDate = noteDate
    }
}

/*
let workoutNotes: [Notes] = [
    Notes(title: "Morning Jog", abstract: "Start your day with a refreshing jog around the park.", noteDate: Date()),
    Notes(title: "Full Body Workout", abstract: "Hit the gym for a complete full-body workout session.", noteDate: Date()),
    Notes(title: "Yoga and Meditation", abstract: "Unwind and rejuvenate your body and mind with a yoga and meditation session.", noteDate: Date()),
    Notes(title: "Cycling Adventure", abstract: "Explore nature on two wheels with a scenic cycling adventure.", noteDate: Date()),
    Notes(title: "HIIT Workout", abstract: "Get your heart pumping with a high-intensity interval training session.", noteDate: Date()),
    Notes(title: "Swimming Session", abstract: "Dive into the pool for a refreshing swimming session.", noteDate: Date()),
    Notes(title: "Pilates Class", abstract: "Strengthen your core and improve flexibility with a Pilates class.", noteDate: Date()),
    Notes(title: "Hiking Expedition", abstract: "Embark on a challenging hiking expedition and conquer new trails.", noteDate: Date()),
    Notes(title: "Zumba Dance Party", abstract: "Dance your way to fitness with a fun-filled Zumba dance party.", noteDate: Date()),
    Notes(title: "Boxing Workout", abstract: "Release stress and boost confidence with an intense boxing workout.", noteDate: Date()),
    Notes(title: "Circuit Training", abstract: "Switch between different exercises in quick succession for a full-body workout.", noteDate: Date()),
    Notes(title: "Bootcamp Challenge", abstract: "Push your limits with a challenging bootcamp-style workout.", noteDate: Date()),
    Notes(title: "CrossFit WOD", abstract: "Test your strength and endurance with a CrossFit workout of the day.", noteDate: Date()),
    Notes(title: "Rock Climbing Adventure", abstract: "Conquer new heights and challenge yourself with an exhilarating rock climbing adventure.", noteDate: Date()),
    Notes(title: "Barre Fitness Class", abstract: "Sculpt and tone your muscles with a low-impact, high-intensity barre fitness class.", noteDate: Date())
    ]
*/
