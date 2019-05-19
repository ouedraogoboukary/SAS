/*******************************************************************\           
| Copyright (C) 2019 by SAS Institute Inc., Cary, NC, USA.                  |           
|                                                                           |           
| SAS (R) is a registered trademark of SAS Institute Inc.                   |           
|                                                                           |           
|This program creates practice raw data and Excel files for some of         |
|the examples in the:                                                       |
| - SAS Certification Prep Guide: Base Programming for SAS 9                |
| - SAS Certified Specialist Prep Guide: Base Programming Using SAS 9.4     |
|       															        |
|                                                                           |
| Last updated: February 6, 2019                                            |
\*******************************************************************/   
/* If running individually, uncomment this line and make sure it points to your certification data location */
/*%let path=/folders/myfolders/cert;*/

%macro setdelim;
%global delim;
%if %index(&path,%str(/)) %then %let delim=%str(/);
%else %let delim=%str(\);
%mend;
%setdelim

libname xl xlsx "&path&delim.boots.xlsx";
data xl.boot;
  infile datalines dsd truncover;
  input Region:$25. City:$11. Total_Sale:comma15.2;
  format Total_Sale DOLLAR15.2;
  label Region="Region" City="City" Total_Sale="Total Sale";
datalines4;
Africa,Addis Ababa,"$191,821.00"
Asia,Bangkok,"$9,576.00"
Canada,Calgary,"$63,280.00"
Central America/Carribean,Kingston,"$393,376.00"
Eastern Europe,Budapest,"$317,515.00"
Middle East,Al-Khobar,"$44,658.00"
Pacific,Auckland,"$97,919.00"
South America,Bogota,"$35,805.00"
United States,Chicago,"$305,061.00"
Western Europe,Copenhagen,"$4,657.00"
;;;;

libname xl xlsx "&path&delim.exercise.xlsx";
data xl.activitylevels;
  infile datalines dsd truncover;
  input ID Name:$14. Sex:$1. Age  Height  Weight ActLevel:$4.;
datalines4;
2458,"Murray, W",M,27,72,168,HIGH
2462,"Almers, C",F,34,66,152,HIGH
2501,"Bonaventure, T",F,31,61,123,LOW
2523,"Johnson, R",F,43,63,137,MOD
2539,"LaMance, R",M,51,71,158,LOW
2544,"Jones, M",M,29,76,193,HIGH
2552,"Reberson, P",F,32,67,151,MOD
2555,"King, E",M,35,70,173,MOD
2563,"Pitts, D",M,34,73,154,LOW
2568,"Eberhardt, S",F,49,64,172,LOW
2571,"Nunnelly, A",F,44,66,140,HIGH
2572,"Oberon, M",F,28,62,118,LOW
2574,"Peterson, V",M,30,69,147,MOD
2575,"Quigley, M",F,40,69,163,HIGH
2578,"Cameron, L",M,47,72,173,MOD
2579,"Underwood, K",M,60,71,191,LOW
2584,"Takahashi, Y",F,43,65,123,MOD
2586,"Derber, B",M,25,75,188,HIGH
2588,"Ivan, H",F,22,63,139,LOW
2589,"Wilcox, E",F,41,67,141,HIGH
2595,"Warren, C",M,54,71,183,MOD
;;;;

data xl.tests;
  infile datalines dsd truncover;
  input ID  Name:$14. RestHR  MaxHR  RecHR:$3. TimeMin  TimeSec  Tolerance:$1. TestDate:MMDDYY10.;
  format TestDate MMDDYY10.;
