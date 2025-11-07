# Ledger Safe Backup - example

## Write a DVD with the image of a secure OS
E.g. for Tails, see instructions here: 
https://tails.net/install/index.en.html

Burning Tails to a DVD,
https://tails.net/install/dvd/index.en.html

## Boot Tails from DVD

## Open a terminal window, install SLIP39
```
# Source: https://github.com/pjkundert/python-slip39
# Article: https://slip39.com/
# Package description: https://pypi.org/project/slip39/
$ python3 -m venv env
$ source env/bin/activate
$ pip install slip39
$ pip install eth_account 
```

## Generate SLIP39 shares and a 256-bit seed
```
$ seed=`slip39 -v --bits 256 --show --no-card`
2025-11-07 08:29:28 slip39           SLIP-39 for SLIP39 from 256-bit Entropy directly
2025-11-07 08:29:28 slip39           Generated 256-bit SLIP-39 Mnemonics w/ identifier 23020 requiring 2 of 4 (extendable) groups to recover
2025-11-07 08:29:28 slip39           First(1/1): Recover w/ 2 of 4 groups First(1), Second(1), Fam(2/4), Frens(3/6)
2025-11-07 08:29:28 slip39           1st  1 quiet     12 burning   23 dining
2025-11-07 08:29:28 slip39                2 graduate  13 remember  24 mineral
2025-11-07 08:29:28 slip39                3 acrobat   14 budget    25 cradle
2025-11-07 08:29:28 slip39                4 romp      15 necklace  26 fused
2025-11-07 08:29:28 slip39                5 agree     16 admit     27 clogs
2025-11-07 08:29:28 slip39                6 depart    17 ting      28 alarm
2025-11-07 08:29:28 slip39                7 velvet    18 lamp      29 group
2025-11-07 08:29:28 slip39                8 soldier   19 pencil    30 flash
2025-11-07 08:29:28 slip39                9 welcome   20 budget    31 avoid
2025-11-07 08:29:28 slip39               10 promise   21 unfold    32 literary
2025-11-07 08:29:28 slip39               11 fortune   22 expect    33 arena
2025-11-07 08:29:28 slip39           Second(1/1):
2025-11-07 08:29:28 slip39           1st  1 quiet     12 hospital  23 genius
2025-11-07 08:29:28 slip39                2 graduate  13 costume   24 woman
2025-11-07 08:29:28 slip39                3 beard     14 reunion   25 cylinder
2025-11-07 08:29:28 slip39                4 romp      15 disease   26 burden
2025-11-07 08:29:28 slip39                5 again     16 meaning   27 firefly
2025-11-07 08:29:28 slip39                6 impact    17 pants     28 taxi
2025-11-07 08:29:28 slip39                7 herald    18 impact    29 primary
2025-11-07 08:29:28 slip39                8 fraction  19 salon     30 beyond
2025-11-07 08:29:28 slip39                9 educate   20 lift      31 advance
2025-11-07 08:29:28 slip39               10 shaft     21 human     32 slap
2025-11-07 08:29:28 slip39               11 pile      22 prospect  33 software
2025-11-07 08:29:28 slip39           Fam(2/4):
2025-11-07 08:29:28 slip39           1st  1 quiet     12 single    23 dynamic
2025-11-07 08:29:28 slip39                2 graduate  13 punish    24 superior
2025-11-07 08:29:28 slip39                3 ceramic   14 daughter  25 being
2025-11-07 08:29:28 slip39                4 roster    15 reaction  26 insect
2025-11-07 08:29:28 slip39                5 aircraft  16 ambition  27 payment
2025-11-07 08:29:28 slip39                6 episode   17 peasant   28 species
2025-11-07 08:29:28 slip39                7 dilemma   18 segment   29 idea
2025-11-07 08:29:28 slip39                8 recover   19 flea      30 phantom
2025-11-07 08:29:28 slip39                9 cricket   20 damage    31 blimp
2025-11-07 08:29:28 slip39               10 guilt     21 debut     32 tricycle
2025-11-07 08:29:28 slip39               11 explain   22 violence  33 rapids
2025-11-07 08:29:28 slip39           2nd  1 quiet     12 genuine   23 gather
2025-11-07 08:29:28 slip39                2 graduate  13 curious   24 soldier
2025-11-07 08:29:28 slip39                3 ceramic   14 strike    25 arena
2025-11-07 08:29:28 slip39                4 scared    15 umbrella  26 discuss
2025-11-07 08:29:28 slip39                5 amuse     16 resident  27 famous
2025-11-07 08:29:28 slip39                6 finger    17 diagnose  28 writing
2025-11-07 08:29:28 slip39                7 genius    18 garlic    29 ting
2025-11-07 08:29:28 slip39                8 inform    19 dance     30 ruler
2025-11-07 08:29:28 slip39                9 flavor    20 family    31 glance
2025-11-07 08:29:28 slip39               10 float     21 preach    32 review
2025-11-07 08:29:28 slip39               11 prisoner  22 advocate  33 actress
2025-11-07 08:29:28 slip39           3rd  1 quiet     12 wireless  23 legend
2025-11-07 08:29:28 slip39                2 graduate  13 numerous  24 picture
2025-11-07 08:29:28 slip39                3 ceramic   14 empty     25 medal
2025-11-07 08:29:28 slip39                4 shadow    15 acquire   26 dance
2025-11-07 08:29:28 slip39                5 apart     16 alien     27 fluff
2025-11-07 08:29:28 slip39                6 provide   17 disease   28 lungs
2025-11-07 08:29:28 slip39                7 often     18 slim      29 game
2025-11-07 08:29:28 slip39                8 change    19 radar     30 crazy
2025-11-07 08:29:28 slip39                9 rumor     20 rescue    31 album
2025-11-07 08:29:28 slip39               10 memory    21 both      32 element
2025-11-07 08:29:28 slip39               11 museum    22 pacific   33 change
2025-11-07 08:29:28 slip39           4th  1 quiet     12 firefly   23 system
2025-11-07 08:29:28 slip39                2 graduate  13 aircraft  24 prevent
2025-11-07 08:29:28 slip39                3 ceramic   14 quick     25 merit
2025-11-07 08:29:28 slip39                4 sister    15 forward   26 glen
2025-11-07 08:29:28 slip39                5 acid      16 ranked    27 plains
2025-11-07 08:29:28 slip39                6 presence  17 prevent   28 petition
2025-11-07 08:29:28 slip39                7 sled      18 hand      29 shame
2025-11-07 08:29:28 slip39                8 uncover   19 salary    30 exhaust
2025-11-07 08:29:28 slip39                9 retreat   20 security  31 idea
2025-11-07 08:29:28 slip39               10 river     21 marathon  32 bishop
2025-11-07 08:29:28 slip39               11 involve   22 hamster   33 mule
2025-11-07 08:29:28 slip39           Frens(3/6):
2025-11-07 08:29:28 slip39           1st  1 quiet     12 havoc     23 axle
2025-11-07 08:29:28 slip39                2 graduate  13 provide   24 purchase
2025-11-07 08:29:28 slip39                3 decision  14 blind     25 yelp
2025-11-07 08:29:28 slip39                4 round     15 argue     26 unhappy
2025-11-07 08:29:28 slip39                5 activity  16 hybrid    27 ugly
2025-11-07 08:29:28 slip39                6 work      17 welfare   28 royal
2025-11-07 08:29:28 slip39                7 process   18 charity   29 blessing
2025-11-07 08:29:28 slip39                8 visitor   19 ancient   30 much
2025-11-07 08:29:28 slip39                9 formal    20 antenna   31 spend
2025-11-07 08:29:28 slip39               10 type      21 frequent  32 username
2025-11-07 08:29:28 slip39               11 plan      22 rapids    33 realize
2025-11-07 08:29:28 slip39           2nd  1 quiet     12 problem   23 depart
2025-11-07 08:29:28 slip39                2 graduate  13 replace   24 stilt
2025-11-07 08:29:28 slip39                3 decision  14 detailed  25 firefly
2025-11-07 08:29:28 slip39                4 scatter   15 busy      26 replace
2025-11-07 08:29:28 slip39                5 alpha     16 prayer    27 enlarge
2025-11-07 08:29:28 slip39                6 gesture   17 segment   28 intimate
2025-11-07 08:29:28 slip39                7 lungs     18 spine     29 coastal
2025-11-07 08:29:28 slip39                8 erode     19 very      30 geology
2025-11-07 08:29:28 slip39                9 suitable  20 carbon    31 lamp
2025-11-07 08:29:28 slip39               10 teaspoon  21 repeat    32 harvest
2025-11-07 08:29:28 slip39               11 busy      22 cover     33 frost
2025-11-07 08:29:28 slip39           3rd  1 quiet     12 tofu      23 airline
2025-11-07 08:29:28 slip39                2 graduate  13 syndrome  24 improve
2025-11-07 08:29:28 slip39                3 decision  14 false     25 warmth
2025-11-07 08:29:28 slip39                4 shaft     15 process   26 campus
2025-11-07 08:29:28 slip39                5 adult     16 hawk      27 ting
2025-11-07 08:29:28 slip39                6 acrobat   17 educate   28 deploy
2025-11-07 08:29:28 slip39                7 slap      18 march     29 prayer
2025-11-07 08:29:28 slip39                8 parcel    19 gesture   30 freshman
2025-11-07 08:29:28 slip39                9 counter   20 shaft     31 chubby
2025-11-07 08:29:28 slip39               10 style     21 blanket   32 year
2025-11-07 08:29:28 slip39               11 join      22 purple    33 kidney
2025-11-07 08:29:28 slip39           4th  1 quiet     12 chew      23 coal
2025-11-07 08:29:28 slip39                2 graduate  13 spider    24 bucket
2025-11-07 08:29:28 slip39                3 decision  14 improve   25 failure
2025-11-07 08:29:28 slip39                4 skin      15 rhyme     26 equip
2025-11-07 08:29:28 slip39                5 aircraft  16 pumps     27 elegant
2025-11-07 08:29:28 slip39                6 ounce     17 keyboard  28 lizard
2025-11-07 08:29:28 slip39                7 trip      18 item      29 news
2025-11-07 08:29:28 slip39                8 capacity  19 often     30 prayer
2025-11-07 08:29:28 slip39                9 plan      20 symbolic  31 magazine
2025-11-07 08:29:28 slip39               10 staff     21 very      32 graduate
2025-11-07 08:29:28 slip39               11 skunk     22 curly     33 music
2025-11-07 08:29:28 slip39           5th  1 quiet     12 arena     23 hesitate
2025-11-07 08:29:28 slip39                2 graduate  13 violence  24 bulge
2025-11-07 08:29:28 slip39                3 decision  14 subject   25 fatigue
2025-11-07 08:29:28 slip39                4 snake     15 grant     26 pajamas
2025-11-07 08:29:28 slip39                5 avoid     16 math      27 luck
2025-11-07 08:29:28 slip39                6 ancestor  17 briefing  28 energy
2025-11-07 08:29:28 slip39                7 suitable  18 violence  29 method
2025-11-07 08:29:28 slip39                8 flip      19 transfer  30 estate
2025-11-07 08:29:28 slip39                9 brother   20 necklace  31 sister
2025-11-07 08:29:28 slip39               10 window    21 swimming  32 viral
2025-11-07 08:29:28 slip39               11 pancake   22 oven      33 blind
2025-11-07 08:29:28 slip39           6th  1 quiet     12 shaft     23 exhaust
2025-11-07 08:29:28 slip39                2 graduate  13 yelp      24 idle
2025-11-07 08:29:28 slip39                3 decision  14 width     25 width
2025-11-07 08:29:28 slip39                4 spider    15 inmate    26 video
2025-11-07 08:29:28 slip39                5 analysis  16 firm      27 chubby
2025-11-07 08:29:28 slip39                6 mountain  17 clock     28 usual
2025-11-07 08:29:28 slip39                7 withdraw  18 activity  29 payment
2025-11-07 08:29:28 slip39                8 thumb     19 beard     30 reunion
2025-11-07 08:29:28 slip39                9 nervous   20 marvel    31 gross
2025-11-07 08:29:28 slip39               10 visual    21 divorce   32 human
2025-11-07 08:29:28 slip39               11 blind     22 activity  33 wrote
2025-11-07 08:29:28 slip39.layout    ETH    m/44'/60'/0'/0/0    : 0x0e0789E9E8Cc102Ef2550C65d054416D56b5c63A
2025-11-07 08:29:28 slip39.layout    BTC    m/84'/0'/0'/0/0     : bc1qs6nwh0axd64kclmsmyd20w9xcmj4w5f8yk4xny

$ rnd256=$(echo "$seed" | awk 'match($0, /0x[0-9a-fA-F]+/) {print substr($0, RSTART+2, RLENGTH-2)}')

$ echo $rnd256
4d2fd549a041921cec8a8d2a90d9f438d6a5cec74d1cd256fd5f5a2955c182d1
```

