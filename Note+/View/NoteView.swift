import SwiftUI

struct NoteView: View {
    var note: Note
    
    var body: some View {
        VStack(alignment: .leading, spacing: 4) {
            Text(note.title)
                .font(.headline)
            
            Text(note.text)
                .font(.body)
                .foregroundColor(.secondary)
        }
        .padding(8)
        .background(Color(UIColor.systemBackground))
        .cornerRadius(8)
        .padding(.horizontal, 8)
    }
}

struct NoteView_Previews: PreviewProvider {
    static var previews: some View {
        let sampleNote = Note()
        sampleNote.title = "Sample Title"
        sampleNote.text = "Sample Text"
        
        return NoteView(note: sampleNote)
    }
}
