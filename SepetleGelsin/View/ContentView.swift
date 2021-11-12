
import SwiftUI

struct ContentView: View {
    @ObservedObject var item = ProductViewModel()
    
   var body: some View {
        
        NavigationView{
            
            List {
                
                ForEach(item.productList) { i in
                    
                        
                        
                    Text("Liste içi")
                    Text(i.title)
                            .padding()
                            
                      
                    
                }
                
               
                
            }
        }
        
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