## Make 768-bit OTP from 256-bit Master Seed
```
$ otp=$(echo -n "$rnd256" | sha512sum | cut -d' ' -f1)$(echo -n "$rnd256" | sha256sum | cut -d' ' -f1)
$ echo $otp
56bd8320d39726861af67a627f26251188d3c065d1dd67debb5e0378e292db7c33ee705a2464c69021daa3a638640a0a293c7c03e3dd4aaaff6fb41ad7154d4e1393dfefa12e5a0da9bf839abf8dc3ba77be579c46d39846a3440be440c3f85a
```

# Generate SHA256 of OTP 
```
$ echo -n $otp | sha256sum
d361cb9f08c74c6cfba2ae765ff9ade9b031252b69587e15e2c976813c4a46b9  -
```

## Write down OTP, checksum and SLIP39 shares on a piece of paper
```
OTP:
56bd8320 d3972686 1af67a62 7f262511 
88d3c065 d1dd67de bb5e0378 e292db7c 
33ee705a 2464c690 21daa3a6 38640a0a 
293c7c03 e3dd4aaa ff6fb41a d7154d4e 
1393dfef a12e5a0d a9bf839a bf8dc3ba
77be579c 46d39846 a3440be4 40c3f85a

First 8 hexa digit of SHA256(OTP), i.e. checksum(OTP):
d361cb9f

SLIP39 
Generated 256-bit SLIP-39 Mnemonics w/ identifier 23020 requiring 2 of 4 (extendable) groups to recover
First(1/1): Recover w/ 2 of 4 groups First(1), Second(1), Fam(2/4), Frens(3/6)
           1st  1 quiet     12 burning   23 dining
                2 graduate  13 remember  24 mineral
                3 acrobat   14 budget    25 cradle
                4 romp      15 necklace  26 fused
                5 agree     16 admit     27 clogs
                6 depart    17 ting      28 alarm
                7 velvet    18 lamp      29 group
                8 soldier   19 pencil    30 flash
                9 welcome   20 budget    31 avoid
               10 promise   21 unfold    32 literary
               11 fortune   22 expect    33 arena
           Second(1/1):
           1st  1 quiet     12 hospital  23 genius
                2 graduate  13 costume   24 woman
                3 beard     14 reunion   25 cylinder
                4 romp      15 disease   26 burden
                5 again     16 meaning   27 firefly
                6 impact    17 pants     28 taxi
                7 herald    18 impact    29 primary
                8 fraction  19 salon     30 beyond
                9 educate   20 lift      31 advance
               10 shaft     21 human     32 slap
               11 pile      22 prospect  33 software
           Fam(2/4):
           1st  1 quiet     12 single    23 dynamic
                2 graduate  13 punish    24 superior
                3 ceramic   14 daughter  25 being
                4 roster    15 reaction  26 insect
                5 aircraft  16 ambition  27 payment
                6 episode   17 peasant   28 species
                7 dilemma   18 segment   29 idea
                8 recover   19 flea      30 phantom
                9 cricket   20 damage    31 blimp
               10 guilt     21 debut     32 tricycle
               11 explain   22 violence  33 rapids
           2nd  1 quiet     12 genuine   23 gather
                2 graduate  13 curious   24 soldier
                3 ceramic   14 strike    25 arena
                4 scared    15 umbrella  26 discuss
                5 amuse     16 resident  27 famous
                6 finger    17 diagnose  28 writing
                7 genius    18 garlic    29 ting
                8 inform    19 dance     30 ruler
                9 flavor    20 family    31 glance
               10 float     21 preach    32 review
               11 prisoner  22 advocate  33 actress
           3rd  1 quiet     12 wireless  23 legend
                2 graduate  13 numerous  24 picture
                3 ceramic   14 empty     25 medal
                4 shadow    15 acquire   26 dance
                5 apart     16 alien     27 fluff
                6 provide   17 disease   28 lungs
                7 often     18 slim      29 game
                8 change    19 radar     30 crazy
                9 rumor     20 rescue    31 album
               10 memory    21 both      32 element
               11 museum    22 pacific   33 change
           4th  1 quiet     12 firefly   23 system
                2 graduate  13 aircraft  24 prevent
                3 ceramic   14 quick     25 merit
                4 sister    15 forward   26 glen
                5 acid      16 ranked    27 plains
                6 presence  17 prevent   28 petition
                7 sled      18 hand      29 shame
                8 uncover   19 salary    30 exhaust
                9 retreat   20 security  31 idea
               10 river     21 marathon  32 bishop
               11 involve   22 hamster   33 mule
           Frens(3/6):
           1st  1 quiet     12 havoc     23 axle
                2 graduate  13 provide   24 purchase
                3 decision  14 blind     25 yelp
                4 round     15 argue     26 unhappy
                5 activity  16 hybrid    27 ugly
                6 work      17 welfare   28 royal
                7 process   18 charity   29 blessing
                8 visitor   19 ancient   30 much
                9 formal    20 antenna   31 spend
               10 type      21 frequent  32 username
               11 plan      22 rapids    33 realize
           2nd  1 quiet     12 problem   23 depart
                2 graduate  13 replace   24 stilt
                3 decision  14 detailed  25 firefly
                4 scatter   15 busy      26 replace
                5 alpha     16 prayer    27 enlarge
                6 gesture   17 segment   28 intimate
                7 lungs     18 spine     29 coastal
                8 erode     19 very      30 geology
                9 suitable  20 carbon    31 lamp
               10 teaspoon  21 repeat    32 harvest
               11 busy      22 cover     33 frost
           3rd  1 quiet     12 tofu      23 airline
                2 graduate  13 syndrome  24 improve
                3 decision  14 false     25 warmth
                4 shaft     15 process   26 campus
                5 adult     16 hawk      27 ting
                6 acrobat   17 educate   28 deploy
                7 slap      18 march     29 prayer
                8 parcel    19 gesture   30 freshman
                9 counter   20 shaft     31 chubby
               10 style     21 blanket   32 year
               11 join      22 purple    33 kidney
           4th  1 quiet     12 chew      23 coal
                2 graduate  13 spider    24 bucket
                3 decision  14 improve   25 failure
                4 skin      15 rhyme     26 equip
                5 aircraft  16 pumps     27 elegant
                6 ounce     17 keyboard  28 lizard
                7 trip      18 item      29 news
                8 capacity  19 often     30 prayer
                9 plan      20 symbolic  31 magazine
               10 staff     21 very      32 graduate
               11 skunk     22 curly     33 music
           5th  1 quiet     12 arena     23 hesitate
                2 graduate  13 violence  24 bulge
                3 decision  14 subject   25 fatigue
                4 snake     15 grant     26 pajamas
                5 avoid     16 math      27 luck
                6 ancestor  17 briefing  28 energy
                7 suitable  18 violence  29 method
                8 flip      19 transfer  30 estate
                9 brother   20 necklace  31 sister
               10 window    21 swimming  32 viral
               11 pancake   22 oven      33 blind
           6th  1 quiet     12 shaft     23 exhaust
                2 graduate  13 yelp      24 idle
                3 decision  14 width     25 width
                4 spider    15 inmate    26 video
                5 analysis  16 firm      27 chubby
                6 mountain  17 clock     28 usual
                7 withdraw  18 activity  29 payment
                8 thumb     19 beard     30 reunion
                9 nervous   20 marvel    31 gross
               10 visual    21 divorce   32 human
               11 blind     22 activity  33 wrote
```
Print `aux_tables/ascii_hex.txt`, `aux_tables/xor_table.txt` and `aux-tables/bip-39/english.txt`

