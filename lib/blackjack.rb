require 'pry'

def welcome
  puts "Welcome to the Blackjack Table"
end

def deal_card(card_total=0)
  return card_total += rand(1...11)
end

def display_card_total(card_total)
  puts "Your cards add up to #{card_total}"
end

def prompt_user
  puts "Type 'h' to hit or 's' to stay"
end

def get_user_input
  return gets.chomp
end

def end_game(card_total)
  puts "Sorry, you hit #{card_total}. Thanks for playing!"
end

def initial_round
  card_one = deal_card
  card_total = deal_card(card_one)
  display_card_total(card_total)
  return card_total
end

def hit?(card_total)
  prompt_user
  reply = get_user_input
  if reply == "s"
    hit?(card_total)
  elsif reply == "h"
    deal_card(card_total)
  else
    invalid_command(card_total)
  end
  return card_total
end

def invalid_command(card_total)
  puts "Please enter a valid command"
end

#####################################################
# get every test to pass before coding runner below #
#####################################################

def runner
  welcome
  card_total = initial_round
 
  until card_total > 21
    card_total += hit?(card_total)
  end
  end_game(card_total)
end
    