datalines4;
2458,"Murray, W",72,185,128,12,38,D,08/25/2008
2462,"Almers, C",68,171,133,10,5,I,06/26/2008
2501,"Bonaventure, T",78,177,139,11,13,I,06/26/2008
2523,"Johnson, R",69,162,114,9,42,S,07/04/2008
2539,"LaMance, R",75,168,141,11,46,D,08/25/2008
2544,"Jones, M",79,187,136,12,26,N,07/14/2008
2552,"Reberson, P",69,158,139,15,41,D,08/25/2008
2555,"King, E",70,167,122,13,13,I,07/14/2008
2563,"Pitts, D",71,159,116,10,22,S,08/25/2008
2568,"Eberhardt, S",72,182,122,16,49,N,06/26/2008
2571,"Nunnelly, A",65,181,141,15,2,I,08/09/2008
2572,"Oberon, M",74,177,138,12,11,D,08/08/2008
2574,"Peterson, V",80,164,137,14,9,D,07/21/2008
2575,"Quigley, M",74,152,.,11,26,I,07/13/2008
2578,"Cameron, L",75,158,108,14,27,I,08/16/2008
2579,"Underwood, K",72,165,127,13,19,S,06/27/2008
2584,"Takahashi, Y",76,163,135,16,7,D,08/16/2008
2586,"Derber, B",68,176,119,17,35,N,08/17/2008
2588,"Ivan, H",70,182,126,15,41,N,06/18/2008
2589,"Wilcox, E",78,189,138,14,57,I,07/19/2008
2595,"Warren, C",77,170,136,12,10,S,07/20/2008
;;;;

libname xl clear;

data _null_;
  file "&path&delim.boot.csv";
  infile datalines truncover;
  input;
  varlen=length(_infile_);
  put _infile_ $varying100. varlen;
datalines4;
"Africa","Boot","Addis Ababa","12","$29,761","$191,821","$769"
"Asia","Boot","Bangkok","1","$1,996","$9,576","$80"
"Canada","Boot","Calgary","8","$17,720","$63,280","$472"
"Central America/Caribbean","Boot","Kingston","33","$102,372","$393,376","$4,454"
"Eastern Europe","Boot","Budapest","22","$74,102","$317,515","$3,341"
"Middle East","Boot","Al-Khobar","10","$15,062","$44,658","$765"
"Pacific","Boot","Auckland","12","$20,141","$97,919","$962"
"South America","Boot","Bogota","19","$15,312","$35,805","$1,229"
"United States","Boot","Chicago","16","$82,483","$305,061","$3,735"
"Western Europe","Boot","Copenhagen","2","$1,663","$4,657","$129"
;;;;

data _null_;
  file "&path&delim.class.txt";
  infile datalines truncover;
  input;
  varlen=length(_infile_);
  put _infile_ $varying100. varlen;
datalines4;
Name     Gender   Age
Joyce    F        11
Thomas   M        11
Jane     F        12
Louise   F        12
James    M        12
John     M        12
Robert   M        12
Alice    F        13
Barbara  F        13
Jeffery  M        13
Carol    F        14
Judy     F        14
Alfred   M        14
Henry    M        14
Jenet    F        15
Mary     F        15
Ronald   M        15
William  M        15
Philip   M        16
;;;;

data _null_;
  file "&path&delim.delimiter.txt";
  infile datalines truncover;
  input;
  varlen=length(_infile_);
  put _infile_ $varying100. varlen;
datalines4;
Region&State&Month&Expenses&Revenue
Southern&GA&JAN2001&2000&8000
Southern&GA&FEB2001&1200&6000
Southern&FL&FEB2001&8500&11000
Northern&NY&FEB2001&3000&4000
Northern&NY&MAR2001&6000&5000
Southern&FL&MAR2001&9800&13500
Northern&MA&MAR2001&1500&1000
;;;;

data _null_;
  file "&path&delim.new_hires.csv";
  infile datalines truncover;
  input;
  varlen=length(_infile_);
  put _infile_ $varying100. varlen;
