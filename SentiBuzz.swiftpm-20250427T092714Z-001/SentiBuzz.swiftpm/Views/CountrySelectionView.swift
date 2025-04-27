import SwiftUI

struct CountrySelectionView: View {
    @Binding var selectedCountry: String
    
    let countries = ["US", "GB", "IN", "CA", "AU"]
    
    var body: some View {
        Picker("Select Country", selection: $selectedCountry) {
            ForEach(countries, id: \.self) { country in
                Text(country).tag(country)
            }
        }
        .pickerStyle(MenuPickerStyle())
    }
}

struct CountrySelectionView_Previews: PreviewProvider {
    static var previews: some View {
        CountrySelectionView(selectedCountry: .constant("US"))
    }
}
