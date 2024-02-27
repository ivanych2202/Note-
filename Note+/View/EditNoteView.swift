
import SwiftUI
import AudioToolbox

struct EditNoteView: View {
    @State private var title: String
    @State private var text: String
    @EnvironmentObject var viewModel: NoteViewModel
    @Environment(\.presentationMode) var presentationMode
    var note: Note
    
    init(note: Note) {
        self.note = note
        _title = State(initialValue: note.title)
        _text = State(initialValue: note.text)
    }
    
    var body: some View {
        VStack {
            TextField("Title", text: $title)
                .padding()
                .textFieldStyle(RoundedBorderTextFieldStyle())
            
            TextEditor(text: $text)
                .padding()
            
            HStack{
                Button(action: {
                    AudioServicesPlaySystemSound(1306)
                    viewModel.deleteNote(id: note.id)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "trash")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40)
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                Button(action: {
                    AudioServicesPlaySystemSound(1306)
                    viewModel.editNote(id: note.id, newTitle: title, newText: text)
                    presentationMode.wrappedValue.dismiss()
                }) {
                    Image(systemName: "checkmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40)
                        .foregroundColor(.green)
                }

            }
            .padding()
           
        }
        .padding()
    }
}

struct EditNoteView_Previews: PreviewProvider {
    static var previews: some View {
        EditNoteView(note: Note())
            .environmentObject(NoteViewModel())
    }
}
