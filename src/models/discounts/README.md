# Discounts

Discounts act by taking a list of line items and changing it into another list of line items after applying the discount.

You can add a new type of discount by creating a new class here that implements the `apply` method and returns a list of line items.

The discounts receive a list of line items and return a list of line items. This is done that way to have a bit more flexibiliy. For example, in the future we can add discounts that add new items when you purchase a given set of products.


