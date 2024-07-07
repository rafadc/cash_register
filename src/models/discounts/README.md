# Discounts

Discounts act by taking a list of line items and changing it into another list of line items after applying the discount.

```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'darkMode': true }}}%%
graph LR
    A[Line Item List] --> B[Discount]
    B --> C[Transformed Line Items List]
    style A fill:#ff5555,stroke:#ff0000,stroke-width:2px,color:white
    style B fill:#5555ff,stroke:#0066cc,stroke-width:2px,color:white
    style C fill:#55ff55,stroke:#00cc00,stroke-width:2px,color:white
```

You can add a new type of discount by creating a new class here that implements the `apply` method and returns a list of line items.

The discounts receive a list of line items and return a list of line items. This is done that way to have a bit more flexibiliy. We will not be constrained just to our line item.

For example, in the future we can add discounts that add new items when you purchase a given set of products. Let's say that when you but a TV and a sound system you get a discount on a soundbar. This would be a discount that would add a new line item to the list.


