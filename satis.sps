*RI2000.
GET
  FILE='D:\satis\RI2000_c_V200707(spss).sav'
/KEEP x01 x01a x01b x02 x06 a01 a02 a04a 
b01 b02z01 b02z02 c01 c02 c04a01 c04a02 c04b c05 c06z02 c07 c08 c09 c16 c17a01 c17a02 c17b c19 c21a01 c21a02 c21b c22z01 c22z02 c23 
d01z01 d01z02 d11 d13 d15a d16 d17 d19a01 d19a02 d19b d20 d21z02 d22 d23 d24 d32a01 d32a02 d32b d33z01 d33z02
e01a e01b e01c e01d e01e e01f e01g e01h e01i e02a e02b e02c e02d e02e e02f e02g e02h e02i 
f06f1 f06m1 f06f2 f06m2 f11z01 f11z02 f11z03 f11z04 f11z05 
i01 i01z01 i01z02 i02a01 i02a02 i02a03 i02a05 i02a09 i02b01 i02b02 i02b03 i02b05 i02b09 i02c01 i02c02 i02c03 i02c05 i02c09 
i02d01 i02d02 i02d03 i02d05 i02d09 i02e01 i02e02 i02e03 i02e05 i02e09 i02f01 i02f02 i02f03 i02f05 i02f09 
j01a j01b j01c j01d j01e j01f j01g h02a h02b.
DATASET NAME RI2000.
RENAME VARIABLES
x01=id x01a=category x01b=scale x02=period x06=district a01=male a02=birth_y a04a=health 
b01=edu b02z01=grad_y b02z02=grad c04a01=indust c04a02=occu c04b=workfor c05=workers c06z02=workplace c07=workhrs c08=wage 
c09=seniority c16=fwork_y c17a01=fwork_indust c17a02=fwork_occu c17b=fworkfor c19=fwage c21a01=rwork_indust c21a02=rwork_occu c21b=rworkfor 
c22z01=rwage c22z02=rwyear c23=pension d01z01=marry d01z02=myear d11=Sbirth_y d13=Sedu d15a=Shealth d19a01=Sindust d19a02=Soccu d19b=Sworkfor 
d20=Sworkers d21z02=Sworkplace d22=Sworkhrs d23=Swage d32a01=Srwork_indust d32a02=Srwork_occu d32b=Srworkfor d33z01=Srwage d33z02=Srwyear 
e01a=filial_1 e01b=filial_2 e01c=filial_3 e01d=filial_4 e01e=filial_5 e01f=filial_6 e01g=filial_7 e01h=filial_8 e01i=filial_9
e02a=family_1 e02b=family_2 e02c=family_3 e02d=family_4 e02e=family_5 e02f=family_6 e02g=family_7 e02h=family_8 e02i=family_9 
f06f1=cohabit_f f06m1=cohabit_m f06f2=cohabit_Sf f06m2=cohabit_Sm f11z01=siblings f11z02=brother_old f11z03=brother_young f11z04=sister_old f11z05=sister_young 
i01=children i01z01=sons i01z02=daughters i02a01=C1male i02a02=C1birth_y i02a03=C1rank i02a05=C1edu i02a09=C1care 
i02b01=C2male i02b02=C2birth_y i02b03=C2rank i02b05=C2edu i02b09=C2care i02c01=C3male i02c02=C3birth_y i02c03=C3rank i02c05=C3edu i02c09=C3care 
i02d01=C4male i02d02=C4birth_y i02d03=C4rank i02d05=C4edu i02d09=C4care i02e01=C5male i02e02=C5birth_y i02e03=C5rank i02e05=C5edu i02e09=C5care 
i02f01=C6male i02f02=C6birth_y i02f03=C6rank i02f05=C6edu i02f09=C6care j01a=love_fa j01b=love_mom j01c=love_bro j01d=love_sis 
j01e=love_S j01f=love_son j01g=love_dau h02a=housework h02b=Shousework.
compute work=0.
EXECUTE.
DO IF (c01=1|c02=1).
recode work (0=1).
end if.
EXECUTE.
do if (c01=2|c02=2).
recode work(0=2).
end if.
EXECUTE.
compute Swork=0.
EXECUTE.
do if (d16=1|d17=1).
recode Swork(0=1).
end if.
EXECUTE.
do if (d16=2|d17=2).
recode Swork(0=2).
end if.
EXECUTE.
recode d24(0,96,97,98,99=SYSMIS).
compute Sseniority=(period-1911)-d24.
recode birth_y grad_y fwork_y rwyear myear Sbirth_y Srwyear C1birth_y C2birth_y C3birth_y C4birth_y C5birth_y C6birth_y(96,97,98,99=SYSMIS).
recode pension(2,3,4=1)(1=2).
recode indust Sindust fwork_indust rwork_indust Srwork_indust(1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
EXECUTE.
DELETE VARIABLES c01 c02 d16 d17 d24.
SAVE OUTFILE='D:\satis\RI2000.sav'
  /COMPRESSED.
*RI1999.
GET
  FILE='D:\satis\RI1999_v201703_spss.sav'
/KEEP x01 x01a x01b x02 x06 a01 a02 a04a b01 b02z01 b02z02 
c01 c02 c04a01 c04a02 c04b c05 c06z02 c07 c08 c09 c15 c16a01 c16a02 c16b c18 
d01z01 d01z02 d11 d13 d15a d16 d17 d19a01 d19a02 d19b d20 d21z02 d22 d23 d24 
e01a e01b e01c e01d e01e e01f e01g e01h e01i e02a e02b e02c e02d e02e e02f e02g e02h e02i 
f06f1 f06m1 f06f2 f06m2 f22z01 f22z02 f22z03 f22z04 f22z05 j01 j01z01 j01z02 j02z01c1 j02z02c1 j02z03c1 j02z07c1 j02z01c2 j02z02c2 
j02z03c2 j02z07c2 j02z01c3 j02z02c3 j02z03c3 j02z07c3 j02z01c4 j02z02c4 j02z03c4 j02z07c4 
i01a i01b i01c i01d i01e i01f i01g h02a h02b.
DATASET NAME RI1999.
RENAME VARIABLES
x01=id x01a=category x01b=scale x02=period x06=district a01=male a02=birth_y a04a=health b01=edu b02z01=grad_y b02z02=grad 
c04a01=indust c04a02=occu c04b=workfor c05=workers c06z02=workplace c07=workhrs c08=wage c09=seniority c15=fwork_y 
c16a01=fwork_indust c16a02=fwork_occu c16b=fworkfor c18=fwage d01z01=marry d01z02=myear d11=Sbirth_y d13=Sedu d15a=Shealth 
d19a01=Sindust d19a02=Soccu d19b=Sworkfor d20=Sworkers d21z02=Sworkplace d22=Sworkhrs d23=Swage 
e01a=filial_1 e01b=filial_2 e01c=filial_3 e01d=filial_4 e01e=filial_5 e01f=filial_6 e01g=filial_7 e01h=filial_8 e01i=filial_9 
e02a=family_1 e02b=family_2 e02c=family_3 e02d=family_4 e02e=family_5 e02f=family_6 e02g=family_7 e02h=family_8 e02i=family_9 
f06f1=cohabit_f f06m1=cohabit_m f06f2=cohabit_Sf f06m2=cohabit_Sm f22z01=siblings f22z02=brother_old f22z03=brother_young f22z04=sister_old f22z05=sister_young 
j01=children j01z01=sons j01z02=daughters j02z01c1=C1male j02z02c1=C1birth_y j02z03c1=C1edu j02z07c1=C1care 
j02z01c2=C2male j02z02c2=C2birth_y j02z03c2=C2edu j02z07c2=C2care j02z01c3=C3male j02z02c3=C3birth_y j02z03c3=C3edu j02z07c3=C3care 
j02z01c4=C4male j02z02c4=C4birth_y j02z03c4=C4edu j02z07c4=C4care i01a=love_fa i01b=love_mom i01c=love_bro i01d=love_sis 
i01e=love_S i01f=love_son i01g=love_dau h02a=housework h02b=Shousework.
compute work=0.
EXECUTE.
DO IF (c01=1|c02=1).
recode work (0=1).
end if.
EXECUTE.
do if (c01=2|c02=2).
recode work(0=2).
end if.
EXECUTE.
compute Swork=0.
EXECUTE.
do if (d16=1|d17=1).
recode Swork(0=1).
end if.
EXECUTE.
do if (d16=2|d17=2).
recode Swork(0=2).
end if.
EXECUTE.
recode d24(0,96,97,98,99=SYSMIS).
compute Sseniority=(period-1911)-d24.
recode indust Sindust fwork_indust(1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
recode birth_y grad_y fwork_y myear Sbirth_y C1birth_y C2birth_y C3birth_y C4birth_y(96,97,98,99=SYSMIS).
EXECUTE.
DELETE VARIABLES c01 c02 d16 d17 d24.
SAVE OUTFILE='D:\satis\RI1999.sav'
  /COMPRESSED.

*RI2003.
GET
  FILE='D:\satis\RI2003_c_v201808_spss.sav'
/keep x01 x05 a01 a02 a04a b01 b02z1 b02z2 c01 c02 c04a1 c04a2 c04b c05 c06z2 c07 c08 c09 c16 c17a1 c17a2 c17b c19 
d01z1 d01z2 d11 d13 d15a d16 d17 d19a1 d19a2  d20 d21z2 d22 d23 d24 e01a e01b e01c e01d e01e e01f e01g e01h e01i 
e02a e02b e02c e02d e02e e02f e02g e02h e02i f06z0f1 f06z0m1 f06z0f2 f06z0m2 f11z1 f11z2 f11z3 f11z4 f11z5 i01 
i01a i01b i02a1 i02a2 i02a3 i02a4 i02a8 i02b1 i02b2 i02b3 i02b4 i02b8 i02c1 i02c2 i02c3 i02c4 i02c8 i02d1 i02d2 i02d3 i02d4 i02d8 
i02e1 i02e2 i02e3 i02e4 i02e8 i02f1 i02f2 i02f3 i02f4 i02f8 j01a j01b j01c j01d j01e j01f j01g h02a h02b.
DATASET NAME RI2003.
RENAME VARIABLES
x01=id x05=district a01=male a02=birth_y a04a=health b01=edu b02z1=grad_y b02z2=grad c04a1=indust c04a2=occu c04b=workfor c05=workers 
c06z2=workplace c07=workhrs c08=wage c09=seniority c16=fwork_y c17a1=fwork_indust c17a2=fwork_occu c17b=fworkfor c19=fwage 
d01z1=marry d01z2=myear d11=Sbirth_y d13=Sedu d15a=Shealth d19a1=Sindust d19a2=Soccu d20=Sworkers d21z2=Sworkplace d22=Sworkhrs d23=Swage 
e01a=filial_1 e01b=filial_2 e01c=filial_3 e01d=filial_4 e01e=filial_5 e01f=filial_6 e01g=filial_7 e01h=filial_8 e01i=filial_9 
e02a=family_1 e02b=family_2 e02c=family_3 e02d=family_4 e02e=family_5 e02f=family_6 e02g=family_7 e02h=family_8 e02i=family_9 
f06z0f1=cohabit_f f06z0m1=cohabit_m f06z0f2=cohabit_Sf f06z0m2=cohabit_Sm f11z1=siblings 
f11z2=brother_old f11z3=brother_young f11z4=sister_old f11z5=sister_young i01=children i01a=sons i01b=daughters 
i02a1=C1male i02a2=C1birth_y i02a3=C1rank i02a4=C1edu i02a8=C1care i02b1=C2male i02b2=C2birth_y i02b3=C2rank i02b4=C2edu i02b8=C2care 
i02c1=C3male i02c2=C3birth_y i02c3=C3rank i02c4=C3edu i02c8=C3care i02d1=C4male i02d2=C4birth_y i02d3=C4rank i02d4=C4edu i02d8=C4care
i02e1=C5male i02e2=C5birth_y i02e3=C5rank i02e4=C5edu i02e8=C5care i02f1=C6male i02f2=C6birth_y i02f3=C6rank i02f4=C6edu i02f8=C6care 
j01a=love_fa j01b=love_mom j01c=love_bro j01d=love_sis j01e=love_S j01f=love_son j01g=love_dau h02a=housework h02b=Shousework.
recode c01(9=SYSMIS).
compute work=0.
EXECUTE.
DO IF (c01=1|c02=1).
recode work (0=1).
end if.
EXECUTE.
do if (c01=2|c02=2).
recode work(0=2).
end if.
EXECUTE.
recode work(0=SYSMIS).
compute Swork=0.
EXECUTE.
do if (d16=1|d17=1).
recode Swork(0=1).
end if.
EXECUTE.
do if (d16=2|d17=2).
recode Swork(0=2).
end if.
EXECUTE.
recode d24(0,96,97,98,99=SYSMIS).
compute period=2003.
compute category=1.
compute scale=3.
compute Sseniority=(period-1911)-d24.
recode birth_y grad_y fwork_y myear Sbirth_y C1birth_y C2birth_y C3birth_y C4birth_y C5birth_y C6birth_y(96,97,98,99=SYSMIS).
recode workers Sworkers(7=6)(8=7).
recode indust Sindust fwork_indust(1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
EXECUTE.
DELETE VARIABLES c01 c02 d16 d17 d24.
SAVE OUTFILE='D:\satis\RI2003.sav'
  /COMPRESSED.

*RI2009.
GET
  FILE='D:\satis\RI2009_v201702_spss.sav'
/keep x01 x01a x01b x02 x05 a01 a02z01 a04a b01 b02z01 b02z02 c01 c02 c04a01 c04a02 c04b c05 c06z02 c07 c08a c09 c16 c17a01 c17a02 c17b c19 
d01a01 d01a02 d11 d13 d15a d16 d17 d19a01 d19a02 d19b d20 d21z02 d22 d23a d24 e01a e01b e01c e01d e01e e01f e01g e01h e01i 
e02a e02b e02c e02d e02e e02f e02g e02h e02i f06f1 f06m1 f06f2 f06m2 f11c01 f11c02 f11c03 f11c04 f11c05 i01 i01a i01b 
i02a01 i02a02z1 i02a03 i02a04 i02a08 i02b01 i02b02z1 i02b03 i02b04 i02b08 i02c01 i02c02z1 i02c03 i02c04 i02c08 i02d01 i02d02z1 i02d03 i02d04 i02d08 
j01a j01b j01c j01d j01e j01f j01g h02a h02b.
DATASET NAME RI2009.
RENAME VARIABLES
x01=id x01a=category x01b=scale x02=period x05=district a01=male a02z01=birth_y a04a=health b01=edu b02z01=grad b02z02=grad_y 
c04a01=indust c04a02=occu c04b=workfor c05=workers c06z02=workplace c07=workhrs c08a=wage c09=seniority c16=fwork_y 
c17a01=fwork_indust c17a02=fwork_occu c17b=fworkfor c19=fwage d01a01=marry d01a02=myear d11=Sbirth_y d13=Sedu d15a=Shealth 
d19a01=Sindust d19a02=Soccu d19b=Sworkfor d20=Sworkers d21z02=Sworkplace d22=Sworkhrs d23a=Swage d24=Sseniority 
e01a=filial_1 e01b=filial_2 e01c=filial_3 e01d=filial_4 e01e=filial_5 e01f=filial_6 e01g=filial_7 e01h=filial_8 e01i=filial_9 
e02a=family_1 e02b=family_2 e02c=family_3 e02d=family_4 e02e=family_5 e02f=family_6 e02g=family_7 e02h=family_8 e02i=family_9 
f06f1=cohabit_f f06m1=cohabit_m f06f2=cohabit_Sf f06m2=cohabit_Sm f11c01=siblings f11c02=brother_old f11c03=brother_young f11c04=sister_old f11c05=sister_young
i01=children i01a=sons i01b=daughters i02a01=C1male i02a02z1=C1birth_y i02a03=C1rank i02a04=C1edu i02a08=C1care 
i02b01=C2male i02b02z1=C2birth_y i02b03=C2rank i02b04=C2edu i02b08=C2care i02c01=C3male i02c02z1=C3birth_y i02c03=C3rank i02c04=C3edu i02c08=C3care 
i02d01=C4male i02d02z1=C4birth_y i02d03=C4rank i02d04=C4edu i02d08=C4care j01a=love_fa j01b=love_mom 
j01c=love_bro j01d=love_sis j01e=love_S j01f=love_son j01g=love_dau h02a=housework h02b=Shousework.
compute work=0.
recode workers Sworkers(7=6)(8=7).
recode marry(3,4,5=3)(6=4)(7=5)(8=6).
recode Sbirth_y (96 thru 99=SYSMIS).
recode indust fwork_indust Sindust (1 thru 3=1)(5 thru 7=2)(8 thru 34=3)(35=4)(36 thru 39=5)(41 thru 43=6)(45 thru 48=7)(49 thru 54=8)
(55,56=9)(58 thru 63=10)(64 thru 66= 11)(67,68=12)(69 thru 76=13)(77 thru 82=14)(83=15)(85=16)(86 thru 88=17)(90 thru 93=18)
(94 thru 96=19).
EXECUTE.
DO IF (c01=1|c01=2).
recode work (0=1).
end if.
EXECUTE.
do if (c02=1|c02=2).
recode work(0=1).
end if.
EXECUTE.
do if (c01=3|c02=3).
recode work(0=2).
end if.
EXECUTE.
compute Swork=0.
EXECUTE.
do if (d16=1|d16=2).
recode Swork(0=1).
end if.
EXECUTE.
do if(d17=1|d17=2).
recode Swork(0=1).
end if.
EXECUTE.
do if (d16=3|d17=3).
recode Swork(0=2).
end if.
EXECUTE.
DELETE VARIABLES c01 c02 d16 d17.
SAVE OUTFILE='D:\satis\RI2009.sav'
  /COMPRESSED.
*RI2016.
GET
  FILE='D:\satis\RI2016_v201811_spss.sav'
/keep x01 x01a x01b x02 x05 a01 a02a01 a04a a04b a04c b01 b02z01 b02z02 c02z01 c04a01 c04a02 c03 c04b c04c02 c06b01 c05a01 c13b 
c14b01 c14b02 c14a c16a d01a d01c01 d11z01 d12 d13 d14z01 d16a01 d16a02 d15 d16b d16c02 d18b01 d17a01 d18c01 
e01a e01b e01c e01d e01e e01f e01g e01h e01i e02a e02b e02c e02d e02e e02f e02g e02h e02i f06bf1 f06bm1 f06bf2 f06bm2 f13z01 f13z02 f13z03 f13z04 f13z05 
i01 i01a i01b i02bc1 i02c01c1 i02ac1 i02gc1 i02ec1 i02bc2 i02c01c2 i02ac2 i02gc2 i02ec2 i02bc3 i02c01c3 i02ac3 i02gc3 i02ec3 
i02bc4 i02c01c4 i02ac4 i02gc4 i02ec4 i02bc5 i02c01c5 i02ac5 i02gc5 i02ec5 j01a j01b j01c j01d j01e j01f j01g d01d h02a h02b.
DATASET NAME RI2016.
RENAME VARIABLES
x01=id x01a=category x01b=scale x02=period x05=district a01=male a02a01=birth_y a04a=happy a04b=life a04c=health b01=edu b02z01=grad b02z02=grad_y 
c02z01=work c04a01=indust c04a02=occu c03=workfor c04b=workers c04c02=workplace c06b01=workhrs c05a01=wage c13b=fwork_y 
c14b01=fwork_indust c14b02=fwork_occu c14a=fworkfor c16a=fwage d01a=marry d01c01=myear d11z01=Sbirth_y d12=Sedu d13=Shealth d14z01=Swork 
d16a01=Sindust d16a02=Soccu d15=Sworkfor d16b=Sworkers d16c02=Sworkplace d18b01=Sworkhrs d17a01=Swage
e01a=filial_1 e01b=filial_2 e01c=filial_3 e01d=filial_4 e01e=filial_5 e01f=filial_6 e01g=filial_7 e01h=filial_8 e01i=filial_9 
e02a=family_1 e02b=family_2 e02c=family_3 e02d=family_4 e02e=family_5 e02f=family_6 e02g=family_7 e02h=family_8 e02i=family_9 f13z01=siblings 
f13z02=brother_old f13z03=brother_young f13z04=sister_old f13z05=sister_young i01=children i01a=sons i01b=daughters 
i02bc1=C1male i02c01c1=C1birth_y i02ac1=C1rank i02gc1=C1edu i02ec1=C1care i02bc2=C2male i02c01c2=C2birth_y i02ac2=C2rank i02gc2=C2edu i02ec2=C2care 
i02bc3=C3male i02c01c3=C3birth_y i02ac3=C3rank i02gc3=C3edu i02ec3=C3care i02bc4=C4male i02c01c4=C4birth_y i02ac4=C4rank i02gc4=C4edu i02ec4=C4care 
i02bc5=C5male i02c01c5=C5birth_y i02ac5=C5rank i02gc5=C5edu i02ec5=C5care j01a=love_fa j01b=love_mom 
j01c=love_bro j01d=love_sis j01e=love_S j01f=love_son j01g=love_dau h02a=housework h02b=Shousework.
recode d18c01(0, 996 thru 999=SYSMIS).
compute Sseniority=(period-1911)-d18c01.
recode work(1,2=1)(3=2)(0=0)(else=sysmis).
recode Swork(1,2=1)(3=2)(0=0)(else=SYSMIS).
recode marry(2=3)(3=4)(4=5)(5=6)(6 thru 9=SYSMIS).
EXECUTE.
DO IF(d01d=1).
recode marry(1=2).
end if.
EXECUTE.
recode f06bf1(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_f.
recode f06bm1(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_m.
recode f06bf2(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sf.
recode f06bm2(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sm.
recode workers Sworkers(7=6)(8=7).
recode Sbirth_y(96 thru 99=SYSMIS).
recode indust fwork_indust Sindust (1 thru 3=1)(5 thru 7=2)(8 thru 34=3)(35=4)(36 thru 39=5)(41 thru 43=6)(45 thru 48=7)(49 thru 54=8)
(55,56=9)(58 thru 63=10)(64 thru 66= 11)(67,68=12)(69 thru 76=13)(77 thru 82=14)(83=15)(85=16)(86 thru 88=17)(90 thru 93=18)
(94 thru 96=19).
EXECUTE.
DELETE VARIABLES f06bf1 f06bm1 f06bf2 f06bm2 d01d d18c01.
save OUTFILE="D:\satis\RI2016.sav"
/COMPRESSED.
*RR2007.
GET
  FILE='D:\satis\RR2007_c_V201101_spss.sav'
/keep x01 x01a x01b x02 x05 a01 a02a a03a a03b a04a d07d d07e a05 a09a01 a09a02 a08b a08c a09b02 a11a a10b a11b01 a11b02 d04a01 a16 a17 
a19 a20 a21a a24a01 a24a02 a23b a23c a24b02 a26a a25b a26b01 a26b02 b14gf1 b14gm1 b14gf2 b14gm2 b12 b13bc1 b13c01c1 b13ac1 b13dc1 
b13bc2 b13c01c2 b13ac2 b13dc2 b13bc3 b13c01c3 b13ac3 b13dc3 b13bc4 b13c01c4 b13ac4 b13dc4 b13bc5 b13c01c5 b13ac5 b13dc5 
b13bc6 b13c01c6 b13ac6 b13dc6.
dataset name RR2007.
rename variables x01=id x01a=category x01b=scale x02=period x05=district a01=male a02a=birth_y 
a03a=happy a03b=life a04a=health d07d=work_satis d07e=family_satis a05=work 
a09a01=indust a09a02=occu a08b=workfor a08c=workers a09b02=workplace 
a11a=workhrs a10b=wage a16=marry a17=Sbirth_y a19=Sedu a20=Shealth 
a21a=Swork a24a01=Sindust a24a02=Soccu a23b=Sworkfor a23c=Sworkers 
a24b02=Sworkplace a26a=Sworkhrs a25b=Swage b12=children 
b13bc1=C1male b13c01c1=C1birth_y b13ac1=C1rank b13dc1=C1edu 
b13bc2=C2male b13c01c2=C2birth_y b13ac2=C2rank b13dc2=C2edu 
b13bc3=C3male b13c01c3=C3birth_y b13ac3=C3rank b13dc3=C3edu 
b13bc4=C4male b13c01c4=C4birth_y b13ac4=C4rank b13dc4=C4edu 
b13bc5=C5male b13c01c5=C5birth_y b13ac5=C5rank b13dc5=C5edu 
b13bc6=C6male b13c01c6=C6birth_y b13ac6=C6rank b13dc6=C6edu
d04a01=pension.
recode Sbirth_y (96 thru 99=SYSMIS).
recode marry(3,4,5=3)(6=4)(7=5)(8=6).
recode a11b01 a11b02(96=SYSMIS).
compute seniority=a11b01+(a11b02/12).
recode a26b01 a26b02(96,98,99=SYSMIS).
compute Sseniority=a26b01+(a26b02/12).
recode b14gf1(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_f.
recode b14gm1(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_m.
recode b14gf2(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sf.
recode b14gm2(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sm.
recode workers Sworkers(7=6)(8=7).
recode pension(2,3=2).
recode indust Sindust (1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
EXECUTE.
DELETE VARIABLES a11b01 a11b02 a26b01 a26b02 b14gf1 b14gm1 b14gf2 b14gm2.
select if (category=1).
EXECUTE.
save OUTFILE="D:\satis\RR2007.sav"
/COMPRESSED.
*RR2008.
GET
  FILE='D:\satis\RR2008_c_v201207_spss.sav'
/keep x01 x01a x01b x02 x05 a01 a02a a03a a03b a04a c07a c07b a05 a09a01 a09a02
a08b a08c a09b02 a11a a10b a11b01 a11b02 c04a01 a16z01 a16z02 a17 a19 a20 a21a 
a24a01 a24a02 a23b a23c a24b02 a26a a25b a26b01 a26b02 b16b b17b 
b20b b21b b13bc1 b13c01c1 b13ac1 b13dc1 b13bc2 b13c01c2 b13ac2 b13dc2 
b13bc3 b13c01c3 b13ac3 b13dc3 b13bc4 b13c01c4 b13ac4 b13dc4 b13bc5 
b13c01c5 b13ac5 b13dc5 b13bc6 b13c01c6 b13ac6 b13dc6.
dataset name RR2008.
rename variables x01=id x01a=category x01b=scale x02=period x05=district a01=male a02a=birth_y 
a03a=happy a03b=life a04a=health c07a=work_satis c07b=family_satis a05=work
a09a01=indust a09a02=occu a08b=workfor a08c=workers a09b02=workplace 
a11a=workhrs a10b=wage a16z01=marry a16z02=myear a17=Sbirth_y a19=Sedu 
a20=Shealth a21a=Swork a24a01=Sindust a24a02=Soccu a23b=Sworkfor 
a23c=Sworkers a24b02=Sworkplace a26a=Sworkhrs a25b=Swage b13bc1=C1male 
b13c01c1=C1birth_y b13ac1=C1rank b13dc1=C1edu b13bc2=C2male 
b13c01c2=C2birth_y b13ac2=C2rank b13dc2=C2edu b13bc3=C3male 
b13c01c3=C3birth_y b13ac3=C3rank b13dc3=C3edu b13bc4=C4male 
b13c01c4=C4birth_y b13ac4=C4rank b13dc4=C4edu b13bc5=C5male 
b13c01c5=C5birth_y b13ac5=C5rank b13dc5=C5edu b13bc6=C6male 
b13c01c6=C6birth_y b13ac6=C6rank b13dc6=C6edu
c04a01=pension. 
recode Sbirth_y (96 thru 99=SYSMIS).
recode work(1,2=1)(3=2)(0=0)(else=sysmis).
recode Swork(1,2=1)(3=2)(0=0)(else=SYSMIS).
recode workers Sworkers(7=6)(8=7).
recode marry(3,4,5=3)(6=4)(7=5)(8=6).
recode a11b01 a11b02(96,97,98,99=SYSMIS).
compute seniority=a11b01+(a11b02/12).
recode a26b01 a26b02(96,97,98,99=SYSMIS).
compute Sseniority=a26b01+(a26b02/12).
recode b16b(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_f.
recode b17b(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_m.
recode b20b(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sf.
recode b21b(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sm.
recode pension(2,3=2).
recode indust Sindust (1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(8,81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
EXECUTE.
DELETE VARIABLES a11b01 a11b02 a26b01 a26b02 b16b b17b b20b b21b.
select if (category=1).
EXECUTE.
save OUTFILE="D:\satis\RR2008.sav"
/COMPRESSED.
*RR2009.
GET
  FILE='D:\satis\RR2009_c_V201212_spss.sav'
/keep x01 x01a x01b x02 x05 a01 a02a a03a a03b a04a c07a c07b a03c a05 a09a01 a09a02 
a08b a08c a09f02 a11a a10a a11b01 a11b02 c04a01 a16z01 a16z02 a17z01 a18 a19 a20 
a24a01 a24a02 c04a01 a23b a23c a24b02 a26a a25a a26b01 a26b02 b16c b17c b20c b21c 
b22z01 b22z02 b22z03 b22z04 b22z05 b13bc1 b13c01c1 b13ac1 b13dc1 b13bc2 
b13c01c2 b13ac2 b13dc2 b13bc3 b13c01c3 b13ac3 b13dc3 b13bc4 b13c01c4 b13ac4 
b13dc4 b13bc5 b13c01c5 b13ac5 b13dc5 b13bc6 b13c01c6 b13ac6 b13dc6 d01a d01b 
d01c d01d d01e d01f d01g. 
dataset name RR2009.
rename variables x01=id x01a=category x01b=scale x02=period x05=district a01=male a02a=birth_y 
a03a=happy a03b=life a04a=health c07a=work_satis c07b=family_satis a03c=edu 
a05=work a09a01=indust a09a02=occu a08b=workfor a08c=workers 
a09f02=workplace a11a=workhrs a10a=wage a16z01=marry a16z02=myear 
a17z01=Sbirth_y a18=Sedu a19=Shealth a20=Swork a24a01=Sindust a24a02=Soccu 
a23b=Sworkfor a23c=Sworkers a24b02=Sworkplace a26a=Sworkhrs a25a=Swage 
b22z01=siblings b22z02=brother_old b22z03=brother_young b22z04=sister_old 
b22z05=sister_young b13bc1=C1male b13c01c1=C1birth_y b13ac1=C1rank 
b13dc1=C1edu b13bc2=C2male b13c01c2=C2birth_y b13ac2=C2rank 
b13dc2=C2edu b13bc3=C3male b13c01c3=C3birth_y b13ac3=C3rank 
b13dc3=C3edu b13bc4=C4male b13c01c4=C4birth_y b13ac4=C4rank 
b13dc4=C4edu b13bc5=C5male b13c01c5=C5birth_y b13ac5=C5rank 
b13dc5=C5edu b13bc6=C6male b13c01c6=C6birth_y b13ac6=C6rank 
b13dc6=C6edu d01a=love_fa d01b=love_mom d01c=love_bro d01d=love_sis 
d01e=love_S d01f=love_son d01g=love_dau
c04a01=pension. 
recode Sbirth_y (96 thru 99=SYSMIS).
recode work(1,2=1)(3=2)(0=0)(else=sysmis).
recode Swork(1,2=1)(3=2)(0=0)(else=SYSMIS).
recode workers Sworkers(7=6)(8=7).
recode marry(3,4,5=3)(6=4)(7=5)(8=6).
recode a11b01 a11b02(96,97,98,99=SYSMIS).
compute seniority=a11b01+(a11b02/12).
recode a26b01 a26b02(96,97,98,99=SYSMIS).
compute Sseniority=a26b01+(a26b02/12).
recode b16c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_f.
recode b17c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_m.
recode b20c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sf.
recode b21c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sm.
recode pension(2,3=2).
recode indust Sindust (1 thru 3=1)(5 thru 7=2)(8 thru 34=3)(35=4)(36 thru 39=5)(41 thru 43=6)(45 thru 48=7)(49 thru 54=8)
(55,56=9)(58 thru 63=10)(64 thru 66= 11)(67,68=12)(69 thru 76=13)(77 thru 82=14)(83=15)(85=16)(86 thru 88=17)(90 thru 93=18)
(94 thru 96=19).
EXECUTE.
DELETE VARIABLES a11b01 a11b02 a26b01 a26b02 b16c b17c  b20c b21c.
select if (category=1).
EXECUTE.
save OUTFILE="D:\satis\RR2009.sav"
/COMPRESSED.
*RR2010.
GET
  FILE='D:\satis\RR2010_c_v201308_spss.sav'
/keep x01 x01a x01b x02 x05 a01 a02a a03a a03b a04a c07a c07b a03c a05 a09a01 a09a02 
a08b a08c a09b02 a11a a10a a11b01 a11b02 c04a01 a16z01 a16z02 a17z01 a18 a19 a20 
a24a01 a24a02 a23b a23c a24b02 a26a a25a a26b01 a26b02 b16c b17c b20c b21c 
b13bc1 b13c01c1 b13ac1 b13dc1 b13bc2 b13c01c2 b13ac2 b13dc2 b13bc3 
b13c01c3 b13ac3 b13dc3 b13bc4 b13c01c4 b13ac4 b13dc4 b13bc5 b13c01c5 b13ac5 
b13dc5 b13bc6 b13c01c6 b13ac6 b13dc6.
dataset name RR2010.
rename variables x01=id x01a=category x01b=scale x02=period x05=district a01=male a02a=birth_y 
a03a=happy a03b=life a04a=health c07a=work_satis c07b=family_satis a03c=edu 
a05=work a09a01=indust a09a02=occu a08b=workfor a08c=workers 
a09b02=workplace a11a=workhrs a10a=wage a16z01=marry a16z02=myear 
a17z01=Sbirth_y a18=Sedu a19=Shealth a20=Swork a24a01=Sindust a24a02=Soccu 
a23b=Sworkfor a23c=Sworkers a24b02=Sworkplace a26a=Sworkhrs a25a=Swage 
b13bc1=C1male b13c01c1=C1birth_y b13ac1=C1rank b13dc1=C1edu 
b13bc2=C2male b13c01c2=C2birth_y b13ac2=C2rank b13dc2=C2edu 
b13bc3=C3male b13c01c3=C3birth_y b13ac3=C3rank b13dc3=C3edu 
b13bc4=C4male b13c01c4=C4birth_y b13ac4=C4rank b13dc4=C4edu 
b13bc5=C5male b13c01c5=C5birth_y b13ac5=C5rank b13dc5=C5edu 
b13bc6=C6male b13c01c6=C6birth_y b13ac6=C6rank b13dc6=C6edu
c04a01=pension.
recode Sbirth_y (96 thru 99=SYSMIS).
recode work(1,2=1)(3=2)(0=0)(else=sysmis).
recode Swork(1,2=1)(3=2)(0=0)(else=SYSMIS).
recode workers Sworkers(7=6)(8=7).
recode marry(3,4,5=3)(6=4)(7=5)(8=6).
recode a11b01 a11b02(96,97,98,99=SYSMIS).
compute seniority=a11b01+(a11b02/12).
recode a26b01 a26b02(96,97,98,99=SYSMIS).
compute Sseniority=a26b01+(a26b02/12).
recode b16c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_f.
recode b17c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_m.
recode b20c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sf.
recode b21c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sm.
recode pension(2,3=2).
recode indust Sindust (1 thru 3=1)(5 thru 7=2)(8 thru 34=3)(35=4)(36 thru 39=5)(41 thru 43=6)(45 thru 48=7)(49 thru 54=8)
(55,56=9)(58 thru 63=10)(64 thru 66= 11)(67,68=12)(69 thru 76=13)(77 thru 82=14)(83=15)(85=16)(86 thru 88=17)(90 thru 93=18)
(94 thru 96=19).
EXECUTE.
DELETE VARIABLES a11b01 a11b02 a26b01 a26b02 b16c b17c  b20c b21c.
select if (category=1).
EXECUTE.
save OUTFILE="D:\satis\RR2010.sav"
/COMPRESSED.
*RR2011.
GET
  FILE='D:\satis\rr2011_c_v201309_spss.sav'
/keep x01 x01a x01b x02 x05 a01 a02a a03a a03b a04a c07a c07b a03c a05 a09a01 a09a02 a08b 
a08c a09b02 a11a a10a a11b01 a11b02 c04a01 a16a a16b01 a17z01 a18 a19 a20 a24a01 a24a02 
a23b a23c a24b02 a26a a25a a26b01 a26b02 b16c b17c b20c b21c b13bc1 b13c01c1 
b13ac1 b13dc1 b13bc2 b13c01c2 b13ac2 b13dc2 b13bc3 b13c01c3 b13ac3 b13dc3 
b13bc4 b13c01c4 b13ac4 b13dc4 b13bc5 b13c01c5 b13ac5 b13dc5 b13bc6 b13c01c6 
b13ac6 b13dc6.
dataset name RR2011.
rename variables x01=id x01a=category x01b=scale x02=period x05=district a01=male a02a=birth_y 
a03a=happy a03b=life a04a=health c07a=work_satis c07b=family_satis a03c=edu 
a05=work a09a01=indust a09a02=occu a08b=workfor a08c=workers a09b02=workplace 
a11a=workhrs a10a=wage a16a=marry a16b01=myear a17z01=Sbirth_y a18=Sedu 
a19=Shealth a20=Swork a24a01=Sindust a24a02=Soccu a23b=Sworkfor a23c=Sworkers 
a24b02=Sworkplace a26a=Sworkhrs a25a=Swage b13bc1=C1male b13c01c1=C1birth_y 
b13ac1=C1rank b13dc1=C1edu b13bc2=C2male b13c01c2=C2birth_y b13ac2=C2rank 
b13dc2=C2edu b13bc3=C3male b13c01c3=C3birth_y b13ac3=C3rank b13dc3=C3edu 
b13bc4=C4male b13c01c4=C4birth_y b13ac4=C4rank b13dc4=C4edu b13bc5=C5male 
b13c01c5=C5birth_y b13ac5=C5rank b13dc5=C5edu b13bc6=C6male 
b13c01c6=C6birth_y b13ac6=C6rank b13dc6=C6edu
c04a01=pension. 
recode Sbirth_y (999=SYSMIS).
recode work(1,2=1)(3=2)(0=0)(else=sysmis).
recode Swork(1,2=1)(3=2)(0=0)(else=SYSMIS).
recode workers Sworkers(7=6)(8=7).
recode marry(3=1)(1,7=3)(5,8=4)(4,9=5)(10=6).
recode a11b01 a11b02(96,97,98,99=SYSMIS).
compute seniority=a11b01+(a11b02/12).
recode a26b01 a26b02(96,97,98,99=SYSMIS).
compute Sseniority=a26b01+(a26b02/12).
recode b16c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_f.
recode b17c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_m.
recode b20c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sf.
recode b21c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sm.
recode pension(2,3=2).
recode indust Sindust (1 thru 3=1)(5 thru 7=2)(8 thru 34=3)(35=4)(36 thru 39=5)(41 thru 43=6)(45 thru 48=7)(49 thru 54=8)
(55,56=9)(58 thru 63=10)(64 thru 66= 11)(67,68=12)(69 thru 76=13)(77 thru 82=14)(83=15)(85=16)(86 thru 88=17)(90 thru 93=18)
(94 thru 96=19).
EXECUTE.
DELETE VARIABLES a11b01 a11b02 a26b01 a26b02 b16c b17c  b20c b21c.
select if (category=1).
EXECUTE.
save OUTFILE="D:\satis\RR2011.sav"
/COMPRESSED.
*RR2012.
GET
  FILE='D:\satis\rr2012_v201605_spss.sav'
/keep x01 x01a x01b x05 a01 a02a01 a03a a03b a04a e01a e01b a03c a05 a09a01 a09a02 
a08b a08c a09b02 a11a a10a a11b01 a11b02 d04a01 a16a a16b01 a17z01 a18 a19 a20 a24a01 
a24a02 a23b a23c a24b02 a26a a25a a26b01 a26b02 b16c b17c b20c b21c b13bc1 b13c01c1 b13ac1 b13dc1 
b13bc2 b13c01c2 b13ac2 b13dc2 b13bc3 b13c01c3 b13ac3 b13dc3 b13bc4 b13c01c4 
b13ac4 b13dc4 b13bc5 b13c01c5 b13ac5 b13dc5 b13bc6 b13c01c6 b13ac6 b13dc6.
dataset name RR2012.
rename variables x01=id x01a=category x01b=scale x05=district a01=male a02a01=birth_y 
a03a=happy a03b=life a04a=health e01a=work_satis e01b=family_satis a03c=edu 
a05=work a09a01=indust a09a02=occu a08b=workfor a08c=workers a09b02=workplace 
a11a=workhrs a10a=wage a16a=marry a16b01=myear a17z01=Sbirth_y a18=Sedu 
a19=Shealth a20=Swork a24a01=Sindust a24a02=Soccu a23b=Sworkfor a23c=Sworkers 
a24b02=Sworkplace a26a=Sworkhrs a25a=Swage b13bc1=C1male b13c01c1=C1birth_y 
b13ac1=C1rank b13dc1=C1edu b13bc2=C2male b13c01c2=C2birth_y b13ac2=C2rank 
b13dc2=C2edu b13bc3=C3male b13c01c3=C3birth_y b13ac3=C3rank b13dc3=C3edu 
b13bc4=C4male b13c01c4=C4birth_y b13ac4=C4rank b13dc4=C4edu b13bc5=C5male 
b13c01c5=C5birth_y b13ac5=C5rank b13dc5=C5edu b13bc6=C6male 
b13c01c6=C6birth_y b13ac6=C6rank b13dc6=C6edu
d04a01=pension.
recode birth_y(96 thru 99=SYSMIS).
recode Sbirth_y (96 thru 99=SYSMIS).
compute period=2012.
recode work(1,2=1)(3=2)(0=0)(else=sysmis).
recode Swork(1,2=1)(3=2)(0=0)(else=SYSMIS).
recode workers Sworkers(7=6)(8=7).
recode marry(3=1)(1,7=3)(5,8=4)(4,9=5)(10=6).
recode a11b01 a11b02(96,97,98,99=SYSMIS).
compute seniority=a11b01+(a11b02/12).
recode a26b01 a26b02(96,97,98,99=SYSMIS).
compute Sseniority=a26b01+(a26b02/12).
recode b16c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_f.
recode b17c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_m.
recode b20c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sf.
recode b21c(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sm.
recode pension(2,3=2).
recode indust Sindust (1 thru 3=1)(5 thru 7=2)(8 thru 34=3)(35=4)(36 thru 39=5)(41 thru 43=6)(45 thru 48=7)(49 thru 54=8)
(55,56=9)(58 thru 63=10)(64 thru 66= 11)(67,68=12)(69 thru 76=13)(77 thru 82=14)(83=15)(85=16)(86 thru 88=17)(90 thru 93=18)
(94 thru 96=19).
EXECUTE.
DELETE VARIABLES a11b01 a11b02 a26b01 a26b02 b16c b17c  b20c b21c.
select if (category=1).
EXECUTE.
save OUTFILE="D:\satis\RR2012.sav"
/COMPRESSED.
*RR2014.
GET
  FILE='D:\satis\RR2014_v201607_spss.sav'
/keep x01 x01a x01b x02 x05 a01 a02a a03a a03b a04a c07a c07b a03c a05 a07a01 a07a02 a06 
a07b a07c02 a09b a08a a10a01 c04a01 a16a a16b01 a26z01 a27 a28 a29 a31a01 a31a02 
a30 a31b a31c02 a33b a32a a33c01 b20df1 b20dm1 b23ef2 b23em2 b13 b13a 
b13b b14bc1 b14c01c1 b14ac1 b14dc1 b14jc1 b14bc2 b14c01c2 b14ac2 b14dc2 b14jc2 
b14bc3 b14c01c3 b14ac3 b14dc3 b14jc3 b14bc4 b14c01c4 b14ac4 b14dc4 b14jc4 b14bc5 
b14c01c5 b14ac5 b14dc5 b14jc5 b14bc6 b14c01c6 b14ac6 b14dc6 b14jc6.
dataset name RR2014.
rename variables x01=id x01a=category x01b=scale x02=period x05=district a01=male a02a=birth_y 
a03a=happy a03b=life a04a=health c07a=work_satis c07b=family_satis a03c=edu 
a05=work a07a01=indust a07a02=occu a06=workfor a07b=workers a07c02=workplace 
a09b=workhrs a08a=wage c04a01=pension a16a=marry a16b01=myear a26z01=Sbirth_y a27=Sedu 
a28=Shealth a29=Swork a31a01=Sindust a31a02=Soccu a30=Sworkfor a31b=Sworkers 
a31c02=Sworkplace a33b=Sworkhrs a32a=Swage b13=children b13a=sons 
b13b=daughters b14bc1=C1male b14c01c1=C1birth_y b14ac1=C1rank b14dc1=C1edu 
b14jc1=C1care b14bc2=C2male b14c01c2=C2birth_y b14ac2=C2rank b14dc2=C2edu 
b14jc2=C2care b14bc3=C3male b14c01c3=C3birth_y b14ac3=C3rank b14dc3=C3edu 
b14jc3=C3care b14bc4=C4male b14c01c4=C4birth_y b14ac4=C4rank b14dc4=C4edu 
b14jc4=C4care b14bc5=C5male b14c01c5=C5birth_y b14ac5=C5rank b14dc5=C5edu 
b14jc5=C5care b14bc6=C6male b14c01c6=C6birth_y b14ac6=C6rank b14dc6=C6edu 
b14jc6=C6care.
recode Sbirth_y(96 thru 99=SYSMIS).
recode work(1,2=1)(3=2)(0=0)(else=sysmis).
recode Swork(1,2=1)(3=2)(0=0)(else=SYSMIS).
recode workers Sworkers(7=6)(8=7).
recode marry(3=1)(1,7=3)(5,8=4)(4,9=5)(10=6)(11=2).
recode a10a01(0,996 thru 999=SYSMIS).
compute seniority=(period-1911)-a10a01.
recode a33c01(0,996 thru 999=SYSMIS).
compute Sseniority=(period-1911)-a33c01.
recode b20df1(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_f.
recode b20dm1(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_m.
recode b23ef2(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sf.
recode b23em2(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sm.
recode pension(2,3=2).
recode indust Sindust (1 thru 3=1)(5 thru 7=2)(8 thru 34=3)(35=4)(36 thru 39=5)(41 thru 43=6)(45 thru 48=7)(49 thru 54=8)
(55,56=9)(58 thru 63=10)(64 thru 66= 11)(67,68=12)(69 thru 76=13)(77 thru 82=14)(83=15)(85=16)(86 thru 88=17)(90 thru 93=18)
(94 thru 96=19).
EXECUTE.
DELETE VARIABLES a10a01 a33c01 b20df1 b20dm1 b23ef2 b23em2.
select if (category=1).
EXECUTE.
save OUTFILE="D:\satis\RR2014.sav"
/COMPRESSED.
*RR2016.
GET
  FILE='D:\satis\RR2016_v201801_spss.sav'
/keep x01 x01a x01b x02 x05 a01 a02a a03a a03b a04a a06b b12 c12 a03c a06a01 a08a01 
a08a02 a07 a08b a08c02 a10b01 c05a01 a09a01 a12a01 a17a a17d a17c01 a27z01 a28 a29 
a30z01 a32a01 a32a02 a31 a32b a32c02 a34b01 a33a01 a34c01 b19bf1 b19bm1 
b24bf2 b24bm2 b28a01 b28a02 b28a03 b28a04 b28a05 b15 b15a b15b b16bc1 
b16c01c1 b16ac1 b16gc1 b16ec1 b16bc2 b16c01c2 b16ac2 b16gc2 b16ec2 b16bc3 
b16c01c3 b16ac3 b16gc3 b16ec3 b16bc4 b16c01c4 b16ac4 b16gc4 b16ec4 b16bc5 
b16c01c5 b16ac5 b16gc5 b16ec5 b16bc6 b16c01c6 b16ac6 b16gc6 b16ec6.
dataset name RR2016.
rename variables x01=id x01a=category x01b=scale x02=period x05=district a01=male a02a=birth_y
a03a=happy a03b=life a04a=health a06b=work_satis b12=family_satis 
c12=eco_satis a03c=edu a06a01=work a08a01=indust a08a02=occu a07=workfor 
a08b=workers a08c02=workplace a10b01=workhrs a09a01=wage a17c01=myear 
a27z01=Sbirth_y a28=Sedu a29=Shealth a30z01=Swork a32a01=Sindust 
a32a02=Soccu a31=Sworkfor a32b=Sworkers a32c02=Sworkplace a34b01=Sworkhrs 
a33a01=Swage b28a01=siblings b28a02=brother_old b28a03=brother_young 
b28a04=sister_old b28a05=sister_young b15=children b15a=sons b15b=daughters 
b16bc1=C1male b16c01c1=C1birth_y b16ac1=C1rank b16gc1=C1edu 
b16ec1=C1care b16bc2=C2male b16c01c2=C2birth_y b16ac2=C2rank 
b16gc2=C2edu b16ec2=C2care b16bc3=C3male b16c01c3=C3birth_y 
b16ac3=C3rank b16gc3=C3edu b16ec3=C3care b16bc4=C4male 
b16c01c4=C4birth_y b16ac4=C4rank b16gc4=C4edu b16ec4=C4care 
b16bc5=C5male b16c01c5=C5birth_y b16ac5=C5rank b16gc5=C5edu 
b16ec5=C5care b16bc6=C6male b16c01c6=C6birth_y b16ac6=C6rank 
b16gc6=C6edu b16ec6=C6care a17a=marry
c05a01=pension.
recode Sbirth_y(96 thru 99=SYSMIS).
recode work(1,2=1)(3=2)(0=0)(else=sysmis).
recode Swork(1,2=1)(3=2)(0=0)(else=SYSMIS).
recode workers Sworkers(7=6)(8=7).
recode marry(2=3)(3=4)(4=5)(5=6)(6 thru 9=SYSMIS).
recode pension(2,3=2).
recode indust Sindust (1 thru 3=1)(5 thru 7=2)(8 thru 34=3)(35=4)(36 thru 39=5)(41 thru 43=6)(45 thru 48=7)(49 thru 54=8)
(55,56=9)(58 thru 63=10)(64 thru 66= 11)(67,68=12)(69 thru 76=13)(77 thru 82=14)(83=15)(85=16)(86 thru 88=17)(90 thru 93=18)
(94 thru 96=19).
EXECUTE.
DO IF(a17d=1).
recode marry(1=2).
end if.
EXECUTE.
recode a12a01(0,996 thru 999=SYSMIS).
compute seniority=(period-1911)-a12a01.
recode a34c01(0,996 thru 999=SYSMIS).
compute Sseniority=(period-1911)-a34c01.
recode b19bf1(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_f.
recode b19bm1(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_m.
recode b24bf2(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sf.
recode b24bm2(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sm.
EXECUTE.
DELETE VARIABLES a12a01 a34c01 b19bf1 b19bm1 b24bf2 b24bm2 a17d.
select if (category=1).
EXECUTE.
save OUTFILE="D:\satis\RR2016.sav"
/COMPRESSED.
*RR2018.
GET
  FILE='D:\satis\RR2018_v201907_spss.sav'
/keep x01 x01a x01b x02 x05 a01 a02a a03c a03d a04a a06b b08 b24a c19 a03a a03b 
a06a a08a01 a08a02 a07a a08b a08c02 a10b a09a01 a12a01 i13b i14b01 i14b02 
i14a i16a c07a01 c07a02 c07b c08a c06a01 c09d01 a17a a17d a17c01 a28a01 a27 a29 
a30 a32a01 a32a02 a31a a32b a32c02 a34b a33a01 a34c01 c11b01 b15bf1 b15bm1 
b20bf2 b20bm2 b11 b11a b11b b12bc1 b12c01z01c1 b12ac1 b12gc1 b12ec1 b12bc2 
b12c01z01c2 b12ac2 b12gc2 b12ec2 b12bc3 b12c01z01c3 b12ac3 b12gc3 b12ec3 
b12bc4 b12c01z01c4 b12ac4 b12gc4 b12ec4 b12bc5 b12c01z01c5 b12ac5 b12gc5 
b12ec5 b12bc6 b12c01z01c6 b12ac6 b12gc6 b12ec6.
dataset name RR2018.
rename variables x01=id x01a=category x01b=scale x02=period x05=district a01=male a02a=birth_y 
a03c=happy a03d=life a04a=health a06b=work_satis b08=family_satis 
b24a=marry_satis c19=eco_satis a03a=edu a03b=grad a06a=work a08a01=indust 
a08a02=occu a07a=workfor a08b=workers a08c02=workplace a10b=workhrs 
a09a01=wage i13b=fwork_y i14b01=fwork_indust i14b02=fwork_occu 
i14a=fworkfor i16a=fwage c07a01=rwork_indust c07a02=rwork_occu 
c07b=rworkfor c08a=rwage c06a01=rwyear c09d01=pension a17a=marry 
a17c01=myear a28a01=Sbirth_y a27=Sedu a29=Shealth a30=Swork a32a01=Sindust 
a32a02=Soccu a31a=Sworkfor a32b=Sworkers a32c02=Sworkplace a34b=Sworkhrs 
a33a01=Swage c11b01=Srwyear b11=children b11a=sons b11b=daughters 
b12bc1=C1male b12c01z01c1=C1birth_y b12ac1=C1rank b12gc1=C1edu 
b12ec1=C1care b12bc2=C2male b12c01z01c2=C2birth_y b12ac2=C2rank 
b12gc2=C2edu b12ec2=C2care b12bc3=C3male b12c01z01c3=C3birth_y 
b12ac3=C3rank b12gc3=C3edu b12ec3=C3care b12bc4=C4male 
b12c01z01c4=C4birth_y b12ac4=C4rank b12gc4=C4edu b12ec4=C4care 
b12bc5=C5male b12c01z01c5=C5birth_y b12ac5=C5rank b12gc5=C5edu 
b12ec5=C5care b12bc6=C6male b12c01z01c6=C6birth_y b12ac6=C6rank 
b12gc6=C6edu b12ec6=C6care
c09d01=pension.
recode Sbirth_y(96 thru 99=SYSMIS).
recode work(1,2=1)(3=2)(0=0)(else=sysmis).
recode Swork(1,2=1)(3=2)(0=0)(else=SYSMIS).
recode workers Sworkers(7=6)(8=7).
recode marry(2=3)(3=4)(4=5)(5=6)(6 thru 9=SYSMIS).
EXECUTE.
DO IF(a17d=1).
recode marry(1=2).
end if.
EXECUTE.
recode a12a01(0,996 thru 999=SYSMIS).
compute seniority=(period-1911)-a12a01.
recode a34c01(0,996 thru 999=SYSMIS).
compute Sseniority=(period-1911)-a34c01.
recode b15bf1(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_f.
recode b15bm1(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_m.
recode b20bf2(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sf.
recode b20bm2(0=0)(8=1)(1 thru 7=2)(else=SYSMIS) into cohabit_Sm.
recode indust fwork_indust rwork_indust Sindust (1 thru 3=1)(5 thru 7=2)(8 thru 34=3)(35=4)(36 thru 39=5)(41 thru 43=6)(45 thru 48=7)(49 thru 54=8)
(55,56=9)(58 thru 63=10)(64 thru 66= 11)(67,68=12)(69 thru 76=13)(77 thru 82=14)(83=15)(85=16)(86 thru 88=17)(90 thru 93=18)
(94 thru 96=19).
EXECUTE.
DELETE VARIABLES a12a01 a34c01 b15bf1 b15bm1 b20bf2 b20bm2 a17d.
select if (category=1).
EXECUTE.
save OUTFILE="D:\satis\RR2018.sav"
/COMPRESSED.

*RR2020.
Get file="D:\satis\rr2020.sav".
dataset name RR2020.

*RII2000 (804).
GET 
  FILE='D:\satis\rii2000_c_v200901(spss).sav'
/keep x01 x01a x01b x02 x06 a01 a02 a04 a03 c01 c03a01 c03a02 c03b c04 
c05z02 c07 c06b c08z02 c08z03 b09 a05z01 a05z02 a06 a08 a09 c19 
c21a01 c21a02 c21b c23 c22 g03a g03b g03c f01 e01a e01b.
Dataset name RII2000.
RENAME VARIABLES
x01=id x01a=category x01b=scale x02=period x06=district a01=male a02=birth_y a04=health a03=edu c01=work c03a01=indust 
c03a02=occu c03b=workfor c04=workers c05z02=workplace c07=workhrs c06b=wage b09=fwork_y a05z01=marry a05z02=myear 
a06=Sbirth_y a08=Sedu a09=Shealth c19=Swork c21a01=Sindust c21a02=Soccu c21b=Sworkfor c23=Sworkhrs c22=Swage 
g03a=love_S g03b=love_son g03c=love_dau f01=children e01a=housework e01b=Shousework.
recode Sbirth_y (0,96,97,98,99=SYSMIS).
recode c08z02 c08z03(96, 99 =SYSMIS).
compute seniority = c08z02 + (c08z03/12).
EXECUTE.
delete variables c08z02 c08z03.
recode indust Sindust(1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
save OUTFILE= 'D:\satis\RII2000.sav'
 /COMPRESSED.

*RII2001 (1730).
GET 
  FILE='D:\satis\RII2001_c_V200707(spss).sav'
 /keep x01 x01a x01b x02 x05 a01 a02 a04 a03 c01a c03a01 c03a02 
c03b c04 c06z02 c08 c07b c09z02 c09z03 c21a c21b c22 c24a c25 c26a 
c28a01 c28a02 c28b c31 c30 g03a g03b g03c f01 b09 d11ac1 d11ac2 d11ac3 d11ac4 e01a e01b c01b c26b.
Dataset name RII2001.
RENAME VARIABLES
x01=id x01a=category x01b=scale x02=period x05=district a01=male a02=birth_y a04=health a03=edu 
c01a=work c03a01=indust c03a02=occu c03b=workfor c04=workers c06z02=workplace c08=workhrs 
c07b=wage b09=fwork_y c22=Sbirth_y c24a=Sedu c25=Shealth c26a=Swork c28a01=Sindust c28a02=Soccu 
c28b=Sworkfor c31=Sworkhrs c30=Swage g03a=love_S g03b=love_son g03c=love_dau f01=children d11ac1=C1rank d11ac2=C2rank d11ac3=C3rank d11ac4=C4rank
e01a=housework e01b=Shousework.
recode Sbirth_y (0,96,97,98,99=SYSMIS).
recode work Swork(1,2,3 =1)(4,5,6=2)(else=SYSMIS).
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
delete variables c21a c21b.
save outfile= 'D:\satis\RII2001.sav'
 /COMPRESSED.

*RIII2001 (726).
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
recode Sbirth_y (0,96,97,98,99=SYSMIS).
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
save outfile= 'D:\satis\RIII2001.sav'
 /COMPRESSED.

*RR2002 (2424).
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
recode Sbirth_y (0,96,97,98,99=SYSMIS).
recode work Swork(1,2,3 =1)(4,5,6=2)(else=SYSMIS).
recode indust Sindust(1 thru 3=1)(11 thru 18=2)(20 thru 39=3)(41 thru 43=4)(44=5)(51 thru 59=6)(61 thru 63=7)(71,72=8)
(64=9)(73,94=10)(81,82,86=11)(83=12)(84=13)(85,92=14)(90,91,99=15)(93=16)(95,96=17)(97=18)(98,100=19).
EXECUTE.
save outfile= 'D:\satis\RR2002.sav'
 /COMPRESSED.

*RR2003 (2317).
GET FILE="D:\satis\rivrv2003_c_v201401_spss.sav"
 /keep x01 x05 a01 a03.
DATASET NAME RR2003.
RENAME VARIABLES 
x01=id x05=district a01=male a03=health.
compute period=2003.
EXECUTE.
save outfile= 'D:\satis\RR2003.sav'
 /COMPRESSED.

*RR2004 (3024).
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
save outfile= 'D:\satis\RR2004.sav'
 /COMPRESSED.

*RR2005 (2880).
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
save outfile= 'D:\satis\RR2005.sav'
 /COMPRESSED.
*RR2006 (2772).
GET FILE="D:\satis\RR2006_c_V200801_SPSS.sav"
   /keep z01 z01a z01b z02 z04b a01 a02 a03 a04a a07 a11a01 a11a02 
a11b a11c a12a02 a14 a13b a22 a23 a25a a26 a27a a29a01 a29a02 a29b a29c a30a02 
a32 a31b b13hf1 b13hm1 b13hf2 b13hm2 d01c d01b d01a b12e b13bc1 b13c01c1 b13ac1 
b13bc2 b13c01c2 b13ac2 b13bc3 b13c01c3 b13ac3 b13bc4 b13c01c4 b13ac4 c04a01.
DATASET NAME RR2006.
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
save outfile= 'D:\satis\RR2006.sav'
 /COMPRESSED.

*合併.
DATASET ACTIVATE RI2016.
ADD FILES FILE=RI2016
  /FILE=RI2000 
   /FILE=RI1999
   /FILE=RI2003
   /FILE=RI2009
   /FILE=RII2000
   /FILE=RII2001
   /FILE=RIII2001
   /FILE=RR2002
   /FILE=RR2003
   /FILE=RR2004
   /FILE=RR2005
   /FILE=RR2006
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
dataset name RIRR WINDOW=front.
DATASET ACTIVATE RIRR.
dataset close RI1999.
dataset close RI2000. 
dataset close RI2003.
dataset close RI2009.
dataset close RII2000.
dataset close RII2001.
dataset close RIII2001.
dataset close RR2002.
dataset close RR2003.
dataset close RR2004.
dataset close RR2005.
dataset close RR2006.
dataset close RI2016.
dataset close RR2007.
dataset close RR2008.
dataset close RR2009.
dataset close RR2010.
dataset close RR2011.
dataset close RR2012.
dataset close RR2014.
dataset close RR2016.
dataset close RR2018.
dataset close RR2020.

FORMATS  seniority Sseniority(F4.2).
EXECUTE.
*反向編碼health Shealth work_satis family_satis eco_satis marry_satis.
recode marry(97=SYSMIS).
recode health Shealth(1=5)(2=4)(4=2)(5=1).
recode work_satis(1=4)(2=3)(3=2)(4=1).
recode family_satis(1=4)(2=3)(3=2)(4=1).
recode eco_satis(1=4)(2=3)(3=2)(4=1).
recode marry_satis(1=4)(2=3)(3=2)(4=1).
recode life4 (1=4)(2=3)(3=2)(4=1)(else=SYSMIS).
do if (work=1).
recode wage(0=001).
end if.
do if (Swork=1).
recode Swage(0=001).
end if.
EXECUTE.
*變數標籤.
variable labels grad"請問您是畢業,肄業,或是就學中?".
variable labels work"您今年有工作嗎?" Swork"您配偶今年有工作嗎?".
variable labels cohabit_f"父親目前是否與您同住:" cohabit_m"母親目前是否與您同住:" cohabit_Sf"配偶父親目前是否與您同住:" cohabit_Sm"配偶母親目前是否與您同住:".
*值標籤.
value labels indust Sindust  fwork_indust rwork_indust Srwork_indust 0"00 跳答" 1"01 農、林、魚、牧業" 2"02 礦業及土石採取業" 3"03 製造業" 4"04 電力及燃氣供應業" 5"05 用水供應及污染整治業"
6"06 營建工程業" 7"07 批發及零售業" 8"08 運輸及倉儲業" 9"09 住宿及餐飲業" 10"10 出版、影音製作、傳播及資通訊服務業" 11"11 融及保險業"
12"12 不動產業" 13"13 專業、科學及技術服務業" 14"14 支援服務業" 15"15 公共行政及國防；強制性社會安全" 16"16 教育業" 17"17 醫療保健及社會工作服務業"
18"18 藝術、娛樂及休閒服務業" 19"19 其他服務業" 996"996 不知道" 998"998 拒答" 999"999 遺漏值".
add value labels district workplace Sworkplace 409"409台中市" 440"440台中縣" 703"703台南市西區" 747"747台南市" 746"746台南縣" 853"853高雄縣" 854"854高雄市".
add value labels work Swork  0"0 不適用" 1"1 有" 2"2 沒有"8"8 拒答".
add value labels rworkfor Srworkfor workfor Sworkfor 9"09和他人合夥，沒有雇人" 94"94 其他(請說明)".
add value labels workhrs Sworkhrs 991"991 不固定" 995"995 超過上限值" 997"997 其他".
add value labels workers Sworkers 6"06 100-499人" 7"07 500人以上" 8""  94"94 其他(請說明)".
add value labels marry 1"1 未婚單身" 2"2 同居" 3"3 已婚" 4"4 分居" 5"5 離婚" 6"6 喪偶" 7"7 其他".
add value labels cohabit_f cohabit_m cohabit_Sf cohabit_Sm 0"0 不適用" 1"1 是" 2"2 否".
add value labels seniority 80"80 未滿一年".
add value labels Sseniority 96"" 97"" 98"" 99"".
add value labels rwyear  Srwyear 96"" 97"" 98"" 99"".
add value labels pension 1"1 有" 2"2 沒有" 6"6 不知道".
add value labels Shealth health 1"1 很不好" 2"2 不好" 4"4 好" 5"5 非常好" 6"6 不知道" 7"7 其他".
add value labels work_satis 0"0 目前沒有工作" 1"1 很不滿意" 2"2 不太滿意" 3"3 還算滿意" 4"4 很滿意" 6"6 不知道" 8"8 拒答" 9"9 遺漏值".
add value labels family_satis 1"1 很不滿意" 2"2 不太滿意" 3"3 還算滿意" 4"4 很滿意" 6"6 不知道" 8"8 拒答".
add value labels wage fwage Swage 001"001 有工作沒收入" -98"拒答" -97"不知道" -95"收入超過9999990元" -92"無法估計" -91"虧損、沒賺錢、打平".
add value labels filial_1 filial_2 filial_3 filial_4 filial_5 filial_6 filial_7 filial_8 filial_9 7"7 其他".
add value labels edu Sedu C1edu C2edu C3edu C4edu C5edu C6edu C1care C2care C3care C4care C5care C6care 94"其他(請說明)".
add value labels C1male C2male C3male C4male C5male C6male 96"96 跳答".
add files file */keep id category scale period district male birth_y happy life4 life health work_satis family_satis 
eco_satis marry_satis edu grad_y grad work indust occu workfor workers workplace workhrs wage seniority 
fwork_y fwork_indust fwork_occu fworkfor fwage rwork_indust rwork_occu rworkfor rwage rwyear pension 
marry myear Sbirth_y Sedu Shealth Swork Sindust Soccu Sworkfor Sworkers Sworkplace Sworkhrs Swage 
Sseniority Srwork_indust Srwork_occu Srworkfor Srwage Srwyear filial_1 filial_2 filial_3 filial_4 filial_5 filial_6 filial_7 
filial_8 filial_9 family_1 family_2 family_3 family_4 family_5 family_6 family_7 family_8 family_9 cohabit_f 
cohabit_m cohabit_Sf cohabit_Sm siblings love_fa love_mom love_bro love_sis love_S love_son love_dau 
brother_old brother_young sister_old sister_young children sons daughters 
C1male C1birth_y C1rank C1edu C1care C2male C2birth_y C2rank C2edu C2care C3male C3birth_y C3rank C3edu 
C3care C4male C4birth_y C4rank C4edu C4care C5male C5birth_y C5rank C5edu C5care 
C6male C6birth_y C6rank C6edu C6care.
add value labels filial_1 filial_2 filial_3 filial_4 filial_5 filial_6 filial_7 filial_8 filial_9  0"跳答或不適用".
add value labels family_1 family_2 family_3 family_4 family_5 family_6 family_7 family_8 family_9  0"跳答或不適用".
recode category(SYSMIS=1).
EXECUTE.
*將目前沒有工作、不知道、拒答、跳答、遺漏值轉為系統遺漏值，儲存資料後使用R開始作圖.
FORMATS  health Shealth work_satis family_satis eco_satis marry_satis happy life(F4.2).
EXECUTE.
recode work_satis(0=SYSMIS).
recode marry_satis(0=SYSMIS).
recode Shealth(0=SYSMIS).
recode health Shealth work_satis family_satis eco_satis marry_satis (6 thru 9=SYSMIS).
recode happy life health Shealth work_satis family_satis eco_satis marry_satis(96 thru 99=SYSMIS).
value labels happy life health Shealth work_satis family_satis eco_satis marry_satis.
variable level health Shealth work_satis family_satis eco_satis marry_satis happy life (scale).
EXECUTE.
dataset name RIRR WINDOW=front.
sort cases by period.
sort cases by id.



SAVE OUTFILE
   ="D:\satis\RIRRR.sav"
/COMPRESSED.

ERASE FILE="D:\satis\RI1999.sav".
ERASE FILE="D:\satis\RI2000.sav".
ERASE FILE="D:\satis\RI2003.sav".
ERASE FILE="D:\satis\RI2009.sav".
ERASE FILE="D:\satis\RI2016.sav".
ERASE FILE="D:\satis\RR2007.sav".
ERASE FILE="D:\satis\RR2008.sav".
ERASE FILE="D:\satis\RR2009.sav".
ERASE FILE="D:\satis\RR2010.sav".
ERASE FILE="D:\satis\RR2011.sav".
ERASE FILE="D:\satis\RR2012.sav".
ERASE FILE="D:\satis\RR2014.sav".
ERASE FILE="D:\satis\RR2016.sav".
ERASE FILE="D:\satis\RR2018.sav".
ERASE FILE="D:\satis\RII2000.sav".
ERASE FILE="D:\satis\RII2001.sav".
ERASE FILE="D:\satis\RIII2001.sav".
ERASE FILE="D:\satis\RR2002.sav".
ERASE FILE="D:\satis\RR2003.sav".
ERASE FILE="D:\satis\RR2004.sav".
ERASE FILE="D:\satis\RR2005.sav".
ERASE FILE="D:\satis\RR2006.sav".
