# AnyError

```swift
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
```

```swift
extension AnyError {
    static var invalidSelection
    static func insufficientFunds(coinsNeeded: Int)
    static var outOfStock
}
```
