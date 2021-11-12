import SwiftUI
import Kingfisher

struct CategoryItem: View {
    var item:  Product
    
    var body: some View {
        VStack(alignment: .leading) {
            KFImage(URL(string: item.imageUrl))
                .renderingMode(.original)
                .resizable()
                .frame(width: 155, height: 155)
                .cornerRadius(5)
            
            Text(item.title)
                .foregroundColor(.primary)
                .font(.caption)
        }
        .padding(.trailing, 15)
    }
}
