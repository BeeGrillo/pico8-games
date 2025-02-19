# Maiden Quest

## Places

### Capitol

### Village of Stonecliff

### Village of Fairwick

### City of Windford

## Characters

### Capitol Lord

He only  talks to the maiden if she has a specific reputation score or greater (value?). Nobody refers him by his real name.

### Guild Master Ketil

He is passionate about exploration, but rarely travels now due to the road perils. From time to time, might need help to go from a place to another.

### Big Bad Boss Vidar

From the realms above, the winter is usualy a nice time for viking. So Vidar travels south for booting and destruction. Not really a bad character, but might look ruthless due to need and to prevent any heroic person from taking a stupid action like confronting him. 

### Others
- Guild Master's Daugther __Audhild__
- Pilgrim __Kara__ (bent)
- Village Elder woman __Asa__ (goddess)
- Village Elder man __Magni__ (strong)
- Pub owner __Bodil__ (remedy)
- Pub owner husband __Trygve__ (thrustworthy)
- Pub son __Ebbe__ (wild boar)
- Pub son's boyfriend __Asger__ (god-spear)
- Drunkards __Dane__ (from denmark), __Baggi__ (bag, pack), __Fritjof__ (thief of peace)
- City guard chef __Olaf__(ancestor's rage)
- Hunter __Ivor__ (Yew bow)
- Huntress __Nanna__ (daring, brave)
- Huntress wife __Eidunn__ (Happiness, gift)
- Orphan __Torny__ (new)

## Quests
1. Get __x items__, take to __destination__
1. Take __object__ from __origin__ to __Destination__
1. Donate __x gold coins__ to __destination__
1. Accompany __person/caravan__ to __destination__
1. Accompany __person/caravan__ from __origin__
1. Defeat __x enemies__
1. Rescue __person__ from __miniboss__ at __origin__
1. Capture __miniboss__ at __origin__, and take them to __destination__
1. Patroll __destination__
1. Look for evidences of __miniboss__ at __destination__

### Object
```
label: string
    How the quest is displaied on screen

desc: function
    What function is used to create de quest text

text_pre: function
    what text is displayed when viewing the quest prior choosing

text_pos: function
    what text is displayed uppon finishing quest

item: string/id?
    what item to find/gather/secure. nullable?

obj: int
    how many of said item you have to find/gather/secure. nullable?

current: int
    how many of said item you have already find/gather/secure. nullable?

dest: string/id?
    place where to go, or take item/person/caravan.

orig: string/id?
    place  you must go through before going to the destination. nullable

went: bool
    marks if you went to said destination. nullable

patrol: bool
    if must patrol destination. nullable

patrolled: bool
    if area was patroled. nullable

enemies: list
    list of enemies to defeat. nullable

defeated: int
    how many enemies where defeated

completed: function
    runs to check if  the quest was succesfully resolved. Runs over current_location == destination
```
