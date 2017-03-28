import macros, strutils, os, csv, streams, parseutils #parsecsv, streams # re

type
  Currency = object of RootObj
    iso2: string #array[2,char]
    iso3: string #array[3,char]
    num: string # numeric id value of the currency
    minorUnit: int
    symbol: string  #char
    decomDate: string


macro newCurrency(iso3, iso2, symb, labl: string, numi:int):stmt =
  var source = ""
  let
    miso2 = toUpper($iso2) # somehow Nim does not see string unless specified as $symbol (considers it as NimNode instead)
    miso3 = toUpper($iso3)
    msymb = toUpper($symb)
    mlabl = toUpper($labl)

  # The use of % does not work : bad use?
  source &= "const CURRENCY_" & miso3 & "_ISO3: string = \"" & miso3 & "\"\n"
  source &= "const CURRENCY_" & miso2 & "_ISO2: string = \"" & miso2 & "\"\n"
  source &= "const CURRENCY_" & msymb & "_SYMB: string = \"" & msymb & "\"\n"
  source &= "const CURRENCY_" & mlabl & "_LABEL: string = \"" & mlabl & "\"\n"
  #source &= "const CURRENCY_" & miso3 & "_ID: int = " & $numi & "\n"

  echo "creating: " & miso3
  result = parseStmt(source)

