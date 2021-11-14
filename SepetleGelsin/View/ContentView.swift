import SwiftUI



struct ContentView: View {
    @State var items: [String] = ["Apples", "Oranges", "Bananas", "Pears", "Mangos", "Grapefruit","Appless", "Orangess", "Bananass", "Pearss", "Mangoss", "Grapefruitt"]
    
    

    @State private var newItemText : String = ""
    var body: some View {
       NavigationView {
            List{
                 ForEach(items, id: \.self) { i in
                     Text(i)
                 }
                
                
                TextEditor(text: $newItemText)
                    .padding(.bottom)
//                    .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 0.2)
                    
//                    .ignoresSafeArea(.keyboard, edges: .all)
            }
            .padding(.bottom)
            .ignoresSafeArea(.keyboard, edges: .bottom)
 
       
            
            
              
          
        }
        .frame(maxHeight: UIScreen.main.bounds.maxY )
        .padding(.top)
    }
}
