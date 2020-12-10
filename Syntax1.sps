GET file='C:\Users\steve\Documents\GitHub\psfd_data\RI1999.sav'.
DATASET NAME RI1999.
GET file='C:\Users\steve\Documents\GitHub\psfd_data\RI2000.sav'.
DATASET NAME RI2000.

GET 
  FILE='C:\Users\steve\Documents\GitHub\psfd_data\RII2001_c_V200707(spss).sav'
 /keep x01 x01a x01b x02 x05 a01 a02 a04 a03 c01a c03a01 c03a02 
c03b c04 c06z02 c08 c07b c09z02 c09z03 c21a c21b c22 c24a c25 c26a 
c28a01 c28a02 c28b c31 c30 g03a g03b g03c f01 b09 d11ac1 d11ac2 d11ac3 d11ac4 e01a e01b c01b c26b.
Dataset name RII2001.
RENAME VARIABLES
x01=id x01a=category x01b=scale x02=period x05=district a01=male a02=birth_y a04=health a03=edu 
c01a=work c03a01=indust c03a02=occu c03b=workfor c04=workers c06z02=workplace c08=workhrs 
c07b=wage b09=fwork_y c22=Sbirth_y c24a=Sedu c25=Shealth c26a=Swork c28a01=Sindust c28a02=Soccu 
c28b=Sworkfor c31=Sworkhrs c30=Swage g03a=love_S g03b=love_son g03c=love_dau f01=children 
d11ac1=C1rank d11ac2=C2rank d11ac3=C3rank d11ac4=C4rank
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

DATASET ACTIVATE RI1999.
ADD FILES FILE=RI1999
	 /FILE=RI2000
  /FILE=RII2001. 
EXECUTE.