datalines4;
Name,Hire Date,Company,Country,Date of Birth
Gisela S. Santos,8/12/17,Pede Nunc Sed Limited,Micronesia,8/21/1971
Maxwell L. Cooley,9/4/17,A LLP,Somalia,4/30/1975
Thane P. Obrien,10/28/17,Consectetuer Limited,Jamaica,4/23/1988
Minerva C. Conley,1/5/18,Feugiat Tellus Lorem Institute,Fiji,2/18/1975
Kylee R. Finch,10/31/17,Magna Incorporated,Myanmar,5/18/1973
Calista F. Chambers,9/11/17,Facilisis Incorporated,Libya,3/4/1972
Fuller X. Bradford,1/27/18,Morbi Incorporated,Saint Pierre and Miquelon,12/1/1976
Jane E. Vazquez,3/5/18,Proin Corporation,Antarctica,4/26/1972
Melinda Y. Burton,2/23/18,Neque Industries,Japan,1/4/1992
Alan V. Gibbs,1/16/18,Metus Vitae Company,Kyrgyzstan,10/29/1982
Raphael W. Carter,4/21/18,Magna Ut Corporation,Fiji,4/3/1993
Fritz V. Morrow,2/27/18,Nunc Industries,Singapore,1/31/1997
Anjolie P. Finch,1/25/18,Justo Foundation,Equatorial Guinea,9/10/1972
Ciaran I. Salazar,12/6/17,Ipsum Associates,Montenegro,10/23/1987
Palmer P. Mills,3/2/18,At Corp.,Singapore,1/30/1994
Kimberly L. Randolph,9/28/17,Quam Curabitur Incorporated,Botswana,2/1/1996
Camden G. Rosales,4/18/18,Ac Eleifend Foundation,Guatemala,5/26/1976
Skyler D. Larsen,8/27/17,Curabitur Consequat Industries,"Virgin Islands, United States",9/20/1980
Jacob C. Noel,5/11/18,Non Lobortis Foundation,Mauritania,1/20/1976
Scott C. Estrada,4/9/18,Ac Eleifend Corporation,Botswana,2/14/1972
Alana P. Reynolds,3/4/18,Vitae Dolor Donec PC,Liechtenstein,3/19/1991
Carson D. Castaneda,4/3/18,Sit Amet Massa LLP,India,9/12/1977
Arden W. Pena,8/29/17,Dignissim Corporation,Gambia,2/18/1988
Laurel J. Rosales,1/29/18,Nisi Corp.,Svalbard and Jan Mayen Islands,8/4/1992
Anne T. Hooper,4/8/18,Sit Amet LLP,Iran,10/27/1981
Slade D. Gomez,5/24/18,Libero Institute,Tokelau,3/10/1986
Uma Z. Morrow,3/21/18,Justo Faucibus LLP,Kenya,1/5/1976
Julian C. Roth,8/28/17,Sociosqu Ad LLC,Netherlands,12/17/1970
Jasper A. Wilder,10/7/17,Nulla Dignissim LLC,Marshall Islands,5/10/1978
Rahim H. Huffman,3/21/18,Non Hendrerit Foundation,Djibouti,2/21/1987
Upton F. Sanders,9/19/17,Elit Pretium Et Inc.,Viet Nam,3/23/1988
Lenore Z. Luna,12/23/17,Malesuada Vel Venenatis Inc.,Christmas Island,7/1/1995
Iona M. Brown,4/18/18,Mollis Lectus Pede Limited,Djibouti,11/24/1973
Uriah Q. Bradley,11/12/17,Consectetuer Cursus Inc.,New Zealand,1/14/1971
Signe P. Hancock,9/1/17,Rutrum Consulting,Haiti,12/28/1982
Ishmael W. Schroeder,10/14/17,Fermentum Incorporated,Colombia,10/16/1975
Rebecca W. Warner,3/25/18,Volutpat Nulla Foundation,Viet Nam,10/16/1987
Jacqueline V. Mendez,5/22/18,Nisl Foundation,Azerbaijan,10/27/1982
Barrett B. Floyd,2/9/18,Ac Urna Ut Limited,Pakistan,1/11/1973
May T. Wood,4/18/18,Arcu Vivamus Sit Corp.,Poland,7/3/1994
Kibo R. Gallegos,8/7/17,Semper Pretium Inc.,Namibia,5/26/1987
Mason C. Castillo,12/24/17,Neque Sed LLP,Faroe Islands,1/13/1991
Raja K. Graves,6/14/18,Tellus Nunc Limited,Pitcairn Islands,11/18/1988
Berk D. Ellis,1/18/18,Gravida Sit Institute,Saint Pierre and Miquelon,2/20/1982
Willow K. Ryan,3/6/18,Dolor Sit Amet Institute,Mauritania,7/11/1987
Dillon O. Ryan,8/31/17,Molestie Sed Id Consulting,Japan,3/18/1990
Mollie M. Spears,4/1/18,Morbi Tristique Senectus Company,Lesotho,3/2/1978
Stacey P. Mcconnell,4/7/18,Orci Quis Lectus Foundation,Brazil,9/1/1971
Jesse M. Meadows,4/13/18,Libero Et Tristique Corp.,"Virgin Islands, United States",6/1/1972
Jane B. Gray,3/10/18,Luctus Lobortis Class Institute,Grenada,7/22/1987
Jack H. Higgins,5/23/18,Lacinia Vitae Institute,Latvia,11/26/1996
Kelly K. Griffin,6/1/18,Elementum Lorem Ut Limited,Eritrea,2/20/1989
Honorato A. Graham,12/27/17,Semper Et Ltd,Angola,6/9/1986
Charity P. Hall,5/9/18,Mollis Non Associates,Liberia,7/7/1997
MacKenzie P. Gregory,2/16/18,Mauris Magna Company,Andorra,5/18/1972
Brock R. Joseph,10/4/17,Quis Diam Industries,Japan,10/31/1970
Lars H. Vang,11/27/17,Nullam Ut Corp.,Swaziland,9/6/1988
Finn F. Carney,2/24/18,In Condimentum Donec LLP,Mayotte,5/2/1996
Fatima R. Wilder,11/4/17,Ipsum Primis LLP,Singapore,7/21/1982
Nayda H. Hernandez,8/4/17,Consectetuer Associates,Jersey,9/28/1986
Hayfa K. Mullen,3/3/18,Cras Dictum LLP,Cocos (Keeling) Islands,10/10/1988
Ina X. Morrison,4/27/18,Magna Cras Convallis Limited,Niger,2/3/1992
Bell X. Brock,1/1/18,Ornare Egestas Ligula Institute,Central African Republic,3/22/1982
Zephr Q. Ferrell,12/18/17,Nibh Phasellus Inc.,Venezuela,1/13/1994
Suki Q. Brock,8/7/17,Accumsan Ltd,Saint Lucia,5/17/1987
Sage A. Keith,10/23/17,Vulputate Corporation,Turkey,5/24/1976
Hanna O. Barker,8/2/17,In Industries,Svalbard and Jan Mayen Islands,8/12/1973
Amanda Y. Dixon,8/27/17,Consectetuer Adipiscing Elit Inc.,Cameroon,2/27/1995
Chaney X. Blankenship,12/13/17,Mauris Rhoncus Id Incorporated,Papua New Guinea,7/1/1993
Barrett Y. Silva,1/17/18,Odio Aliquam Vulputate Institute,United Arab Emirates,11/13/1976
Octavius R. Hart,3/3/18,Vitae Aliquet Nec Incorporated,Norfolk Island,9/5/1977
Ingrid I. Oneal,9/16/17,Ut Associates,"Saint Helena, Ascension and Tristan da Cunha",10/30/1987
Yardley T. Wong,11/15/17,Nam Associates,Japan,7/6/1983
Conan P. English,12/2/17,Mauris Blandit Limited,Norfolk Island,11/28/1982
Cassady R. Roy,1/23/18,Vivamus Company,Italy,8/22/1985
Phyllis R. Terry,3/18/18,Dolor Consulting,South Sudan,7/27/1979
Phelan S. Curry,2/26/18,Duis Dignissim Consulting,Iraq,12/1/1979
Sybill N. Flores,10/16/17,Eu Turpis Institute,Saint Pierre and Miquelon,4/29/1974
Grace N. Waller,2/1/18,Arcu Corp.,Grenada,12/31/1977
Steven W. Ellis,8/16/17,Proin Ltd,"Saint Helena, Ascension and Tristan da Cunha",9/14/1972
Germane D. Montoya,9/30/17,Massa Quisque Porttitor Ltd,Myanmar,9/9/1974
Aurora E. Reid,6/17/18,Ornare Sagittis Felis Industries,Bermuda,7/25/1993
Rana R. Stout,2/25/18,Quam Dignissim Institute,Holy See (Vatican City State),1/3/1971
Calista L. Holloway,11/19/17,Tempor Foundation,Yemen,5/13/1972
Quinn Y. Skinner,3/18/18,Donec Sollicitudin Adipiscing Consulting,Seychelles,10/19/1994
Macy V. Moreno,4/30/18,Tincidunt Institute,Congo (Brazzaville),4/21/1988
Mufutau W. Hancock,2/17/18,Felis Orci PC,Togo,8/15/1977
Fiona G. Fulton,5/3/18,Euismod Ac Fermentum Consulting,Slovenia,3/20/1977
Scott F. Gutierrez,12/28/17,Ligula Tortor Dictum Ltd,Ireland,7/13/1990
Illana C. Ward,11/1/17,A Magna Consulting,Gibraltar,12/23/1982
Rinah S. Roberson,8/10/17,Laoreet Libero Et Institute,Malaysia,1/9/1980
George D. Francis,6/1/18,A Scelerisque Sed LLP,Tanzania,5/24/1972
Dexter X. Cameron,5/18/18,Tristique Aliquet Inc.,Laos,4/10/1979
Alvin N. Hyde,12/1/17,Tempor Augue Incorporated,United Kingdom (Great Britain),6/12/1985
Winifred K. Morales,4/24/18,Fames Incorporated,Italy,11/25/1975
Thaddeus J. England,3/26/18,Semper Auctor Corporation,Zambia,12/21/1996
Skyler O. George,5/16/18,At Institute,Jamaica,6/2/1986
Kieran H. Tyler,9/21/17,Vulputate Eu Ltd,Tuvalu,2/14/1971
Cairo F. Baldwin,5/24/18,Amet LLP,Palau,8/2/1973
Robin U. Macias,10/9/17,Elit Nulla LLP,Burkina Faso,5/14/1982
;;;;

