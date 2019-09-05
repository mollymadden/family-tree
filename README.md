in order to run the file you will need the following gem
> 'tty-prompt'

download and unzip file titled Molly-Madden-Family-Tree.zip
read through this README.md thoroughly

The intention of this program is to collate large amounts of unreadable data in an easy to read way.

Beginning with a CSV file exported from a geneaology website such as ancestry.com or myheritage.com, this CSV file will need to adhere to a standard format of 

ID, name, mat_id, pat_id

These values are indicative of a numerical identifier, a person’s name, their mother and father’s unique identifiers (must also appear in file or show 0) respectively.

Mat_id and pat_id stand for “maternal id” and “paternal id” respectively.

By way of example, please see below.

ID,name,mat_id,pat_id
1,Jimmy,2,3
2,Tina,4,5
3,John,0,0
4,Kylie,0,0
5,Gotye,0,0

In this example, Jimmy is the son of Tina and John. Tina is the daughter of Kylie and Gotye. John, Kylie, and Gotye’s parents are unknown.

Once the CSV file has been established- for example ‘people.csv’ please make note of this file name and save to the same directory as the family_tree.rb file

In order to link the CSV file to the family_tree.rb tool, you must use the ARGV argument by typing the following into terminal:

ruby family_tree.rb “people.csv”

the tool has the following functions:
•	view all people by NAME within your CSV file.
•	Choose whether you would like to view a person’s maternal or paternal lineage
•	View lineage
•	Choose again
•	Exit
