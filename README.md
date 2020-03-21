# mega-man-maker-level-editor

Mega Man Maker MMLV Editor is a work-in-progress software tool used to edit .mmlv files. It allows to modify level in the game that can bypass the Mega Man Maker limitations.

# Project Installation

```git
git clone https://github.com/Firstject/mega-man-maker-mmlv-editor.git
```

# About

Nowadays, text-editing level is becoming more frequent and tedious process which led to time-consuming. There are users which do not wish to create level provided by the limitations of the gameplay itself.

This editor allows a level file (.mmlv) to be modified or a new level to be created visually. The tilesets, objects, ladders, spikes, backgrounds, active screens, and level properties can be edited manually which gives the user more control over the limitations.

Below is a list of possibilities what can be edited and saved (from what we have tested):
- Tilemap
- Game objects
- Ladders
- Spikes
  - _Mega Man Maker will change the spike direction in the editor automatically, but not when directly playtesting the level._
- Level properties
- Screen connections
  - _Still tedious to edit_

And these which are currently possible but might not save correctly:
- Opening new active screens won't save some part of newly created tiles. To fix this, the user must save all active screens through Mega Man Maker first.
- Bosses data may be glitched when saved through mmlv editor. Please add the bosses last in Mega Man Maker.
- Weapon slot ids might be shifted when there are any open slot with 'Nothing' (empty slot).

> **NOTE:** Currently the program is not ready for editing. However, you can try playing around with the code by downloading [Godot engine](https://godotengine.org/) and open this project to edit levels.

# All MMM Data
https://docs.google.com/spreadsheets/d/1o_g1xckhSDx2NvyNrRFvDFh-b8bGlAUE3ay_zKcz84g/edit?usp=drivesdk

# Example Levels Made With MMLV Editor

**Against the Ruined Pressure**
https://megamanmaker.com/?level=385754

**Minecraft Man**
https://megamanmaker.com/?level=386668

**Yoku Man**
https://megamanmaker.com/?level=386428

**Impregnable Fortress**
https://megamanmaker.com/?level=387336