## Switch off the computer. The following computations MUST be done manually.
```
E.g.
Ledger passphrase:
word1:	poem 
word2:	surprise
word3:	require
word4:	opinion
word5:	rent 
word6:	uncle 
word7: 	dwarf 
word8: 	mammal 
word9: 	episode 
word10: flame 
word11: build 
word12: hammer 
word13:	material 
word14: twice 
word15:	rural 
word16: doll 
word17: rival 
word18: suggest 
word19:	sick 
word20:	dynamic 
word21:	popular 
word22: clinic 
word23:	napkin 
word24:	style
```

## Prepare for passphrase encryption
```
OTP1: 56bd8320
OTP2: d3972686
OTP3: 1af67a62
OTP4: 7f262511 
OTP5: 88d3c065
OTP6: d1dd67de
OTP7: bb5e0378
OTP8: e292db7c 
OTP9: 33ee705a
OTP10:2464c690 
OTP11:21daa3a6
OTP12:38640a0a 
OTP13:293c7c03
OTP14:e3dd4aaa
OTP15:ff6fb41a
OTP16:d7154d4e
OTP17:1393dfef
OTP18:a12e5a0d
OTP19:a9bf839a
OTP20:bf8dc3ba
OTP21:77be579c
OTP22:46d39846
OTP23:a3440be4
OTP24:40c3f85a
```

