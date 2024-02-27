import SwiftUI
import AudioToolbox

struct AddNoteView: View {
    @State private var title: String = ""
    @State private var text: String = ""
    
    @EnvironmentObject var viewModel: NoteViewModel
    @Environment(\.presentationMode) var presentationMode
    
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
                    presentationMode.wrappedValue.dismiss()
                                       
                }) {
                    Image(systemName: "xmark")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 40)
                        .foregroundColor(.red)
                }
                
                Spacer()
                
                Button(action: {
                    AudioServicesPlaySystemSound(1306)
                    viewModel.addNewNote(title: title, text: text)
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

struct AddNoteView_Previews: PreviewProvider {
    static var previews: some View {
        AddNoteView()
    }
}
