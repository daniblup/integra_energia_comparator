Client.create!([
  {email: "prueba@gmail.com", postal_code: "33209", phone_number: "690282066"}
])
Comparative.create!([
  {current_cost: 500, integra_cost: 250, installation_cost: 60, amortization_term: 6.0, client_id: 1}
])
Comparative::HABTM_Products.create!([
  {comparative_id: 1, product_id: 1, amount: 3, hours_use: 2}
])
ComparativesProduct.create!([
  {comparative_id: 1, product_id: 1, amount: 3, hours_use: 2}
])
Product.create!([
  {name: "Downlight de 2 lámparas 26w", consumption_w: 52, name_equiv: "Dwonlight circular empotrable extraplano 18w. Luz cálida", consumption_w_equiv: 18, price_equiv: 19.9},
  {name: "Downlight superficie de 2 lámparas de 26w", consumption_w: 52, name_equiv: "Dwonlight circular de sup. extraplano 18w. Luz cálida", consumption_w_equiv: 18, price_equiv: 29.79},
  {name: "Lámpara incandescente 40w", consumption_w: 40, name_equiv: "Lámpara estándar 5w E-27. Luz cálida", consumption_w_equiv: 5, price_equiv: 4.5},
  {name: "Lámpara incandescente 50w", consumption_w: 50, name_equiv: "Lámpara estándar 7w E-27. Luz cálida", consumption_w_equiv: 7, price_equiv: 5.67},
  {name: "Lámpara incandescente 60w", consumption_w: 60, name_equiv: "Lámpara estándar 10w E-27. Luz cálida", consumption_w_equiv: 10, price_equiv: 7.53},
  {name: "Lámpara dicroica 40w GU10", consumption_w: 40, name_equiv: "Lámpara dicroica 6w GU10", consumption_w_equiv: 6, price_equiv: 5.43},
  {name: "Lámpara de vela incandescente 25w", consumption_w: 25, name_equiv: "Lámpara de vela opal 7w E-14", consumption_w_equiv: 7, price_equiv: 5.34},
  {name: "Tubo fluorescente 18w 600mm", consumption_w: 18, name_equiv: "Tubo T-8 10w 600mm", consumption_w_equiv: 10, price_equiv: 9.08},
  {name: "Tubo fluorescente 36w 1200mm", consumption_w: 36, name_equiv: "Tubo T-8 18w 1200mm. Luz fría", consumption_w_equiv: 18, price_equiv: 11.6},
  {name: "Tubo fluorescente 56w 1500mm", consumption_w: 56, name_equiv: "Tubo T-8 25w 1500mm. Luz fría", consumption_w_equiv: 25, price_equiv: 16.3},
  {name: "4 tubos fluorescentes de 18w 600mm", consumption_w: 72, name_equiv: "Panel opal 600x600. 40w", consumption_w_equiv: 40, price_equiv: 78.26}
])
Product::HABTM_Comparatives.create!([
  {comparative_id: 1, product_id: 1, amount: 3, hours_use: 2}
])
