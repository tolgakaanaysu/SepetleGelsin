import SwiftUI
import Utility

struct TrashButton: View {
    @State private var showingAlert = false
    var alertMessage: String
    var buttonAction: CompletionBlock


    var body: some View {
        Button(action: {
            showingAlert.toggle()
        }) {
            Image(systemName: "trash.fill")
        }
        .alert("UYARI", isPresented: $showingAlert, actions: alertActions, message: showAlertMessage)
    }

    private func alertActions() -> some View {
        Group {
            Button("Evet", role: .destructive) {
                buttonAction()
            }
            Button("İptal", role: .cancel) {}
        }
    }

    private func showAlertMessage() -> some View {
        Text(alertMessage)
    }
}
