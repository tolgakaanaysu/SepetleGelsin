import SwiftUI

struct SearchView: View {
    @EnvironmentObject var myList:  ProductViewModel
    @State var searchText = ""
    
    var body: some View {
        NavigationView {
          
    
            List(myList.productList) { element in
                VStack(alignment: .leading, spacing: 10) {
                    Text(element.title)
                    
                  
                }
          
        
            
            }
            
            .searchable( text: $searchText, suggestions: {
                    
                ForEach(myList.productList
                            .filter { prodcut in
                    searchText == "" ? true :
                    prodcut.title.lowercased().contains(searchText.lowercased())
                }){ element in
                    Text(element.title)
                    
                }
                })
            
            
        }
        
    }
}

struct SearchView_Previews: PreviewProvider {
    static var previews: some View {
        SearchView()
            .environmentObject(ProductViewModel())
    }
}
