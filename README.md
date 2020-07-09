# AnyError
AnyError is a wrapper type for Swift.Error protocol.


AnyError can init by following way:
```swift
throw AnyError(error)
throw AnyError("MESSAGE")
throw AnyError()
```

## Why AnyError
Swift.org Error handling chapter:
```swift
enum VendingMachineError: Error {
    case invalidSelection
    case insufficientFunds(coinsNeeded: Int)
    case outOfStock
}
```

but hard to catch 
```swift
// Swift 5.3
do {
    let r = try tryFibonacci(-1)
    print(r)
} catch VendingMachineError.invalidSelection,
    VendingMachineError.outOfStock {
    ...
} catch let VendingMachineError.insufficientFunds(coinsNeeded) {
    ...
} catch {
    print(error)
}
```

This is way to hard to feedback, so we can use AnyError 

```swift
extension AnyError {
    static var invalidSelection:AnyError {AnyError("invalid Selection")}
}
```
