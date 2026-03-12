import random

prefixes=['xX','The','Mr','Pro','Elite','Captain','Dark','Blue','Red','Green','Gold','Silver','Ultra','Mega','Hyper','Shadow','Ninja','Dr','Sir','Lady','Queen','King','Ace','Turbo','Legend','Alpha','Beta','Gamma','Net','Cyber','Giga','Pixel','Razor','Stealth','Ghost','Phantom','Storm','Blaze','Fire','Ice','Frost','Thunder','Bolt','Strike','Crusher','Killer','Sniper','Mage','Wizard','Knight','Samurai','Pirate','Rogue','Hunter','Warrior','Champion','Viper','Venom','Beast','Raven','Falcon','Tiger','Lion','Wolf','Eagle']
suffixes=['101','X','Master','Gamer','Pro','Elite','HD','360','9000','99','Gaming','Play','Force','Power','Zone','Rush','Xtreme','Legend','Hero','Boss','King','Queen','Lord','Dude','Bro','Guy','Girl','Chick','Ninja','Wizard','Knight','Samurai','Rogue','Rider','Pilot','Driver','Sniper','Hunter','Slayer','Crusher','Destroyer','Assassin','Dragon','Phoenix','Blade','Arrow','Bow','Hammer','Gun','Shark','Whale','Squid','Gator','Bear','Lion','Panther','Jaguar','Cobra','Viper','Python','Hawk','Falcon','Jet','Rocket','Comet','Meteor','Galaxy','Star','Planet','Orbit','Space','Mars','Venus','Jupiter','Saturn','UFO','Alien','Zombie','Vampire','Werewolf','Ghost','Spirit','Dream','Night','Day','Dawn','Dusk','Storm','Rain','Snow','Ice','Fire','Flame','Ember','Flash','Lightning','Thunder','Volta','Volt','Byte','Bit','Pixel','Frame','Cache','Core','Loop','Bug','Hack','Code','Script','Binary','Hex','Macro','Micro','Nano','Quantum','Vector','Matrix','Cipher','Crypto','Rogue','Shadow']
soccerWords=['Kick','Goal','Strike','Pass','Dribble','Tackle','Header','Corner','FreeKick','Penalty','Foul','Offside','Ref','Coach','Team','Match','League','Cup','Champ','Goalie','Striker','Midfielder','Defender','Wing','Captain','Boot','Cleats','Stadium','Pitch','Field','Grass','Volley','Shoot','Score','Keeper','Jersey','Manager','Sub','Trainer']

# blacklist simple patterns
blacklist=['StealthStealth','DarkDark','FrostFrost','StrikeStrike','CrusherCrusher','FireFire']


def generate_tag():
    form=random.choice([1,2,3,4])
    if form==1:
        return random.choice(prefixes)+random.choice(suffixes)
    elif form==2:
        a=random.choice(prefixes)
        b=random.choice(prefixes)
        return a+b
    elif form==3:
        return random.choice(prefixes)+random.choice(soccerWords)
    else:
        return random.choice(soccerWords)+random.choice(suffixes)


tags=set()
while len(tags)<5000:
    t=generate_tag()
    if t in blacklist: continue
    # filter prefix==suffix or repeated
    parts=[t[i:j] for i in range(len(t)) for j in range(i+1,len(t)+1)]
    # crude remove when word appears twice
    if any(t.count(w)>1 and len(w)>2 for w in parts):
        continue
    tags.add(t)

with open('bots/gamertags.txt','w') as f:
    for t in tags:
        f.write(t+'\n')
print('generated',len(tags))
