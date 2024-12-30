import SwiftUI

struct HomepageView: View {
    @EnvironmentObject private var viewModel : HomepageVM

    var body: some View {
        NavigationView {
            List {
                ForEach(viewModel.categories.keys.sorted(), id:\.self ) { key in
                    CategoryRowView(catogoryName: key, productArray: viewModel.categories[key]!)
                }
            }
            .navigationBarTitleDisplayMode(.inline)
            .listStyle(.inset)
            .navigationTitle("Anasayfa")
        }
    }
}
