require_relative 'sides'
# require 'pry'
require_relative 'generic'

class MainMenu
  include ::LunchLady
  def initialize
    @cont = false
    @main_order_arr=[]
    @main_arr =[
      {name: 'Veggie Salad', price: 8.99, quantity:0,description:"Quinoa,tomatoes,lettuce,spring green mix,olive,balsamic dressing",nutritional: {fat: 2,calories: 300}},
      {name: 'Pasta', price: 8.99, quantity:0,description:"Penne pasta with marinara sauce and cheese, tomatoes, brocolli",nutritional: {fat: 3,calories: 350}},
      {name: 'Tacos', price: 8.99, quantity:0,description:"chipotle flavoured beef with salsa and avocado dressing,",nutritional: {fat: 4,calories: 400}},
      {name: 'BBQ Fried chicken', price: 8.99, quantity:0,description:"Chicken fried in beer batter served with BBQ sauce.",nutritional:{fat:5,calories:450}}
    ]
    @sideclass = Sidemenu.new
    LunchLady.initialize
  end
  def mainMenu
    puts
    puts "=================="
    puts "Main Order"
    puts "=================="
    puts
    LunchLady.printMenu(@main_arr)
    selectMenu
    while @cont == true
      #binding.pry
      mainMenu
    end
  end
  def selectMenu
    puts
    puts "What do you want for main?"
    user_choice = gets.strip.to_i
    if(user_choice.to_i.between?(0,@main_arr.length))
      LunchLady.addingOrderFunction(@main_arr,user_choice.to_i)
      # binding.pry
    else
      puts
      puts "Please select from the above."
      mainMenu
    end
    puts
    puts "Anything else from the main menu? Please say yes or no"
    puts
    user_continue = gets.strip
  
    if user_continue.downcase.match('yes')
      @cont = true
    else
      puts
      puts "Do you want any sides? Please say yes or no"
      puts
      user_side_need = gets.strip
      if(user_side_need.downcase == 'yes')
        @sideclass.sideMenu
      end
      repeatOrder
      userConfirmation
    end 

  end

  def finalOrder
    total = 0.0
    total_calories = 0
    puts "The final Order is"
    puts "========================================"
    puts
    @@order_arr.each {|order| puts "#{order[:name]}\t\t*\t#{order[:quantity]}\t :  #{order[:price]}"}
    puts
    #binding.pry
    puts "========================================"
    @@order_arr.each {|order| total += order[:price].to_f} 
    @@order_arr.each {|order| total_calories += order[:nutritional][:calories]} 
    
    puts "Total Amount :                #{total}"
    puts "Total Calories :                #{total_calories}"
  end

  def repeatOrder
    puts
    puts "Repeat Order"
    puts "================"
    puts
    @@order_arr.each {|order| puts "#{order[:name]}\t\t*\t#{order[:quantity]}\t :  #{order[:price]}\n\n"}
    puts
  end

  def userConfirmation
      puts "Are you good? do you want to reorder?"
      puts "1) Reorder"
      puts "2) Confirm"
      user_confirm = gets.strip.to_i
      case user_confirm
        when 1
          initialize
          mainMenu
        when 2
          @cont = false
          finalOrder
          puts
          puts "GoodBye! Thank you for coming! Have a nice day ahead!"
        else
          puts "Please select 1 or 2"
          userConfirmation
      end
  end
end

main = MainMenu.new
main.mainMenu