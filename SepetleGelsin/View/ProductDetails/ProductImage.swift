import SwiftUI
struct ProductImage: View {
    var imageUrl: String
    
    var body: some View {
        AsyncImage(url: URL(string: imageUrl)!) { image in
            image
            .renderingMode(.original)
            .resizable()
           
            
        } placeholder: {
            ProgressView()
        }
          
            .frame(width: 200, height: 200, alignment: .center)
            .aspectRatio(contentMode: .fit)
            .shadow(radius: 10)

    }
}
struct ProductImage_Previews: PreviewProvider {
    static var previews: some View {
        ProductImage(imageUrl: A.imageUrl)
    }
}
