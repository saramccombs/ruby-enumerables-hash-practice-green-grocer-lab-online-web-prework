def consolidate_cart(cart)
  new_cart = {}
  
  cart.map do |item|
    if new_cart[item.keys[0]]
      new_cart[item.keys[0]][:count] += 1 
    else 
      new_cart[item.keys[0]] = {
        price: item.values[0][:price],
        clearance: item.values[0][:clearance],
        count: 1 
      }
    end
  end
  new_cart
end

def apply_coupons(cart, coupons)
  coupons.each do |coupon|
    if cart.keys.include? coupon[:item]
      if cart[coupon[:item]][:count] >= coupon[:num]
        if cart["#{coupon[:item]} W/COUPON"]
          cart["#{coupon[:item]} W/COUPON"][:count] += coupon[:num]
        else
          cart["#{coupon[:item]} W/COUPON"] = {
          price: coupon[:cost]/coupon[:num],
          clearance: cart[coupon[:item]][:clearance],
          count: coupon[:num]
          }
        end 
        cart[coupon[:item]][:count] -= coupon[:num]
      end
    end
  end
  cart
end

def apply_clearance(cart)
  #visit each element in the cart hash 
  #check for clearance == TRUE
  #lookup :price
  #create discount_variable to hold dicsount amount
  #update :price, :price -= discount_variable.round(2)
  #return updated cart
  
  cart.map do |item|
    if item[:clearance]
      discount_variable = item[:price] * 0.20 
      item[:price] -= discount_variable.round(2)
    end
  end
  cart 
end

def checkout(cart, coupons)
  # code here
end
