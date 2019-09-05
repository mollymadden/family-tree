require 'tty-prompt'
require 'colorize'
require 'tty-tree'
require 'csv'
require 'pry'
require 'google_search_results'


# client = GoogleSearchResults.new(q: "coffee", serp_api_key: "secret_api_key" )
# hash_results = client.get_hash

family_tree = []

@prompt = TTY::Prompt.new


def you(family_tree)
    gender = ""

    puts "Family Tree"
    puts "what is your first name?"
    print "> "
    name = gets.chomp

    puts "year of birth?"
    print "> "
    dob = gets.chomp

    puts "place of birth? City, State"
    print "> "
    pob = gets.chomp

    gender = @prompt.select("Gender?",
    ["Male", "Female"])

    you = {
        name: name,
        gender: gender,
        date_of_birth: dob,
        birthplace: pob,
        relationship: "self"
    }
   
    puts "your family tree has been created! begin adding family members"
    family_tree << you
end

you(family_tree)

def add_person(family_tree)

    gender = ""

    relationship = @prompt.select("Who would you like to add?",
    ["Mother", "Father", "Brother", "Sister", "Daughter", "Son", "Go Back"])

    if relationship == "Go Back"
        person_menu(family_tree)
    end

    puts "first name?"
    print "> "
    name = gets.chomp

    puts "year of birth?"
    print "> "
    dob = gets.chomp.to_i

    puts "birthplace? City, State"
    print "> "
    pob = gets.chomp
        
        if relationship == "father" || relationship == "brother" || relationship == "son"
            gender = "male" 
        else
            gender = "female"
        end

    person = {
        name: name,
        gender: gender,
        date_of_birth: dob,
        birthplace: pob,
        relationship: relationship
    }

    family_tree << person

    puts "your relative has been added"
    person_menu(family_tree)

end

def view_person(family_tree)
    puts "who would you like to view?"
    print "> "
    name = gets.chomp
    family_tree.each do |person| 
        if person[:name] == name
            puts "Name: #{person[:name]}"
            puts "Year of Birth: #{person[:date_of_birth]}"
            puts "Place of Birth: #{person[:birthplace]}"
            puts "Relationship: #{person[:relationship]}"

            # family_tree.each do |person| 
            #     if person[:gender] == "male"
            #         view_person(family_tree).colorize(:blue)
            #     else
            #         view_person(family_tree).colorize(:pink)
            #         self
            #     end
            # end
        end
        
end

person_menu(family_tree)

end

def main_menu(family_tree)
    menu = @prompt.select("Main Menu", 
    ["Edit family tree", "View family tree", "Export family tree", "Exit"])
    case menu
    when "Edit family tree"
        person_menu(family_tree)
    when "View family tree"
        # puts tree.render
        # main_menu(family_tree)
    # when "Export family tree"
    #     # CSV.open("family.csv", "a+") do |csv|
    #     #     csv << family_tree
    #     #     puts "your tree has been exported to family.csv"
    #     #     main_menu
    when "Exit"
        system 'clear'
end
end


def person_menu(family_tree)
    user_input = @prompt.select("Menu", 
    ["Add a person", "View a person", "Return to main menu"])

    case user_input
    when "Add a person"
        add_person(family_tree)
    when "View a person"
        view_person(family_tree)
    when "Return to main menu"
        main_menu(family_tree)
    end
end

person_menu(family_tree)


