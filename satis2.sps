
Get file="D:\satis\RIR.sav"
   /keep id scale birth_y.
DATASET NAME RIRR.
DATASET ACTIVATE RIRR.
SORT CASES BY id.
*RII2000.
GET 
  FILE='D:\satis\rii2000_c_v200901(spss).sav'
/keep x01 x01a x01b x02 x06 a01 a02 a04 a03 c01 c03a01 c03a02 c03b c04 
c05z02 c07 c06b c08z02 c08z03 b09 a05z01 a05z02 a06 a08 a09 c19 
c21a01 c21a02 c21b c23 c22 g03a g03b g03c f01.
Dataset name RII2000.
RENAME VARIABLES
x01=id x01a=category x01b=scale x02=period x06=district a01=male a02=birth_y a04=health a03=edu c01=work c03a01=indust 
c03a02=occu c03b=workfor c04=workers c05z02=workplace c07=workhrs c06b=wage b09=fworkyrs a05z01=marry a05z02=myear 
a06=Sbirth_y a08=Sedu a09=Shealth c19=Swork c21a01=Sindust c21a02=Soccu c21b=Sworkfor c23=Sworkhrs c22=Swage 
g03a=love_S g03b=love_son g03c=love_dau f01=children.
compute age = (period-1911)-birth_y.
EXECUTE.
recode Sbirth_y (96,97,98,99=SYSMIS).
recode c08z02 c08z03(96, 99 =SYSMIS).
compute seniority = c08z02 + (c08z03/12).
EXECUTE.
delete variables c08z02 c08z03.
recode indust Sindust(1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
save OUTFILE= 'D:\satis\RII2000.sav'
 /COMPRESSED.

RII2001.
GET 
  FILE='D:\satis\RII2001_c_V200707(spss).sav'
 /keep x01 x01a x01b x02 x05 a01 a02 a04 a03 c01a c03a01 c03a02 
c03b c04 c06z02 c08 c07b c09z02 c09z03 c21a c21b c22 c24a c25 c26a
c28a01 c28a02 c28b c31 c30 g03a g03b g03c f01 b09 d11ac1 d11ac2 d11ac3 d11ac4.
Dataset name RII2001.
RENAME VARIABLES
x01=id x01a=category x01b=scale x02=period x05=district a01=male a02=birth_y a04=health a03=edu 
c01a=work c03a01=indust c03a02=occu c03b=workfor c04=workers c06z02=workplace c08=workhrs 
c07b=wage b09=fworkyrs c22=Sbirth_y c24a=Sedu c25=Shealth c26a=Swork c28a01=Sindust c28a02=Soccu 
c28b=Sworkfor c31=Sworkhrs c30=Swage g03a=love_S g03b=love_son g03c=love_dau f01=children d11ac1=C1rank d11ac2=C2rank d11ac3=C3rank d11ac4=C4rank.
recode Sbirth_y (96,97,98,99=SYSMIS).
recode work Swork(1,2,3 =1)(4,5,6=2)(else=SYSMIS).
compute age = (period-1911)-birth_y.
EXECUTE.
recode c09z02 c09z03 (96,99 =SYSMIS).
compute seniority = c09z02 + (c09z03/12).
EXECUTE.
delete variables c09z02 c09z03.
if (c21a=1) marry =3.
if (c21b=1) marry =3.
if (c21b=2) marry =4.
if (c21b=3) marry =5.
if (c21b=4) marry =6. 
recode indust Sindust(1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
EXECUTE.
save outfile= 'D:\satis\RII2001.sav'
 /COMPRESSED.

*RIII2001.
GET 
  FILE='D:\satis\RIII2001_c_V200707(spss).sav'
   /keep x01 x01a x01b x05 a01 a02 a03a a05a01 a05a02 a05b a08 a07b a11a 
a11b a12 a14a a15 a16a a18a01 a18a02 a18b a21 a20 d01 
b12ac1 b12ac2 b12ac3 b12ac4.
Dataset name RIII2001.
RENAME VARIABLES
x01=id x01a=category x01b=scale x05=district a01=life4 a02=health a03a=work a05a01=indust a05a02=occu 
a05b=workfor a08=workhrs a07b=wage a12=Sbirth_y a14a=Sedu a15=Shealth a16a=Swork a18a01=Sindust 
a18a02=Soccu a18b=Sworkfor a21=Sworkhrs a20=Swage d01=children b12ac1=C1rank b12ac2=C2rank
b12ac3=C3rank b12ac4=C4rank.
recode Sbirth_y (96,97,98,99=SYSMIS).
recode work Swork(1,2,3 =1)(4,5,6=2)(else=SYSMIS).
if (a11a=1) marry =3.
if (a11b=1) marry =3.
if (a11b=2) marry =4.
if (a11b=3) marry =5.
if (a11b=4) marry =6. 
recode indust Sindust(1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
compute period = 2001.
EXECUTE.
delete variables a11a a11b.

DATASET ACTIVATE RIII2001.
SORT CASES BY id.
MATCH FILES /FILE=RIII2001
  /FILE=RIRR
  /BY id.
EXECUTE.
select if period=2001.
EXECUTE.
DATASET CLOSE RIII2001.
DATASET NAME RIII2001.
DATASET ACTIVATE RIII2001.
save outfile= 'D:\satis\RIII2001.sav'
 /COMPRESSED.

*RR2002.
GET FILE="D:\satis\riii&riv2002_c_v200907(spss).sav"
   /keep x01 x01a x01b x02 x05 a01 a02 a03a a05a01 a05a02 a05b a05c 
a06a02 a09 a08b d04a01 a14 a15 a17a a18 a19a a21a01 a21a02 a21b a21c a22a02 
a25 a24 e01 c13ac1 c13ac2 c13ac3 c13ac4.
DATASET NAME RR2002.
RENAME VARIABLES 
x01=id x01a=category x01b=scale x02=period x05=district a01=life4 a02=health a03a=work a05a01=indust 
a05a02=occu a05b=workfor a05c=workers a06a02=workplace a09=workhrs a08b=wage d04a01=pension 
a14=marry a15=Sbirth_y a17a=Sedu a18=Shealth a19a=Swork a21a01=Sindust a21a02=Soccu 
a21b=Sworkfor a21c=Sworkers a22a02=Sworkplace a25=Sworkhrs a24=Swage e01=children 
c13ac1=C1rank c13ac2=C2rank c13ac3=C3rank c13ac4=C4rank.

recode Sbirth_y (96,97,98,99=SYSMIS).
recode work Swork(1,2,3 =1)(4,5,6=2)(else=SYSMIS).
recode indust Sindust(1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).

DATASET ACTIVATE RR2002.
SORT CASES BY id.
MATCH FILES /FILE=RR2002
  /FILE=RIRR
  /BY id.
EXECUTE.
select if period=2002.
EXECUTE.
DATASET CLOSE RR2002.
DATASET NAME RR2002.
DATASET ACTIVATE RR2002.
save outfile= 'D:\satis\RR2002.sav'
 /COMPRESSED.

*RR2003.
GET FILE="D:\satis\rivrv2003_c_v201401_spss.sav"
 /keep x01 x05 a01 a03.
DATASET NAME RR2003.
RENAME VARIABLES 
x01=id x05=district a01=male a03=health.
compute period=2003.
EXECUTE.
DATASET ACTIVATE RR2003.
SORT CASES BY id.
MATCH FILES /FILE=RR2003
  /FILE=RIRR
  /BY id.
EXECUTE.
select if period=2003.
EXECUTE.
DATASET CLOSE RR2003.
DATASET NAME RR2003.
DATASET ACTIVATE RR2003.
save outfile= 'D:\satis\RR2003.sav'
 /COMPRESSED.

*RR2004.
GET FILE="D:\satis\riirvrvi2004_c_v201401_spss.sav"
   /keep x01 x01a x01b x02 x06 a01 a02 a03 a05a01 a05a02 a05b a05c a06a02 a09 
a08b d04a01 a24b a25 a27a a28 a29 a31a01 a31a02 a31b a31c a32a02 
a35 a34b c13ef1 c13em1 c13ef2 c13em2 e01 c13bc1 c13c01c1 c13ac1 c13bc2 c13c01c2 c13ac2 
c13bc3 c13c01c3 c13ac3 c13bc4 c13c01c4 c13ac4. 
DATASET NAME RR2004.
RENAME VARIABLES 
x01=id x01a=category x01b=scale x02=period x06=district a01=life4 a02=health a03=work a05a01=indust 
a05a02=occu a05b=workfor a05c=workers a06a02=workplace a09=workhrs a08b=wage d04a01=pension 
a24b=marry a25=Sbirth_y a27a=Sedu a28=Shealth a29=Swork a31a01=Sindust a31a02=Soccu 
a31b=Sworkfor a31c=Sworkers a32a02=Sworkplace a35=Sworkhrs a34b=Swage c13ef1=cohabit_f 
c13em1=cohabit_m c13ef2=cohabit_Sf c13em2=cohabit_Sm e01=children c13bc1=C1male 
c13c01c1=C1birth_y c13ac1=C1rank c13bc2=C2male c13c01c2=C2birth_y c13ac2=C2rank 
c13bc3=C3male c13c01c3=C3birth_y c13ac3=C3rank c13bc4=C4male c13c01c4=C4birth_y 
c13ac4=C4rank.  
recode cohabit_f(0=0)(8=1)(1 thru 7=2)(else=SYSMIS).
recode cohabit_m(0=0)(8=1)(1 thru 7=2)(else=SYSMIS).
recode cohabit_Sf(0=0)(8=1)(1 thru 7=2)(else=SYSMIS).
recode cohabit_Sm(0=0)(8=1)(1 thru 7=2)(else=SYSMIS).
recode indust Sindust(1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
recode marry (1=3)(2=1).
recode period(SYSMIS=2004).
recode Sbirth_y(0=SYSMIS).
EXECUTE.
DATASET ACTIVATE RR2004.
SORT CASES BY id.
MATCH FILES /FILE=RR2004
  /FILE=RIRR
  /BY id.
EXECUTE.
select if period=2004.
EXECUTE.
DATASET CLOSE RR2004.
DATASET NAME RR2004.
DATASET ACTIVATE RR2004.
save outfile= 'D:\satis\RR2004.sav'
 /COMPRESSED.

*RR2005.
GET file="D:\satis\RR2005_c_V200701(SPSS).sav"
   /keep x01 x01a x01b x02 x06 a01 a02a a11a a13a01 a13a02 a13b a13c a14a02 a17 a16b c04a01 
a22 a23 a25a a26 a27a a29a01 a29a02 a29b a29c a30a02 a33 a32b b13ef1 b13em1 b13ef2 b13em2 
f01a f01b f01c f01d f01e f01f f01g b12e b13bc1 b13c01c1 b13ac1 b13bc2 b13c01c2 b13ac2 
b13bc3 b13c01c3 b13ac3 b13bc4 b13c01c4 b13ac4. 
DATASET NAME RR2005.
RENAME VARIABLES x01=id x01a=category x01b=scale x02=period x06=district a01=life4 a02a=health a11a=work 
a13a01=indust a13a02=occu a13b=workfor a13c=workers a14a02=workplace a17=workhrs a16b=wage 
c04a01=pension a22=marry a23=Sbirth_y a25a=Sedu a26=Shealth a27a=Swork a29a01=Sindust 
a29a02=Soccu a29b=Sworkfor a29c=Sworkers a30a02=Sworkplace a33=Sworkhrs a32b=Swage 
b13ef1=cohabit_f b13em1=cohabit_m b13ef2=cohabit_Sf b13em2=cohabit_Sm f01a=love_fa 
f01b=love_mom f01c=love_bro f01d=love_sis f01e=love_S f01f=love_son f01g=love_dau b12e=children 
b13bc1=C1male b13c01c1=C1birth_y b13ac1=C1rank b13bc2=C2male b13c01c2=C2birth_y 
b13ac2=C2rank b13bc3=C3male b13c01c3=C3birth_y b13ac3=C3rank b13bc4=C4male 
b13c01c4=C4birth_y b13ac4=C4rank. 
recode cohabit_f(0=0)(8=1)(1 thru 7=2)(else=SYSMIS).
recode cohabit_m(0=0)(8=1)(1 thru 7=2)(else=SYSMIS).
recode cohabit_Sf(0=0)(8=1)(1 thru 7=2)(else=SYSMIS).
recode cohabit_Sm(0=0)(8=1)(1 thru 7=2)(else=SYSMIS).
recode indust Sindust(1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
recode marry(1=3)(2=1)(4=3)(5=4)(6=5)(7=6)(3=6).
recode work Swork(1,2,3=1)(4,5,6=2)(else=SYSMIS).
recode pension(2,3=2)(else=sysmis).
recode Sbirth_y(0=SYSMIS).
recode workers Sworkers(7=6)(8=7).
SELECT IF category=1.
EXECUTE.
DATASET ACTIVATE RR2005.
SORT CASES BY id.
MATCH FILES /FILE=RR2005
  /FILE=RIRR
  /BY id.
EXECUTE.
select if period=2005.
EXECUTE.
DATASET CLOSE RR2005.
DATASET NAME RR2005.
DATASET ACTIVATE RR2005.
save outfile= 'D:\satis\RR2005.sav'
 /COMPRESSED.
*RR2006.
GET FILE="D:\satis\RR2006_c_V200801_SPSS.sav"
   /keep z01 z01a z01b z02 z04b a01 a02 a03 a04a a07 a11a01 a11a02 
a11b a11c a12a02 a14 a13b a22 a23 a25a a26 a27a a29a01 a29a02 a29b a29c a30a02 
a32 a31b b13hf1 b13hm1 b13hf2 b13hm2 d01c d01b d01a b12e b13bc1 b13c01c1 b13ac1 
b13bc2 b13c01c2 b13ac2 b13bc3 b13c01c3 b13ac3 b13bc4 b13c01c4 b13ac4 c04a01.
RENAME VARIABLES
z01=id z01a=category z01b=scale z02=period z04b=district a01=male a02=birth_y a03=life4 a04a=health
 a07=work a11a01=indust a11a02=occu a11b=workfor a11c=workers a12a02=workplace a14=workhrs 
a13b=wage a22=marry a23=Sbirth_y a25a=Sedu a26=Shealth a27a=Swork a29a01=Sindust a29a02=Soccu 
a29b=Sworkfor a29c=Sworkers a30a02=Sworkplace a32=Sworkhrs a31b=Swage b13hf1=cohabit_f 
b13hm1=cohabit_m b13hf2=cohabit_Sf b13hm2=cohabit_Sm d01c=love_S d01b=love_son d01a=love_dau 
b12e=children b13bc1=C1male b13c01c1=C1birth_y b13ac1=C1rank b13bc2=C2male b13c01c2=C2birth_y 
b13ac2=C2rank b13bc3=C3male b13c01c3=C3birth_y b13ac3=C3rank b13bc4=C4male 
b13c01c4=C4birth_y b13ac4=C4rank c04a01=pension. 
recode Sbirth_y(0,96,98=SYSMIS).
recode cohabit_f(0=0)(8=1)(1 thru 7=2)(else=SYSMIS).
recode cohabit_m(0=0)(8=1)(1 thru 7=2)(else=SYSMIS).
recode cohabit_Sf(0=0)(8=1)(1 thru 7=2)(else=SYSMIS).
recode cohabit_Sm(0=0)(8=1)(1 thru 7=2)(else=SYSMIS).
recode indust Sindust(1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
recode pension(2,3=2)(else=SYSMIS).
recode workers Sworkers(7=6)(8=7).
SELECT IF category=1.
EXECUTE.
DATASET ACTIVATE RR2006.
SORT CASES BY id.
MATCH FILES /FILE=RR2006
  /FILE=RIRR
  /BY id.
EXECUTE.
select if period=2006.
EXECUTE.
DATASET CLOSE RR2006.
DATASET NAME RR2006.
DATASET ACTIVATE RR2006.
save outfile= 'D:\satis\RR2006.sav'
 /COMPRESSED.



   /FILE=RI1999
   /FILE=RI2003
   /FILE=RI2009
   /FILE=RR2007
   /FILE=RR2008
   /FILE=RR2009
   /FILE=RR2010
   /FILE=RR2011
   /FILE=RR2012
   /FILE=RR2014
   /FILE=RR2016
   /FILE=RR2018
   /FILE=rr2020.
EXECUTE.

GET FILE 'D:\satis\RI1999.sav'
/KEEP= id birth_y.
dataset name br19.
DATASET ACTIVATE br19.
SORT CASES BY id.
GET FILE 'D:\satis\RI2000.sav'
/KEEP= id birth_y.
DATASET NAME br20.
DATASET ACTIVATE br20.
SORT CASES BY id.
GET FILE 'D:\satis\RI2003.sav'
/KEEP= id birth_y.
DATASET NAME br23.
DATASET ACTIVATE br23.
SORT CASES BY id.
ADD FILES /FILE=br23
   /FILE = br20
   /FILE = br19.
EXECUTE.
DATASET NAME brall.
SORT CASES BY id.
DATASET CLOSE br19.
DATASET CLOSE br20.
DATASET CLOSE br23.