## Compute encrypted passphrase MANUALLY
Use ascii_hex.txt and xor_table.txt printed previously.

Note: The first four characters of each passphrase words are unique. Encrypt only these characters. If a word is less than 4 characters long, fill it up with space(s).

```
		char	hex
word1:	poem  70 6f 65 6d
OTP1:			    56 bd 83 20
enc(word1):		26 d2 e6 4d

word2:	surp	73 75 72 70
OTP2:			    d3 97 26 86
enc(word2):		a0 e2 54 f6

word3:	requ	72 65 71 75
OTP3:			    1a f6 7a 62
enc(word3):		68 93 0b 17

word4: 	opin	6f 70 69 6e
OTP4:			    7f 26 25 11 
enc(word4):		10 56 4c 7f

word 5:	rent	72 65 6e 74
OTP5:			    88 d3 c0 65
enc(word5):		fa b6 ae 11

word 6:	uncl	75 6e 63 6c
OTP6:			    d1 dd 67 de
enc(word6):		a4 b3 04 b2

word 7: dwar	64 77 61 72
OTP7:			    bb 5e 03 78
enc(word7):		df 29 62 0a

word 8: mamm	6d 61 6d 6d
OTP8:			    e2 92 db 7c 
enc(word8):		8f f3 b6 11

word 9: epis	65 70 69 73
OTP9:			    33 ee 70 5a
enc(word9):		56 9e 19 29

word10: flam	66 6c 61 6d
OTP10:			  24 64 c6 90 
enc(word10):	42 08 a7 fd

word11: buil	62 75 69 6c
OTP11:			  21 da a3 a6
enc(word11):	43 af ca ca

word12: hamm	68 61 6d 6d
OTP12:			  38 64 0a 0a
enc(word12):	50 05 67 67

word13:	mate	6d 61 74 65
OTP13:			  29 3c 7c 03
enc(word13):	44 5d 08 66

word14: twic	74 77 69 63
OTP14:			  e3 dd 4a aa
enc(word14):	97 aa 23 c9

word15:	rura	72 75 72 61
OTP15:			  ff 6f b4 1a
enc(word15):	8d 1a c6 7b

word16: doll 	64 6f 6c 6c 
OTP16:			  d7 15 4d 4e
enc(word16):	b3 7a 21 22

word17: riva	72 69 76 61
OTP17:			  13 93 df ef
enc(word17):	61 fa a9 8e

word18: sugg	73 75 67 67
OTP18:			  a1 2e 5a 0d
enc(word18):	d2 5b 3d 6a

word19:	sick 	73 69 63 6b
OTP19:			  a9 bf 83 9a
enc(word19):	da d6 e0 f1

word20:	dyna	64 79 6e 61
OTP20:			  bf 8d c3 ba
enc(word20):	db f4 ad db

word21:	popu	70 6f 70 75
OTP21:			  77 be 57 9c
enc(word21):	07 d1 27 e9

word22: clin	63 6c 69 6e
OTP22:			  46 d3 98 46
enc(word22):	25 bf f1 28

word23:	napk	6e 61 70 6b
OTP23:			  a3 44 0b e4
enc(word23):	cd 25 7b 8f

word24:	styl	73 74 79 6c
OTP24:			  40 c3 f8 5a
enc(word24):	33 b7 81 36
```