# Entity,Currency,AlphabeticCode,NumericCode,MinorUnit,WithdrawalDate,Remark
let rawCurrenciesData="""
AFGHANISTAN,Afghani,AFN,971,2
ÅLAND ISLANDS,Euro,EUR,978,2
ALBANIA,Lek,ALL,008,2
ALGERIA,Algerian Dinar,DZD,012,2
AMERICAN SAMOA,US Dollar,USD,840,2
ANDORRA,Euro,EUR,978,2
ANGOLA,Kwanza,AOA,973,2
ANGUILLA,East Caribbean Dollar,XCD,951,2
ANTARCTICA,No universal currency,,,
ANTIGUA AND BARBUDA,East Caribbean Dollar,XCD,951,2
ARGENTINA,Argentine Peso,ARS,032,2
ARMENIA,Armenian Dram,AMD,051,2
ARUBA,Aruban Florin,AWG,533,2
AUSTRALIA,Australian Dollar,AUD,036,2
AUSTRIA,Euro,EUR,978,2
AZERBAIJAN,Azerbaijanian Manat,AZN,944,2
BAHAMAS,Bahamian Dollar,BSD,044,2
BAHRAIN,Bahraini Dinar,BHD,048,3
BANGLADESH,Taka,BDT,050,2
BARBADOS,Barbados Dollar,BBD,052,2
BELARUS,Belarussian Ruble,BYR,974,0
BELGIUM,Euro,EUR,978,2
BELIZE,Belize Dollar,BZD,084,2
BENIN,CFA Franc BCEAO,XOF,952,0
BERMUDA,Bermudian Dollar,BMD,060,2
BHUTAN,Ngultrum,BTN,064,2
BHUTAN,Indian Rupee,INR,356,2
"BOLIVIA, PLURINATIONAL STATE OF",Boliviano,BOB,068,2
"BOLIVIA, PLURINATIONAL STATE OF",Mvdol,BOV,984,2
"BONAIRE, SINT EUSTATIUS AND SABA",US Dollar,USD,840,2
BOSNIA AND HERZEGOVINA,Convertible Mark,BAM,977,2
BOTSWANA,Pula,BWP,072,2
BOUVET ISLAND,Norwegian Krone,NOK,578,2
BRAZIL,Brazilian Real,BRL,986,2
BRITISH INDIAN OCEAN TERRITORY,US Dollar,USD,840,2
BRUNEI DARUSSALAM,Brunei Dollar,BND,096,2
BULGARIA,Bulgarian Lev,BGN,975,2
BURKINA FASO,CFA Franc BCEAO,XOF,952,0
BURUNDI,Burundi Franc,BIF,108,0
CAMBODIA,Riel,KHR,116,2
CAMEROON,CFA Franc BEAC,XAF,950,0
CANADA,Canadian Dollar,CAD,124,2
CAPE VERDE,Cape Verde Escudo,CVE,132,2
CAYMAN ISLANDS,Cayman Islands Dollar,KYD,136,2
CENTRAL AFRICAN REPUBLIC,CFA Franc BEAC,XAF,950,0
CHAD,CFA Franc BEAC,XAF,950,0
CHILE,Unidad de Fomento,CLF,990,4
CHILE,Chilean Peso,CLP,152,0
CHINA,Yuan Renminbi,CNY,156,2
CHRISTMAS ISLAND,Australian Dollar,AUD,036,2
COCOS (KEELING) ISLANDS,Australian Dollar,AUD,036,2
COLOMBIA,Colombian Peso,COP,170,2
COLOMBIA,Unidad de Valor Real,COU,970,2
COMOROS,Comoro Franc,KMF,174,0
CONGO,CFA Franc BEAC,XAF,950,0
"CONGO, DEMOCRATIC REPUBLIC OF THE ",Congolese Franc,CDF,976,2
COOK ISLANDS,New Zealand Dollar,NZD,554,2
COSTA RICA,Costa Rican Colon,CRC,188,2
CÔTE D'IVOIRE,CFA Franc BCEAO,XOF,952,0
CROATIA,Croatian Kuna,HRK,191,2
CUBA,Peso Convertible,CUC,931,2
CUBA,Cuban Peso,CUP,192,2
CURAÇAO,Netherlands Antillean Guilder,ANG,532,2
CYPRUS,Euro,EUR,978,2
CZECH REPUBLIC,Czech Koruna,CZK,203,2
DENMARK,Danish Krone,DKK,208,2
DJIBOUTI,Djibouti Franc,DJF,262,0
DOMINICA,East Caribbean Dollar,XCD,951,2
DOMINICAN REPUBLIC,Dominican Peso,DOP,214,2
ECUADOR,US Dollar,USD,840,2
EGYPT,Egyptian Pound,EGP,818,2
EL SALVADOR,El Salvador Colon,SVC,222,2
EL SALVADOR,US Dollar,USD,840,2
EQUATORIAL GUINEA,CFA Franc BEAC,XAF,950,0
ERITREA,Nakfa,ERN,232,2
ESTONIA,Euro,EUR,978,2
ETHIOPIA,Ethiopian Birr,ETB,230,2
EUROPEAN UNION,Euro,EUR,978,2
FALKLAND ISLANDS (MALVINAS),Falkland Islands Pound,FKP,238,2
FAROE ISLANDS,Danish Krone,DKK,208,2
FIJI,Fiji Dollar,FJD,242,2
FINLAND,Euro,EUR,978,2
FRANCE,Euro,EUR,978,2
FRENCH GUIANA,Euro,EUR,978,2
FRENCH POLYNESIA,CFP Franc,XPF,953,0
FRENCH SOUTHERN TERRITORIES,Euro,EUR,978,2
GABON,CFA Franc BEAC,XAF,950,0
GAMBIA,Dalasi,GMD,270,2
GEORGIA,Lari,GEL,981,2
GERMANY,Euro,EUR,978,2
GHANA,Ghana Cedi,GHS,936,2
GIBRALTAR,Gibraltar Pound,GIP,292,2
GREECE,Euro,EUR,978,2
GREENLAND,Danish Krone,DKK,208,2
GRENADA,East Caribbean Dollar,XCD,951,2
GUADELOUPE,Euro,EUR,978,2
GUAM,US Dollar,USD,840,2
GUATEMALA,Quetzal,GTQ,320,2
GUERNSEY,Pound Sterling,GBP,826,2
GUINEA,Guinea Franc,GNF,324,0
GUINEA-BISSAU,CFA Franc BCEAO,XOF,952,0
GUYANA,Guyana Dollar,GYD,328,2
HAITI,Gourde,HTG,332,2
HAITI,US Dollar,USD,840,2
HEARD ISLAND AND McDONALD ISLANDS,Australian Dollar,AUD,036,2
HOLY SEE (VATICAN CITY STATE),Euro,EUR,978,2
HONDURAS,Lempira,HNL,340,2
HONG KONG,Hong Kong Dollar,HKD,344,2
HUNGARY,Forint,HUF,348,2
ICELAND,Iceland Krona,ISK,352,0
INDIA,Indian Rupee,INR,356,2
INDONESIA,Rupiah,IDR,360,2
INTERNATIONAL MONETARY FUND (IMF) ,SDR (Special Drawing Right),XDR,960,N.A.
"IRAN, ISLAMIC REPUBLIC OF",Iranian Rial,IRR,364,2
IRAQ,Iraqi Dinar,IQD,368,3
IRELAND,Euro,EUR,978,2
ISLE OF MAN,Pound Sterling,GBP,826,2
ISRAEL,New Israeli Sheqel,ILS,376,2
ITALY,Euro,EUR,978,2
JAMAICA,Jamaican Dollar,JMD,388,2
JAPAN,Yen,JPY,392,0
JERSEY,Pound Sterling,GBP,826,2
JORDAN,Jordanian Dinar,JOD,400,3
KAZAKHSTAN,Tenge,KZT,398,2
KENYA,Kenyan Shilling,KES,404,2
KIRIBATI,Australian Dollar,AUD,036,2
"KOREA, DEMOCRATIC PEOPLE’S REPUBLIC OF",North Korean Won,KPW,408,2
"KOREA, REPUBLIC OF",Won,KRW,410,0
KUWAIT,Kuwaiti Dinar,KWD,414,3
KYRGYZSTAN,Som,KGS,417,2
LAO PEOPLE’S DEMOCRATIC REPUBLIC,Kip,LAK,418,2
LATVIA,Euro,EUR,978,2
LEBANON,Lebanese Pound,LBP,422,2
LESOTHO,Loti,LSL,426,2
LESOTHO,Rand,ZAR,710,2
LIBERIA,Liberian Dollar,LRD,430,2
LIBYA,Libyan Dinar,LYD,434,3
LIECHTENSTEIN,Swiss Franc,CHF,756,2
LITHUANIA,Lithuanian Litas,LTL,440,2
LUXEMBOURG,Euro,EUR,978,2
MACAO,Pataca,MOP,446,2
"MACEDONIA, THE FORMER  YUGOSLAV REPUBLIC OF",Denar,MKD,807,2
MADAGASCAR,Malagasy Ariary,MGA,969,2
MALAWI,Kwacha,MWK,454,2
MALAYSIA,Malaysian Ringgit,MYR,458,2
MALDIVES,Rufiyaa,MVR,462,2
MALI,CFA Franc BCEAO,XOF,952,0
MALTA,Euro,EUR,978,2
MARSHALL ISLANDS,US Dollar,USD,840,2
MARTINIQUE,Euro,EUR,978,2
MAURITANIA,Ouguiya,MRO,478,2
MAURITIUS,Mauritius Rupee,MUR,480,2
MAYOTTE,Euro,EUR,978,2
MEMBER COUNTRIES OF THE AFRICAN DEVELOPMENT BANK GROUP,ADB Unit of Account,XUA,965,N.A.
MEXICO,Mexican Peso,MXN,484,2
MEXICO,Mexican Unidad de Inversion (UDI),MXV,979,2
"MICRONESIA, FEDERATED STATES OF",US Dollar,USD,840,2
"MOLDOVA, REPUBLIC OF",Moldovan Leu,MDL,498,2
MONACO,Euro,EUR,978,2
MONGOLIA,Tugrik,MNT,496,2
MONTENEGRO,Euro,EUR,978,2
MONTSERRAT,East Caribbean Dollar,XCD,951,2
MOROCCO,Moroccan Dirham,MAD,504,2
MOZAMBIQUE,Mozambique Metical,MZN,943,2
MYANMAR,Kyat,MMK,104,2
NAMIBIA,Namibia Dollar,NAD,516,2
NAMIBIA,Rand,ZAR,710,2
NAURU,Australian Dollar,AUD,036,2
NEPAL,Nepalese Rupee,NPR,524,2
NETHERLANDS,Euro,EUR,978,2
NEW CALEDONIA,CFP Franc,XPF,953,0
NEW ZEALAND,New Zealand Dollar,NZD,554,2
NICARAGUA,Cordoba Oro,NIO,558,2
NIGER,CFA Franc BCEAO,XOF,952,0
NIGERIA,Naira,NGN,566,2
NIUE,New Zealand Dollar,NZD,554,2
NORFOLK ISLAND,Australian Dollar,AUD,036,2
NORTHERN MARIANA ISLANDS,US Dollar,USD,840,2
NORWAY,Norwegian Krone,NOK,578,2
OMAN,Rial Omani,OMR,512,3
PAKISTAN,Pakistan Rupee,PKR,586,2
PALAU,US Dollar,USD,840,2
"PALESTINE, STATE OF",No universal currency,,,
PANAMA,Balboa,PAB,590,2
PANAMA,US Dollar,USD,840,2
PAPUA NEW GUINEA,Kina,PGK,598,2
PARAGUAY,Guarani,PYG,600,0
PERU,Nuevo Sol,PEN,604,2
PHILIPPINES,Philippine Peso,PHP,608,2
PITCAIRN,New Zealand Dollar,NZD,554,2
POLAND,Zloty,PLN,985,2
PORTUGAL,Euro,EUR,978,2
PUERTO RICO,US Dollar,USD,840,2
QATAR,Qatari Rial,QAR,634,2
RÉUNION,Euro,EUR,978,2
ROMANIA,New Romanian Leu,RON,946,2
RUSSIAN FEDERATION,Russian Ruble,RUB,643,2
RWANDA,Rwanda Franc,RWF,646,0
SAINT BARTHÉLEMY,Euro,EUR,978,2
"SAINT HELENA, ASCENSION AND  TRISTAN DA CUNHA",Saint Helena Pound,SHP,654,2
SAINT KITTS AND NEVIS,East Caribbean Dollar,XCD,951,2
SAINT LUCIA,East Caribbean Dollar,XCD,951,2
SAINT MARTIN (FRENCH PART),Euro,EUR,978,2
SAINT PIERRE AND MIQUELON,Euro,EUR,978,2
SAINT VINCENT AND THE GRENADINES,East Caribbean Dollar,XCD,951,2
SAMOA,Tala,WST,882,2
SAN MARINO,Euro,EUR,978,2
SAO TOME AND PRINCIPE,Dobra,STD,678,2
SAUDI ARABIA,Saudi Riyal,SAR,682,2
SENEGAL,CFA Franc BCEAO,XOF,952,0
SERBIA,Serbian Dinar,RSD,941,2
SEYCHELLES,Seychelles Rupee,SCR,690,2
SIERRA LEONE,Leone,SLL,694,2
SINGAPORE,Singapore Dollar,SGD,702,2
SINT MAARTEN (DUTCH PART),Netherlands Antillean Guilder,ANG,532,2
"SISTEMA UNITARIO DE COMPENSACION REGIONAL DE PAGOS SUCRE",Sucre,XSU,994,N.A.
SLOVAKIA,Euro,EUR,978,2
SLOVENIA,Euro,EUR,978,2
SOLOMON ISLANDS,Solomon Islands Dollar,SBD,090,2
SOMALIA,Somali Shilling,SOS,706,2
SOUTH AFRICA,Rand,ZAR,710,2
SOUTH GEORGIA AND THE SOUTH SANDWICH ISLANDS,No universal currency,,,
SOUTH SUDAN,South Sudanese Pound,SSP,728,2
SPAIN,Euro,EUR,978,2
SRI LANKA,Sri Lanka Rupee,LKR,144,2
SUDAN,Sudanese Pound,SDG,938,2
SURINAME,Surinam Dollar,SRD,968,2
SVALBARD AND JAN MAYEN,Norwegian Krone,NOK,578,2
SWAZILAND,Lilangeni,SZL,748,2
SWEDEN,Swedish Krona,SEK,752,2
SWITZERLAND,WIR Euro,CHE,947,2
SWITZERLAND,Swiss Franc,CHF,756,2
SWITZERLAND,WIR Franc,CHW,948,2
SYRIAN ARAB REPUBLIC,Syrian Pound,SYP,760,2
"TAIWAN, PROVINCE OF CHINA",New Taiwan Dollar,TWD,901,2
TAJIKISTAN,Somoni,TJS,972,2
"TANZANIA, UNITED REPUBLIC OF",Tanzanian Shilling,TZS,834,2
THAILAND,Baht,THB,764,2
TIMOR-LESTE,US Dollar,USD,840,2
TOGO,CFA Franc BCEAO,XOF,952,0
TOKELAU,New Zealand Dollar,NZD,554,2
TONGA,Pa’anga,TOP,776,2
TRINIDAD AND TOBAGO,Trinidad and Tobago Dollar,TTD,780,2
TUNISIA,Tunisian Dinar,TND,788,3
TURKEY,Turkish Lira,TRY,949,2
TURKMENISTAN,Turkmenistan New Manat,TMT,934,2
TURKS AND CAICOS ISLANDS,US Dollar,USD,840,2
TUVALU,Australian Dollar,AUD,036,2
UGANDA,Uganda Shilling,UGX,800,0
UKRAINE,Hryvnia,UAH,980,2
UNITED ARAB EMIRATES,UAE Dirham,AED,784,2
UNITED KINGDOM,Pound Sterling,GBP,826,2
UNITED STATES,US Dollar,USD,840,2
UNITED STATES,US Dollar (Next day),USN,997,2
UNITED STATES MINOR OUTLYING ISLANDS,US Dollar,USD,840,2
URUGUAY,Uruguay Peso en Unidades Indexadas (URUIURUI),UYI,940,0
URUGUAY,Peso Uruguayo,UYU,858,2
UZBEKISTAN,Uzbekistan Sum,UZS,860,2
VANUATU,Vatu,VUV,548,0
"VENEZUELA, BOLIVARIAN REPUBLIC OF",Bolivar,VEF,937,2
VIET NAM,Dong,VND,704,0
VIRGIN ISLANDS (BRITISH),US Dollar,USD,840,2
VIRGIN ISLANDS (U.S.),US Dollar,USD,840,2
WALLIS AND FUTUNA,CFP Franc,XPF,953,0
WESTERN SAHARA,Moroccan Dirham,MAD,504,2
YEMEN,Yemeni Rial,YER,886,2
ZAMBIA,Zambian Kwacha,ZMW,967,2
ZIMBABWE,Zimbabwe Dollar,ZWL,932,2
ZZ01_Bond Markets Unit European_EURCO,Bond Markets Unit European Composite Unit (EURCO),XBA,955,N.A.
ZZ02_Bond Markets Unit European_EMU-6,Bond Markets Unit European Monetary Unit (E.M.U.-6),XBB,956,N.A.
ZZ03_Bond Markets Unit European_EUA-9,Bond Markets Unit European Unit of Account 9 (E.U.A.-9),XBC,957,N.A.
ZZ04_Bond Markets Unit European_EUA-17,Bond Markets Unit European Unit of Account 17 (E.U.A.-17),XBD,958,N.A.
ZZ06_Testing_Code,Codes specifically reserved for testing purposes,XTS,963,N.A.
ZZ07_No_Currency,The codes assigned for transactions where no currency is involved,XXX,999,N.A.
ZZ08_Gold,Gold,XAU,959,N.A.
ZZ09_Palladium,Palladium,XPD,964,N.A.
ZZ10_Platinum,Platinum,XPT,962,N.A.
ZZ11_Silver,Silver,XAG,961,N.A.
AFGHANISTAN,Afghani,AFA,004,,2003-01
ÅLAND ISLANDS,Markka,FIM,246,,2002-03
ALBANIA,Old Lek,ALK,,,1989-12
ANDORRA,Andorran Peseta,ADP,020,,2003-07
ANDORRA,Spanish Peseta,ESP,724,,2002-03
ANDORRA,French Franc,FRF,250,,2002-03
ANGOLA,Kwanza,AOK,,,1991-03
ANGOLA,New Kwanza,AON,024,,2000-02
ANGOLA,Kwanza Reajustado,AOR,982,,2000-02
ARGENTINA,Austral,ARA,032,,1992-01
ARGENTINA,Peso Argentino,ARP,032,,1985-07
ARGENTINA,Peso,ARY,,,1989 to 1990
ARMENIA,Russian Ruble,RUR,810,,1994-08
AUSTRIA,Schilling,ATS,040,,2002-03
AZERBAIJAN,Azerbaijan Manat,AYM,945,,2005-10
AZERBAIJAN,Azerbaijanian Manat,AZM,031,,2005-12
AZERBAIJAN,Russian Ruble,RUR,810,,1994-08
BELARUS,Belarussian Ruble,BYB,112,,2001-01
BELARUS,Russian Ruble,RUR,810,,1994-06
BELGIUM,Convertible Franc,BEC,993,,1990-03
BELGIUM,Belgian Franc,BEF,056,,2002-03
BELGIUM,Financial Franc,BEL,992,,1990-03
BOLIVIA,Peso boliviano,BOP,,,1987-02
BOSNIA AND HERZEGOVINA,Dinar,BAD,070,,1997-07
BRAZIL,Cruzeiro,BRB,,,1986-03
BRAZIL,Cruzado,BRC,076,,1989-02
BRAZIL,Cruzeiro,BRE,076,,1993-03
BRAZIL,New Cruzado,BRN,076,,1990-03
BRAZIL,Cruzeiro Real,BRR,987,,1994-07
BULGARIA,Lev A/52,BGJ,,,1989 to 1990
BULGARIA,Lev A/62,BGK,,,1989 to 1990
BULGARIA,Lev,BGL,100,,2003-11
BURMA ,N.A.,BUK,,,1990-02
CHINA,Peoples Bank Dollar,CNX,,,1989-12
CROATIA,Croatian Dinar,HRD,191,,1995-01
CYPRUS,Cyprus Pound,CYP,196,,2008-01
CZECHOSLOVAKIA,Krona A/53,CSJ,,,1989 to 1990
CZECHOSLOVAKIA,Koruna,CSK,200,,1993-03
ECUADOR,Sucre,ECS,218,,2000-09
ECUADOR,Unidad de Valor Constante (UVC),ECV,983,,2000-09
EQUATORIAL GUINEA,Ekwele,EQE,,,1989-12
EQUATORIAL GUINEA,Ekwele,GQE,226,,1986-06
ESTONIA,Kroon,EEK,233,,2011-01
EUROPEAN MONETARY CO-OPERATION FUND (EMCF),European Currency Unit (E.C.U),XEU,954,,1999-01
FINLAND,Markka,FIM,246,,2002-03
FRANCE,French Franc,FRF,250,,2002-03
FRENCH  GUIANA,French Franc,FRF,250,,2002-03
FRENCH SOUTHERN TERRITORIES,French Franc,FRF,250,,2002-03
GEORGIA,Georgian Coupon,GEK,268,,1995-10
GEORGIA,Russian Ruble,RUR,810,,1994-04
GERMAN DEMOCRATIC REPUBLIC,Mark der DDR,DDM,278,,1990-07 to 1990-09
GERMANY,Deutsche Mark,DEM,276,,2002-03
GHANA,Cedi,GHC,288,,2008-01
GHANA,Ghana Cedi,GHP,939,,2007-06
GREECE,Drachma,GRD,300,,2002-03
GUADELOUPE,French Franc,FRF,250,,2002-03
GUINEA,Syli,GNE,,,1989-12
GUINEA,Syli,GNS,,,1986-02
GUINEA-BISSAU,Guinea Escudo,GWE,,,1978 to 1981
GUINEA-BISSAU,Guinea-Bissau Peso,GWP,624,,1997-05
HOLY SEE (VATICAN CITY STATE),Italian Lira,ITL,380,,2002-03
ICELAND,Old Krona,ISJ,,,1989 to 1990
IRELAND,Irish Pound,IEP,372,,2002-03
ISRAEL,Pound,ILP,,,1978 to 1981
ISRAEL,Old Shekel,ILR,,,1989 to 1990
ITALY,Italian Lira,ITL,380,,2002-03
KAZAKHSTAN,Russian Ruble,RUR,810,,1994-05
KYRGYZSTAN,Russian Ruble,RUR,810,,1993-01
LAO,Kip Pot Pol,LAJ,,,1989-12
LATVIA,Latvian Lats,LVL,428,,2014-01
LATVIA,Latvian Ruble,LVR,428,,1994-12
LESOTHO,Maloti,LSM,,,1985-05
LESOTHO,Financial Rand,ZAL,991,,1995-03
LITHUANIA,Talonas,LTT,440,,1993-07
LUXEMBOURG,Luxembourg Convertible Franc,LUC,989,,1990-03
LUXEMBOURG,Luxembourg Franc,LUF,442,,2002-03
LUXEMBOURG,Luxembourg Financial Franc,LUL,988,,1990-03
MADAGASCAR,Malagasy Franc,MGF,450,,2004-12
MALDIVES,Maldive Rupee,MVQ,,,1989-12
MALI,Mali Franc,MAF,,,1989-12
MALI,Mali Franc,MLF,466,,1984-11
MALTA,Maltese Lira,MTL,470,,2008-01
MALTA,Maltese Pound,MTP,,,1983-06
MARTINIQUE,French Franc,FRF,250,,2002-03
MAYOTTE,French Franc,FRF,250,,2002-03
MEXICO,Mexican Peso,MXP,,,1993-01
"MOLDOVA, REPUBLIC OF",Russian Ruble,RUR,810,,1993-12
MONACO,French Franc,FRF,250,,2002-03
MOZAMBIQUE,Mozambique Escudo,MZE,,,1978 to 1981
MOZAMBIQUE,Mozambique Metical,MZM,508,,2006-06
NETHERLANDS,Netherlands Guilder,NLG,528,,2002-03
NETHERLANDS ANTILLES,Netherlands Antillean Guilder,ANG,532,,2010-10
NICARAGUA,Cordoba,NIC,,,1990-10
PERU,Sol,PEH,,,1989 to 1990
PERU,Inti,PEI,604,,1991-07
PERU,Sol,PES,604,,1986-02
POLAND,Zloty,PLZ,616,,1997-01
PORTUGAL,Portuguese Escudo,PTE,620,,2002-03
RÉUNION,French Franc,FRF,250,,2002-03
ROMANIA,Leu A/52,ROK,,,1989 to 1990
ROMANIA,Old Leu,ROL,642,,2005-06
RUSSIAN FEDERATION,Russian Ruble,RUR,810,,2004-01
SAINT MARTIN,French Franc,FRF,250,,1999-01
SAINT PIERRE AND MIQUELON,French Franc,FRF,250,,2002-03
SAINT-BARTHÉLEMY,French Franc,FRF,250,,1999-01
SAN MARINO,Italian Lira,ITL,380,,2002-03
SERBIA AND MONTENEGRO,Serbian Dinar,CSD,891,,2006-10
SERBIA AND MONTENEGRO,Euro,EUR,978,,2006-10
SLOVAKIA,Slovak Koruna,SKK,703,,2009-01
SLOVENIA,Tolar,SIT,705,,2007-01
SOUTH AFRICA,Financial Rand,ZAL,991,,1995-03
SOUTH SUDAN,Sudanese Pound,SDG,938,,2012-09
SOUTHERN RHODESIA ,Rhodesian Dollar,RHD,,,1978 to 1981
SPAIN,Spanish Peseta,ESA,996,,1978 to 1981
SPAIN,"A Account (convertible Peseta Account)",ESB,995,,1994-12
SPAIN,Spanish Peseta,ESP,724,,2002-03
SUDAN,Sudanese Dinar,SDD,736,,2007-07
SUDAN,Sudanese Pound,SDP,,,1998-06
SURINAME,Surinam Guilder,SRG,740,,2003-12
SWITZERLAND,WIR Franc (for electronic),CHC,948,,2004-11
TAJIKISTAN,Russian Ruble,RUR,810,,1995-05
TAJIKISTAN,Tajik Ruble,TJR,762,,2001-04
TIMOR-LESTE,Rupiah,IDR,360,,2002-07
TIMOR-LESTE,Timor Escudo,TPE,626,,2002-11
TURKEY,Old Turkish Lira,TRL,792,,2005-12
TURKEY,New Turkish Lira,TRY,949,,2009-01
TURKMENISTAN,Russian Ruble,RUR,810,,1993-10
TURKMENISTAN,Turkmenistan Manat,TMM,795,,2009-01
UGANDA,Uganda Shilling,UGS,,,1987-05
UGANDA,Old Shilling,UGW,,,1989 to 1990
UKRAINE,Karbovanet,UAK,804,,1996-09
UNION OF SOVIET SOCIALIST REPUBLICS,Rouble,SUR,,,1990-12
UNITED STATES,US Dollar (Same day),USS,998,,2014-03
URUGUAY,Old Uruguay Peso,UYN,,,1989-12
URUGUAY,Uruguayan Peso,UYP,,,1993-03
UZBEKISTAN,Russian Ruble,RUR,810,,1994-07
VENEZUELA,Bolivar,VEB,862,,2008-01
VENEZUELA,Bolivar Fuerte,VEF,937,,2011-12
VIETNAM,Old Dong,VNC,,,1989-1990
"YEMEN, DEMOCRATIC",Yemeni Dinar,YDD,720,,1991-09
YUGOSLAVIA,New Yugoslavian Dinar,YUD,,,1990-01
YUGOSLAVIA,New Dinar,YUM,891,,2003-07
YUGOSLAVIA,Yugoslavian Dinar,YUN,890,,1995-11
ZAIRE,New Zaire,ZRN,180,,1999-06
ZAIRE,Zaire,ZRZ,180,,1994-02
ZAMBIA,Zambian Kwacha,ZMK,894,,2012-12
ZIMBABWE,Rhodesian Dollar,ZWC,,,1989-12
ZIMBABWE,Zimbabwe Dollar (old),ZWD,716,,2006-08
ZIMBABWE,Zimbabwe Dollar,ZWD,716,,2008-08
ZIMBABWE,Zimbabwe Dollar (new),ZWN,942,,2006-09
ZIMBABWE,Zimbabwe Dollar,ZWR,935,,2009-06
ZZ01_Gold-Franc,Gold-Franc,XFO,,,2006-10
ZZ02_RINET Funds Code,RINET Funds Code,XRE,,,1999-11
ZZ05_UIC-Franc,UIC-Franc,XFU,,,2013-11"""

macro preprocessCurrencies(): stmt =
  let parsed = csv.parseAll(rawCurrenciesData,"Currencies",separator=',', quote='"')
  result = newNimNode(nnkStmtList)
  for row in parsed:
    let
      ent =toUpper(row[0]) # entity = country or special names
      labl=toUpper(row[1])
      iso3=toUpper(row[2])
      iso2=toUpper("I2")
      symb=toUpper("C")
      #var dummy:int ==> Cannot evaluate numi at compile time (parseInt ?)
      #let numi=parseInt(row[3],dummy)

    var stSection = newNimNode(nnkStmtList)

    result.add(nil) #newCurrency(iso3, iso2, symb, labl, 0))

newCurrency("iso3", "iso2", "symb", "labl", 0) #, numi)
newCurrency("EU1", "E1", "€", "Euro", 0) #, numi)

when isMainModule:
  echo(CURRENCY_ISO3_ISO3)
  echo(CURRENCY_€_SYMB) # will probably not work properly due to Nim string being 1 byte - need to use a widestring
  discard #echo CURRENCY_EUR_ISO3

