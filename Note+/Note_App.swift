import SwiftUI

@main
struct Note_App: App {
    
    @ObservedObject var viewModel = NoteViewModel.shared
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(viewModel)
                .background(Color.white)
                .onAppear {
                    viewModel.createInitialNoteIfNeeded()
                }
        }
    }
}
