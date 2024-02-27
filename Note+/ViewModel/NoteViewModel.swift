import Foundation
import RealmSwift

class NoteViewModel: ObservableObject {
    static let shared = NoteViewModel()
    private let dataManager = DataManager.shared
    @Published var notes: Results<Note>?
    
    func addNewNote(title: String, text: String) {
        let newNote = Note()
        newNote.title = title
        newNote.text = text
        dataManager.addNewNote(note: newNote)
        fetchNotes()
    }
    
    func editNote(id: String, newTitle: String, newText: String) {
        if let note = dataManager.getNoteById(id: id) {
            dataManager.editNote(note: note, newTitle: newTitle, newText: newText)
            fetchNotes()
        }
    }
    
    func deleteNote(id: String) {
        if let note = dataManager.getNoteById(id: id) {
            dataManager.deleteNote(note: note)
            fetchNotes()
        }
    }
    
    func fetchNotes() {
        notes = dataManager.getAllNotes()
    }
    
    func createInitialNoteIfNeeded() {
        if dataManager.getAllNotes().isEmpty {
            addNewNote(title: "First Note", text: "This is your first note.")
        }
    }

}
