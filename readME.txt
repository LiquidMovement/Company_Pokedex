# Requirements: 
- Must have "Pokedex" directory in .\APPDATA\local.
- config.json must be located within the Pokedex directory.
- CSV named pokedex_items.csv within the Pokedex directory or the path set in the config.json file (more on that below). Use the example pokedex_items.csv. Must have headers Node, Tag, Name, Path, Info.


# Config.json:
- "Path": "Default" sets the default path for the PS1 to read the CSV file from. If you are going to set a custom location, you must use double backslashes -- "C:\\users\\Joe\\Documents".
- Can set custom values for the Pokedex and it's inner workings such as BackColor & ForeColor for the various panels.
- "TypeBold" will control the style of the font. Can be Bold, Italic, Regular, etc.

# Menu Bar:
- File -- Options to open the Pokedex Directory within APPDATA, to Refresh the GUI in the event you or someone else made changes to the CSV manually, and to Quit.
- Edit -- Options to open the pokedex_items.csv and to open the config.json.
- Tools -- Option to Add a New Item to the csv. Pops open an additional GUI that prompts for Node, Tag, Name, Path, Info. Click Add to add the new entry and Close when you are finished adding items. Once the user clicks close, the Pokedex will automatically refresh and display the new additions.
- Help -- Not a whole lot there. Time is precious.

# I'm sure I missed something. Good luck and God speed.