data _null_;
  file "&path&delim.state_data.txt";
  infile datalines truncover;
  input;
  varlen=length(_infile_);
  put _infile_ $varying100. varlen;
datalines4;
Region State Capital Bird
South Georgia Atlanta 'Brown Thrasher'
South 'North Carolina' Raleigh Cardinal
North Connecticut Hartford Robin
West Washington Olympia 'American Goldfinch'
Midwest Illinois Springfield Cardinal
;;;;

data _null_;
  file "&path&delim.test.csv";
  infile datalines truncover;
  input;
  varlen=length(_infile_);
  put _infile_ $varying100. varlen;
datalines4;
Akron,7/4/2018,7/8/2018,$175.00 
;;;;

data _null_;
  file "&path&delim.test.txt";
  infile datalines truncover;
  input;
  varlen=length(_infile_);
  put _infile_ $varying100. varlen;
datalines4;
Name.Avg_Test.Avg_Homework_Score
Betsy J.83.85
Sarah K.87.88
Vishal P.88.91
Kris C.81.85
Katherine L.79.85
Damion W.88.91
Wallace L.89.91
Pria O.90.93
Orion K.85.90
Destiny C.80.82
Kimberly T.80.84
Michael D.85.88
Lee T.87.85
Tula J.79.80
Avery J.80.82
;;;;
