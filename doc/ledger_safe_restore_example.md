# Ledger Safe Restore - example

## Collect required number of shares, e.g. Share1 and Share2

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

## Burn secure OS image on DVD (e.g. Tails)

Burning Tails on a DVD, see at https://tails.net/install/dvd/index.en.html

## Boot Tails from DVD

## Open a terminal window, install SLIP39
```
# Source: https://github.com/pjkundert/python-slip39
# Article: https://slip39.com/
# Package description: https://pypi.org/project/slip39/
python3 -m venv env
source env/bin/activate
pip install slip39
pip install eth_account 
```

## Compute 256-bit Master Seed from SLIP39 shares
```
slip39-recovery -v
Enter 1st SLIP-39 mnemonic:
quiet graduate acrobat romp agree depart velvet soldier welcome promise fortune burning remember budget necklace admit ting lamp pencil budget unfold expect dining mineral cradle fused clogs alarm group flash avoid literary arena
Enter 2nd SLIP-39 mnemonic:
quiet graduate beard romp again impact herald fraction educate shaft pile hospital costume reunion disease meaning pants impact salon lift human prospect genius woman cylinder burden firefly taxi primary beyond advance slap software
2025-11-07 09:56:25 slip39.recovery  Recovered 256-bit Encrypted SLIP-39 Seed Entropy using 2 groups comprising 2 mnemonics
2025-11-07 09:56:25 slip39.recovery  Seed decoded from SLIP-39 Mnemonics w/ no passphrase
2025-11-07 09:56:25 slip39.recovery  Recovered SLIP-39 secret; To re-generate SLIP-39 wallet, send it to: python3 -m slip39 --secret -
4d2fd549a041921cec8a8d2a90d9f438d6a5cec74d1cd256fd5f5a2955c182d1
```

## Make 768-bit OTP from 256-bit Master Seed
```
rnd256='4d2fd549a041921cec8a8d2a90d9f438d6a5cec74d1cd256fd5f5a2955c182d1' 
otp=$(echo -n "$rnd256" | sha512sum | cut -d' ' -f1)$(echo -n "$rnd256" | sha256sum | cut -d' ' -f1)
echo $otp
56bd8320d39726861af67a627f26251188d3c065d1dd67debb5e0378e292db7c33ee705a2464c69021daa3a638640a0a293c7c03e3dd4aaaff6fb41ad7154d4e1393dfefa12e5a0da9bf839abf8dc3ba77be579c46d39846a3440be440c3f85a
```

## Generate SHA256 of OTP
```
echo -n $otp | sha256sum
d361cb9f08c74c6cfba2ae765ff9ade9b031252b69587e15e2c976813c4a46b9  -
```

## Compare first 8 chars with share checksum

If different: FATAL ERROR, passphrase cannot be recovered

## Write down the OTP on a piece of paper
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

## Switch off the computer

The following computations MUST be done manually, on a piece of paper,
using the `aux_tables/xor_table.txt`, `aux_tables/ascii_hex.txt` and `aux_tables/bip-39/english.txt`.
Print the tables and use them independently from a computer.

```
Passphrase
    enc(word1):		26 d2 e6 4d
	OTP1:			56 bd 83 20
	word1:			70 6f 65 6d => poem
	
    enc(word2):		a0 e2 54 f6
	OTP2:			d3 97 26 86
	word2:			73 75 72 70 => surp => surprise
	
    enc(word3):		68 93 0b 17
	OTP3:			1a f6 7a 62
	word3:			72 65 71 75 => requ => require
    
	enc(word4):		10 56 4c 7f
	OTP4:			7f 26 25 11 
	word4:			6f 70 69 6e => opin => opinion
	
    enc(word5):		fa b6 ae 11
	OTP5:			88 d3 c0 65
	word5:			72 65 6e 74 => rent
	
    enc(word6):		a4 b3 04 b2
	OTP6:			d1 dd 67 de
	word6:			75 6e 63 6c => uncl => uncle
	
    enc(word7):		df 29 62 0a	
	OTP7:			bb 5e 03 78
	word7:			64 77 61 72 => dwar => dwarf
	
    enc(word8):		8f f3 b6 11
	OTP8:			e2 92 db 7c
    word8:			6d 61 6d 6d => mamm => mammal
	
    enc(word9):		56 9e 19 29
	OTP9:			33 ee 70 5a
	word9:			65 70 69 73 => epis => episode
	
    enc(word10):	42 08 a7 fd
	OTP10:			24 64 c6 90
	word10:			66 6c 61 6d => flam => flame
	
    enc(word11):	43 af ca ca
	OTP11:			21 da a3 a6
	word11:			62 75 69 6c => buil => build
	
    enc(word12):	50 05 67 67
	OTP12:			38 64 0a 0a
    word12:			68 61 6d 6d => hamm => hammer
	
    enc(word13):	44 5d 08 66
	OTP13:			29 3c 7c 03
	word13:			6d 61 74 65 => mate => material
	
    enc(word14):	97 aa 23 c9
	OTP14:			e3 dd 4a aa
	word14:			74 77 69 63 => twic => twice
	
    enc(word15):	8d 1a c6 7b
	OTP15:			ff 6f b4 1a
	word15:			72 75 72 61 => rura => rural
	
    enc(word16):	b3 7a 21 22
	OTP16:			d7 15 4d 4e
	word16:			64 6f 6c 6c => doll
	
    enc(word17):	61 fa a9 8e
	OTP17:			13 93 df ef
	word17:			72 69 76 61 => riva => rival
	
    enc(word18):	d2 5b 3d 6a
	OTP18:			a1 2e 5a 0d
	word18:			73 75 67 67 => sugg => suggest
	
    enc(word19):	da d6 e0 f1
	OTP19:			a9 bf 83 9a
    word19:			73 69 63 6b => sick
	
    enc(word20):	db f4 ad db
	OTP20:			bf 8d c3 ba
	word20:			64 79 6e 61 => dyna => dynamic
	
    enc(word21):	07 d1 27 e9
	OTP21:			77 be 57 9c
	word21:			70 6f 70 75 => popu => popular
	
    enc(word22):	25 bf f1 28
	OTP22:			46 d3 98 46
	word22:			63 6c 69 6e => clin => clinic
	
    enc(word23):	cd 25 7b 8f
	OTP23:			a3 44 0b e4
	word23:			6e 61 70 6b => napk => napkin
	
    enc(word24):	33 b7 81 36
	OTP24:			40 c3 f8 5a
	word24:			73 74 79 6c => styl => style
```

## Write down Ledger master passphrase on a Recovery Sheet
```
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

## Recover Ledger 
From the Recovery Sheet, enter Master Passphrase to a Ledger HW wallet.

Verify the generated addresses and account balances.

## Tidying up

Destroy (for example, burn) all papers used for manual work, including Recovery Sheet, 
if it was a "Ledger Safe Backup" check operation.

Keep the Recovery Sheet, if it was a "Ledger Restore from Shares" operation.
And consider
- generating a new secret on another Ledger, 
- moving account balances to new addresses, 
- starting a Ledger Secure Backup for new secret.