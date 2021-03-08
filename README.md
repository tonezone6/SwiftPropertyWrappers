# Swift Property Wrappers

### Improving the model layer using Swift property wrappers.

```swift
import SwiftPropertyWrappers

struct Product: Decodable {
    @Capitalized var name: String
    @Currency    var price: String
    @DateISO8601 var date: Date
    
    var since: String {
        DateFormatter.mediumStyle.string(from: date)
    }
}
```

```json
[
    {
        "name": "croisant",
        "price": "1",
        "date": "2020-09-14T01:00:00+01:00"
    },
    {
        "name": "hot chocolate",
        "price": "2.2",
        "date": "2021-03-2T01:00:00+01:00"
    },
    {
        "name": "coffee",
        "price": "2.5",
        "date": "2020-02-28T01:00:00+01:00"
    }
]
```

```bash
Croisant
price: $1.00
since: Sep 14, 2020
==========
Hot Chocolate
price: $2.20
since: Mar 2, 2021
==========
Coffee
price: $2.50
since: Feb 28, 2020
```


