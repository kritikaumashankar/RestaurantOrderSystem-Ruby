module LunchLady
  # require 'pry'
  attr_accessor :total
  def self.initialize
  @@order_arr = Array.new
  end
  def self.printMenu(arr)

    arr.each_with_index do |main,index| 
      puts "#{index+1}) #{main[:name]}\t\t #{main[:price]}\n#{main[:description]}"
      # binding.pry
     puts "Fat: #{main[:nutritional][:fat]}%\t\t Calories: #{main[:nutritional][:calories]}"
    end
  end

  def self.addingOrderFunction(arr,user_choice)
      index = user_choice -1
      cond = @@order_arr.any? {|h| h[:name] == arr[index][:name]}
              if(!@@order_arr.empty? && @@order_arr.any? {|h| h[:name] == arr[index][:name]})
                    hash1 = @@order_arr.find { |h| h[:name] == arr[index][:name]}
                    hash1[:quantity]+=1
                    hash1[:price] = hash1[:price] * hash1[:quantity]
                    @@order_arr.each do |order|
                      if order[:name] == hash1[:name]
                        order[:quantity] = hash1[:quantity]
                        order[:price] = hash1[:price]
                      end
                    end
              else
                arr[index][:quantity] = 1
                @@order_arr << arr[index]
                @@order_arr.each {|order| puts "#{order[:name]} :::::: Quantity:#{order[:quantity]}"}  
              end
        # puts @@order_arr
    end   
    
end