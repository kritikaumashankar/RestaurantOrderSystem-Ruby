require_relative 'generic'

class Sidemenu 
  include ::LunchLady
  def initialize
    @sides_order_arr=[]
    @sides_arr =[
      {name: 'Fries', price: 2.99, quantity:0,description:"",nutritional:{fat:3,calories:300}},
      {name: 'Salad', price: 2.99, quantity:0,description:"",nutritional:{fat:2,calories:300}},
      {name: 'Soda', price: 2.99, quantity:0,description:"",nutritional:{fat:4,calories:300}},
      {name: 'Bread sticks', price: 2.99, quantity:0,description:"",nutritional:{fat:3,calories:300}}
    ]
  end
  def sideMenu
    puts
    puts "=================="
    puts "Side Order"
    puts "==================\n"
    # @sides_arr.each_with_index {|main,index| puts "#{index+1}) #{main[:name]}\t\t #{main[:price]}"}
    LunchLady.printMenu(@sides_arr)
    puts "What do you want for sides?\n"
      user_main_choice = gets.strip
      selectSides(user_main_choice)
  end
  def selectSides(user_choice)

    if(user_choice.to_i.between?(0,@sides_arr.length))
      LunchLady.addingOrderFunction(@sides_arr,user_choice.to_i)
    else
      puts "\nPlease select from the above."
    end
    puts "\nAnything else in side menu?"
    user_continue = gets.strip
    if user_continue.downcase.match('yes')
      sideMenu
    elsif !user_continue.downcase.match('no')
      puts "\nPlease say yes or no."
      sideMenu
    end
  end 
end

#  side = Sidemenu.new
#  side.side_menu
