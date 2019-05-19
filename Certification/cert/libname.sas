%let path=/folders/myfolders/SAS/cert;
%macro setdelim;
   %global delim;
   %if %index(&path,%str(/)) %then %let delim=%str(/);
   %else %let delim=%str(\);
%mend;
%setdelim
libname cert "&path";
%include "&path&delim.cre8workdata.sas";

