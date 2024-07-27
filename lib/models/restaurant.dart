import 'package:collection/collection.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_app/models/cart_item.dart';
import 'package:intl/intl.dart';

import 'food.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
  
 
    //briskets
      Food(
        name: 'Charcoal Brisket', 
        description: 
          'Our Georgia famous 24-hour smoked brisket, seasoned generously and left with nothin but flavor', 
        imagePath: 'lib/images_bbq/briskets/charcoal_brisket.png', 
        price: 17.99, 
        category: FoodCategory.briskets, 
        availableAddons: [
          Addon(name: 'Extra Brisket Sauce', price: 1.99),
        ],
      ),
      Food(
        name: 'Full Rack Ribs', 
        description: 
          'A full rack of ribs, slow-cooked to perfection with our special blend of spices for maximum flavor.', 
        imagePath: 'lib/images_bbq/briskets/full_rack_ribs.png', 
        price: 25.99, 
        category: FoodCategory.briskets, 
        availableAddons: [
          Addon(name: 'Extra BBQ Sauce', price: 1.99),
        ],
      ),    //sandwhiches
      Food(
        name: 'Half Rack Ribs', 
        description: 
          'Half a rack of tender ribs, smoked with a hickory blend and topped with our signature BBQ sauce.', 
        imagePath: 'lib/images_bbq/briskets/half_rack_ribs.png', 
        price: 14.99, 
        category: FoodCategory.briskets, 
        availableAddons: [
          Addon(name: 'Extra BBQ Sauce', price: 1.99),
        ],
      ),
      Food(
        name: 'Southern Style Brisket', 
        description: 
          'Traditional Southern-style brisket, smoked for 24 hours and served with our house coleslaw.', 
        imagePath: 'lib/images_bbq/briskets/southern_style_brisket.png', 
        price: 18.99, 
        category: FoodCategory.briskets, 
        availableAddons: [
          Addon(name: 'Extra Coleslaw', price: 1.99),
          Addon(name: 'Baked Beans', price: 3.49),
        ],
      ),
    
    // sandwhiches

      Food(
            name: 'Carolina Wrap',
            description:
            'Warm bbq chopped white meat chicken with cool slaw and shredded cheddar cheese wrapped in a flour tortilla and pressed on the grill',
            imagePath: 'lib/images_bbq/sandwiches/carolina_wrap.png',
            price: 13.99,
            category: FoodCategory.sandwiches,
            availableAddons: [
            Addon(name: 'With Side', price: 1.75),
      ],
      ),
      Food(
      name: 'Lone Star Reuban',
      description:
        'Bringing a northern favorite down home with a southern twist. Smoked beef brisket, sauerkraut, a special bbq dressing, swiss cheese on a toasted roll',
      imagePath: 'lib/images_bbq/sandwiches/lone_rueben.png',
      price: 16.99,
      category: FoodCategory.sandwiches,
      availableAddons: [
          Addon(name: 'With Side', price: 1.75),
      ],
      ),
      Food(
      name: 'Smokehouse Club',
      description:
        'This puts the country in country club, pulled pork, bbq chicken, bacon piled high with lettuce and tomato on a toasted roll',
      imagePath: 'lib/images_bbq/sandwiches/smokehouse_club.png',
      price: 14.99,
      category: FoodCategory.sandwiches,
      availableAddons: [
              Addon(name: 'With Side', price: 1.75),
      ],
      ),
      Food(
    name: 'Southern Cuban',
    description:
        'Our take on the classic Cuban, southern pulled pork, slices of black forest ham, pickles, generous portion of mustard then pressed on a fresh baked Cuban roll',
    imagePath: 'lib/images_bbq/sandwiches/southern_cuban.png',
    price: 15.99,
    category: FoodCategory.sandwiches,
    availableAddons: [
       Addon(name: 'With Side', price: 1.75),
    ],
  ),


    //sides
      Food(
  name: 'Mashed Potatoes', 
  description: 
    'Creamy mashed potatoes made with real butter and a hint of garlic.', 
  imagePath: 'lib/images_bbq/sides/mashed_potatoes.png', 
  price: 3.49, 
  category: FoodCategory.sides, 
  availableAddons: [
    Addon(name: 'Gravy', price: 0.99),
    Addon(name: 'Extra Butter', price: 0.49),
  ],
),
      Food(
        name: 'Southern Seasoned Fries', 
        description: 
          'Crispy fries tossed in our special Southern seasoning blend for a perfect crunch and flavor.', 
        imagePath: 'lib/images_bbq/sides/fries.png', 
        price: 2.99, 
        category: FoodCategory.sides, 
        availableAddons: [
          Addon(name: 'Cheese Sauce', price: 1.49),
          Addon(name: 'Ranch Dressing', price: 0.99),
        ],
      ),
      Food(
        name: 'Cheesy Biscuits', 
        description: 
          'Fluffy biscuits loaded with cheddar cheese and brushed with garlic butter.', 
        imagePath: 'lib/images_bbq/sides/biscuits.png', 
        price: 2.99, 
        category: FoodCategory.sides, 
        availableAddons: [
          Addon(name: 'Extra Cheese', price: 0.99),
          Addon(name: 'Honey Butter', price: 0.99),
        ],
      ),

    //desserts
      Food(
        name: 'Brownies', 
        description: 
          'Rich and fudgy brownies topped with a sprinkle of powdered sugar.', 
        imagePath: 'lib/images_bbq/desserts/brownies.png', 
        price: 3.49, 
        category: FoodCategory.desserts, 
        availableAddons: [
          Addon(name: 'Peanut butter Caramel Chocolate Drizzle', price: 1.99),
        ],
      ),
      Food(
        name: 'Moon Pies', 
        description: 
          'Southern moon pies with marshmallow and graham crackers, dipped in chocolate.', 
        imagePath: 'lib/images_bbq/desserts/moon_pies.png', 
        price: 2.99, 
        category: FoodCategory.desserts, 
        availableAddons: [
          Addon(name: 'Extra Chocolate Dip', price: 0.99),
          Addon(name: 'Whipped Cream', price: 0.99),
        ],
      ),
      Food(
  name: 'Peach Cobbler', 
  description: 
    'Warm peach cobbler with a flaky crust and a hint of cinnamon, served with a scoop of vanilla ice cream.', 
  imagePath: 'lib/images_bbq/desserts/peach_cobbler.png', 
  price: 4.49, 
  category: FoodCategory.desserts, 
  availableAddons: [
    Addon(name: 'Extra Ice Cream', price: 2.99),
    Addon(name: 'Cinnamon Sprinkle', price: 0.49),
  ],
),

    //drinks
      Food(
  name: 'Lemonade', 
  description: 
    'Fresh lemonade squeezed in store and sweetened to liking', 
  imagePath: 'lib/images_bbq/drinks/lemonade.png', 
  price: 1.99, 
  category: FoodCategory.drinks, 
  availableAddons: [
    Addon(name: 'Extra Sweetened', price: 0.49)
  ],
),
      Food(
        name: 'Bottled Water', 
        description: 
          'Stay hydrated with a bottle of pure, refreshing water.', 
        imagePath: 'lib/images_bbq/drinks/bottled_water.png', 
        price: 1.49, 
        category: FoodCategory.drinks, 
        availableAddons: [],
      ),
      Food(
        name: 'Fresh Sweet Tea', 
        description: 
          'Freshly brewed sweet tea, a Southern classic that is both refreshing and delicious.', 
        imagePath: 'lib/images_bbq/drinks/sweet_tea.png', 
        price: 2.49, 
        category: FoodCategory.drinks, 
        availableAddons: [],
      ),
      Food(
        name: 'Fresh_Unsweet_Tea', 
        description: 
          'Freshly brewed unsweet tea, offering a refreshing and sugar-free option.', 
        imagePath: 'lib/images_bbq/drinks/unsweet_tea.png', 
        price: 2.49, 
        category: FoodCategory.drinks, 
        availableAddons: [
          Addon(name: 'Splenda', price: 0.49)
        ],
      ),

  ];

    final List<CartItem> _cart = [];
    String _deliveryAddress = '99 Hollywood Blv';


    //     G E T T E R S

    List<Food> get menu => _menu;
    List<CartItem> get cart => _cart;
    String get deliveryAddress => _deliveryAddress;


    //    O P E R A T I O N S

    // create cart
    

    // add to cart
    void addToCart(Food food, List<Addon> selectedAddons) {
      CartItem? cartItem = _cart.firstWhereOrNull((item) {
        bool isSameFood = item.food == food;

        bool isSameAddons =
                const ListEquality().equals(item.selectedAddons, selectedAddons);
        return isSameFood && isSameAddons;
      });
      if (cartItem != null) {
        cartItem.quantity++;
      }

    else{
      _cart.add(CartItem(
        food: food, 
        selectedAddons: selectedAddons,
        ),
      );
    }
    notifyListeners();

    }

    // remove from cart
    void removeFromCart(CartItem cartItem) {
      int cartIndex = _cart.indexOf(cartItem);

      if (cartIndex != -1) {
        if (_cart[cartIndex].quantity > 1) {
          _cart[cartIndex].quantity--;
        } else{
          _cart.removeAt(cartIndex);
        }
      }
    }

    // find total price of cart
    double getTotalPrice() {
      double total= 0.0;

      for (CartItem cartItem in _cart) {
        double itemTotal = cartItem.food.price;

        for (Addon addon in cartItem.selectedAddons) {
          itemTotal += addon.price;
        }
      total += itemTotal * cartItem.quantity;
      }
      return total;
    }

    // find total number of items in cart
    int getTotalItemCount() {
      int totalItemCount = 0;

      for(CartItem cartItem in _cart) {
        totalItemCount += cartItem.quantity;
      }
      return totalItemCount;
    }

    // clear cart
    void clearCart() {
      _cart.clear();
      notifyListeners();
    }

    void updateDeliveryAddress(String newAddress) {
      _deliveryAddress = newAddress;
      notifyListeners();
    }
    //    H E L P E R S

    // generate a receipt
    String displayCartReceipt() {
      final receipt = StringBuffer();
      receipt.writeln("Here's your receipt.");
      receipt.writeln();


      String formattedDate = DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now());

      receipt.writeln(formattedDate);
      receipt.writeln();
      receipt.writeln("----------");

      for (final cartItem in _cart) {
        receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}"
        );
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt
            .writeln("  Add-Ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      }
      receipt.writeln();
      receipt.writeln("----------");
      receipt.writeln("Total Items: ${getTotalItemCount()}");
      receipt.writeln("Total Price: ${_formatPrice(getTotalPrice())}");
      receipt.writeln();
      receipt.writeln("Delivering to: $deliveryAddress");

      return receipt.toString();
      
    }


    // format double value into money

    String _formatPrice(double price) {
      return "\$${price.toStringAsFixed(2)}";
    }

    // format list of addons into a string summary 
    String _formatAddons(List<Addon> addons) {
      return addons.map((addon) => '\$${addon.name} (${_formatPrice(addon.price)})').join(", ");
    }

}