## Write down the shares on separate pieces of paper
### Share1
```
  Header
    secret_owner: "Maugli",
    secret_checksum: "d361cb9f",
    creation_date: "20251107T0854",
    total_groups: 4,
    threshold: 2

  Encrypted_passphrase:  
    enc(word1):		26 d2 e6 4d
    enc(word2):		a0 e2 54 f6
    enc(word3):		68 93 0b 17
    enc(word4):		10 56 4c 7f
    enc(word5):		fa b6 ae 11
    enc(word6):		a4 b3 04 b2
    enc(word7):		df 29 62 0a
    enc(word8):		8f f3 b6 11
    enc(word9):		56 9e 19 29
    enc(word10):	42 08 a7 fd
    enc(word11):	43 af ca ca
    enc(word12):	50 05 67 67
    enc(word13):	44 5d 08 66
    enc(word14):	97 aa 23 c9
    enc(word15):	8d 1a c6 7b
    enc(word16):	b3 7a 21 22
    enc(word17):	61 fa a9 8e
    enc(word18):	d2 5b 3d 6a
    enc(word19):	da d6 e0 f1
    enc(word20):	db f4 ad db
    enc(word21):	07 d1 27 e9
    enc(word22):	25 bf f1 28
    enc(word23):	cd 25 7b 8f
    enc(word24):	33 b7 81 36

  OTP_share:
	seq: First(1/1), 1st
    words:      1 quiet     12 burning   23 dining
                2 graduate  13 remember  24 mineral
                3 acrobat   14 budget    25 cradle
                4 romp      15 necklace  26 fused
                5 agree     16 admit     27 clogs
                6 depart    17 ting      28 alarm
                7 velvet    18 lamp      29 group
                8 soldier   19 pencil    30 flash
                9 welcome   20 budget    31 avoid
               10 promise   21 unfold    32 literary
               11 fortune   22 expect    33 arena
```

