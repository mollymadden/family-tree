require 'tty-prompt'

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


def display_all_people
# Read File data into 7 strings
data = []
File.open("test_family.csv","r").each { |line|
    data << line
}

# Split each string data 4 strings, and make a person, and add person to array.
person_array = []
data.each { |i|
    record =  i.split(",")
    this_person = Person.new(record[0],record[1],record[2],record[3])
    person_array << this_person
}

    # Just printing
    person_array.each { |p|
    puts p.name
    }
    
    end

def main_menu
    menu = @prompt.select("Main Menu", 
    ["1. Display all people", "2. Show maternal lineage", "3. Show paternal lineage", "4. Add a relative", "5. Exit"])

case menu
    when "1. Display all people"
        display_all_people
    when "2. Show maternal lineage"
    when "3. Show paternal lineage"
    when "4. Add a relative"
    when "5. Exit"
        system 'clear'
    end
end



main_menu

    # # Finding a value 
    # molly = person_array.find { |p|
    #     p.name == "Molly"
    # }
    
    # # Find another value
    # mat_id = molly.mat_id
    # mollymum = person_array.find { |p|
    #     p.id == mat_id
    # }
    
    # # puts mollymum