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
| Last updated: February 5, 2019                                            |
\*******************************************************************/ 
/* Make sure the path macro variable points to your certification data location */
%let path=/folders/myfolders/cert;

/********************************************************************
 Do not modify the code below this line 
********************************************************************/
%macro setdelim;
   %global delim;
   %if %index(&path,%str(/)) %then %let delim=%str(/);
   %else %let delim=%str(\);
%mend;
%setdelim

%macro makedata;
%include "&path&delim.cre8permdata.sas";
%include "&path&delim.cre8workdata.sas";
%include "&path&delim.cre8flatfiles.sas";
%put;
%put NOTE- *******************************************************;
%put NOTE- Your SAS Certification Prep Guide data files are ready.;
%put NOTE- *******************************************************;
%mend;
%makedata;
