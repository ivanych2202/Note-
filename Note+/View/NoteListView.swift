import SwiftUI
import AudioToolbox

struct NoteListView: View {
    @EnvironmentObject var viewModel: NoteViewModel
    @State private var isAddNoteViewPresented = false
    @State private var selectedNote: Note?
    
    var body: some View {
        NavigationView {
            ZStack {
                Color.white.edgesIgnoringSafeArea(.all)
                
                VStack {
                    List {
                        if let notes = viewModel.notes {
                            ForEach(notes, id: \.id) { note in
                                Button(action: {
                                    selectedNote = note
                                }) {
                                    NoteView(note: note)
                                }
                            }
                        } else {
                            Text("Loading Notes...")
                        }
                    }
                    .listStyle(.sidebar)
                    
                    Button(action: {
                        AudioServicesPlaySystemSound(1306)
                        isAddNoteViewPresented = true
                    }) {
                        Image(systemName: "plus.app.fill")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 80, height: 80)
                    }
                    .sheet(isPresented: $isAddNoteViewPresented) {
                        AddNoteView()
                    }
                }
            }
            .navigationTitle("Note+")
            .onAppear {
                viewModel.fetchNotes()
            }
            .sheet(item: $selectedNote) { note in
                EditNoteView(note: note)
            }
        }
    }
}

struct NoteListView_Previews: PreviewProvider {
    static var previews: some View {
        NoteListView().environmentObject(NoteViewModel.shared)
    }
}
