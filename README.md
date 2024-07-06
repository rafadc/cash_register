# Cash register

A simple cash register application

It supports a shopping cart where you add elements and you can have different [discounts](src/models/discounts/) applied.


```mermaid
%%{init: {'theme': 'dark', 'themeVariables': { 'darkMode': true }}}%%
graph LR
    A[<b>Shopping Cart Items</b>] -->|Apply| B[<b>Discounts</b>]
    B -->|Generate| C[<b>Invoice</b>]
    style A fill:#FF4081,stroke:#FFF,stroke-width:2px,color:#000000
    style B fill:#2196F3,stroke:#FFF,stroke-width:2px,color:#000000
    style C fill:#FFC107,stroke:#FFF,stroke-width:2px,color:#000000
    linkStyle 0,1 stroke:#FFF,stroke-width:2px
```

The basic workflow is that you have a shopping cart where you add items, then the invoice calculator will apply all the discounts and generate a proper invoice. In the UI we will display both the shopping cart and the invoice.

## Usage

Install dependencies with `bundle install`.

You can run the application with `make run` or `bundle exec ruby src/ui/cli.rb`.

You will be shown the initial screen

![Initial screen](docs/initialscreen.png)

You can add or remove items from the cart using the number keys or the cursor.

When you are done adding items, you can press `Checkout` finish:

![A screen with some elements added](docs/finalscreen.png)

## Development

There are a couple of tasks in a makefile to help with development:

- `make watch` - Runs the tests on every file change. It requires `entr` and `ag` to be installed.
- `make console` - Starts a Irb console with the application loaded.

