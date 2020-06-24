# SFSymbolPicker
A custom Library to select an icon from the 1500+ Apple SFSymbols Set. Typesafe!


## How to Use

1. Download the Sources Folder and Add it to your Project


2. Presenting the picker

```swift
let symbolPicker = SymbolPickerController()
symbolPicker.symbolDelegate = self
self.present(symbolPicker, animated: true, completion: nil)
```


3. Conform to the delegate

```swift
extension YourViewController : SymbolPickerDelegate {
    func didSelectSymbol(name: String) {
        yourUIImageView.image = UIImage(systemName: name)
    }   
}
```


4. Profit


###### Open a PR if you wanna contribute!
