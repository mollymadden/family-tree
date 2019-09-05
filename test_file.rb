require 'tty-prompt'
require 'colorize'

class Person
    attr_accessor :id, :name, :mat_id, :pat_id
        def initialize(id,name,mat_id,pat_id)
            @id = id
            @name = name
            @mat_id = mat_id
            @pat_id = pat_id
        end

        def to_s
            "id: " + @id.to_s + " name: " + @name + " mat_id: " + @mat_id.to_s + " pat_id: " + @pat_id.to_s
        end
    end

    @prompt = TTY::Prompt.new



def display_all_people(person_array)

        # Just printing
        person_array.each { |p|
            puts p.name
        }
        
end

def load_from_file
        # Read File data into 7 strings
        data = []
        File.open("test_family.csv","r").each { |line|
            data << line
        }

        person_array = []
        # Split each string data 4 strings, and make a person, and add person to array.
        data.each { |i|
            record =  i.split(",")
            this_person = Person.new(record[0],record[1],record[2],record[3])
            person_array << this_person
        }
        person_array
end

# def example_of_find




# end

# def show_maternal(person_array)
#     # Finding a value 
#     molly = person_array.find { |p|
#         # p.name == "Molly"
#     }
    
#     # Find another value
#     mat_id = molly.mat_id
#     mollymum = person_array.find { |p|
#         # p.id == mat_id
#     }
    
#     # puts mollymum
# end

def person_menu(person_array)
    menu_array = []
    person_array.each { |p|
        menu_array << p.name
    }
    selection = @prompt.select("Display All", menu_array)

    # selection now contains person name "Rhoda"
    # search the person_array for a person with the name Rhoda
    # and then get the mat_id from Rhoda
    # and then search the person_array again for a person with the id == Rhoda's mat_id.
    person_array = load_from_file

    found_person = person_array.find { |p|
        p.name == search_name
    }

    # selection = search_name 

    found_person_id = found_person.id
    found_person_mat_id = found_person.mat_id
    found_person_name = found_person.name

    puts "#{search_name}'s mother was #{found_person.name}"

end

def main_menu()
    menu = @prompt.select("Main Menu", 
    ["1. Display all people", "2. Show maternal lineage", "3. Show paternal lineage", "4. Add a relative", "5. Exit"])

    case menu
        when "1. Display all people"
            display_all_people(load_from_file)
        when "2. Show maternal lineage"
            person_menu(load_from_file)
        when "3. Show paternal lineage"
        when "4. Add a relative"
        when "5. Exit"
            system 'clear'
    end
end


# loop do
main_menu()
# end


# def person_menu(person_array)
#     person_menu = @prompt.select("Display All", person_array)
# end



