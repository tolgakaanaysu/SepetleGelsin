import SwiftUI

struct CategoryItem: View {
    var product:  ProductModel
    
    var body: some View {
        VStack(alignment: .leading) {
            
            AsyncImage(url: URL(string: product.imageUrl)!) { image in
                image
                .renderingMode(.original)
                .resizable()
               
                
            } placeholder: {
                ProgressView()
            }
            .frame(width: 120, height: 120)
            .clipShape(RoundedRectangle(cornerRadius: 15))
            .shadow(color: .blue, radius: 5)
                

            Text(product.title)
                .frame(width: 110, height: 20, alignment: .leading)
                .foregroundColor(.primary)
                .font(.caption)
        }
       
        .padding(.top, 10)
    }
}


struct CategoryItem_Preview: PreviewProvider {
    static var previews: some View {
        CategoryItem(product: AB[1])
    }
}