### Share2 
```
  Header
    secret_owner: "Maugli",
    secret_checksum: "d361cb9f",
    creation_date: "20251107T0854",
    total_groups: 4,
    threshold: 2

  Encrypted_passphrase:  
    enc(word1):		26 d2 e6 4d
    enc(word2):		a0 e2 54 f6
    enc(word3):		68 93 0b 17
    enc(word4):		10 56 4c 7f
    enc(word5):		fa b6 ae 11
    enc(word6):		a4 b3 04 b2
    enc(word7):		df 29 62 0a
    enc(word8):		8f f3 b6 11
    enc(word9):		56 9e 19 29
    enc(word10):	42 08 a7 fd
    enc(word11):	43 af ca ca
    enc(word12):	50 05 67 67
    enc(word13):	44 5d 08 66
    enc(word14):	97 aa 23 c9
    enc(word15):	8d 1a c6 7b
    enc(word16):	b3 7a 21 22
    enc(word17):	61 fa a9 8e
    enc(word18):	d2 5b 3d 6a
    enc(word19):	da d6 e0 f1
    enc(word20):	db f4 ad db
    enc(word21):	07 d1 27 e9
    enc(word22):	25 bf f1 28
    enc(word23):	cd 25 7b 8f
    enc(word24):	33 b7 81 36

  OTP_share:
	seq: Second(1/1), 1st
    words:      1 quiet     12 hospital  23 genius
                2 graduate  13 costume   24 woman
                3 beard     14 reunion   25 cylinder
                4 romp      15 disease   26 burden
                5 again     16 meaning   27 firefly
                6 impact    17 pants     28 taxi
                7 herald    18 impact    29 primary
                8 fraction  19 salon     30 beyond
                9 educate   20 lift      31 advance
               10 shaft     21 human     32 slap
               11 pile      22 prospect  33 software
```

### Share3
```
  Header
    secret_owner: "Maugli",
    secret_checksum: "d361cb9f",
    creation_date: "20251107T0854",
    total_groups: 4,
    threshold: 2

  Encrypted_passphrase:  
    enc(word1):		26 d2 e6 4d
    enc(word2):		a0 e2 54 f6
    enc(word3):		68 93 0b 17
    enc(word4):		10 56 4c 7f
    enc(word5):		fa b6 ae 11
    enc(word6):		a4 b3 04 b2
    enc(word7):		df 29 62 0a
    enc(word8):		8f f3 b6 11
    enc(word9):		56 9e 19 29
    enc(word10):	42 08 a7 fd
    enc(word11):	43 af ca ca
    enc(word12):	50 05 67 67
    enc(word13):	44 5d 08 66
    enc(word14):	97 aa 23 c9
    enc(word15):	8d 1a c6 7b
    enc(word16):	b3 7a 21 22
    enc(word17):	61 fa a9 8e
    enc(word18):	d2 5b 3d 6a
    enc(word19):	da d6 e0 f1
    enc(word20):	db f4 ad db
    enc(word21):	07 d1 27 e9
    enc(word22):	25 bf f1 28
    enc(word23):	cd 25 7b 8f
    enc(word24):	33 b7 81 36

  OTP_share:
	seq: Fam(2/4), 1st
    words:      1 quiet     12 single    23 dynamic
                2 graduate  13 punish    24 superior
                3 ceramic   14 daughter  25 being
                4 roster    15 reaction  26 insect
                5 aircraft  16 ambition  27 payment
                6 episode   17 peasant   28 species
                7 dilemma   18 segment   29 idea
                8 recover   19 flea      30 phantom
                9 cricket   20 damage    31 blimp
               10 guilt     21 debut     32 tricycle
               11 explain   22 violence  33 rapids
```
etc. etc. 12 shares altogether.

## Test restore
Execute the ["Ledger safe restore"](./doc/ledger_safe_restore_example.md) procedure to verify that you can restore Ledger master passphrase.

## Store and destroy
Store the shares securely before distribution.

Destroy (for example, burn) every piece of paper used for manual computation, except the shares.