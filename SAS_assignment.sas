*Q1a;
Data studydat;
label 
Subjid= "Patient ID"
genderc="Gender"
birthdt="Birthday"
treatc = "Treatment"
recruitdt = "Recruit date"
deathdt = "Death date"
comp = "Compliance"
;
Input @1 Subjid $3.
@5 genderc $1.
@7 birthdt date9.
@17 treatc $6.
@24 recruitdt date9.
@34 deathdt date9.
@44 comp 4.
;
Cards;
001 M 21Oct1966 Drug A 03Jan2013 14Jul2013 0.91 
002 F 02Feb1971 Drug A 16Feb2013 19Nov2013 0.87
003 F 07Dec1951 Drug A 21Mar2013 22Jan2014 0.76
004 F 11Apr1961 Drug B 05Jan2013 15May2014 0.95
005 M 23Mar1949 Drug B 15Feb2013 03Dec2013 0.93
006 M 19Aug1957 Drug B 29Jan2013 10Apr2014 0.82
;
run;

*Q1b;
Proc print data=studydat label;
Format 
birthdt mmddyy10.
recruitdt mmddyy10.
deathdt mmddyy10.
;
run;

*Q2a;
data anadat;
set studydat;
label tsubjid="New subject ID"
age = "Age"
surv = "Week of survival"
anafl = "Per-protocol"
monitorc = "Monitoring"
;
tsubjid = substr(treatc,6,1)||Subjid;
age=int((recruitdt-birthdt)/365.24);
surv=round((deathdt-recruitdt)/7,0.1);
If comp>=0.85 then do;
	anafl=1;
		if surv<34 then monitorc="Y";
		else monitorc="N";
end;
else do;
	anafl=0;
	monitorc="";
end;
run;

*Q2b;
Proc print data=anadat label;
var tsubjid age surv anafl monitorc;
run;


*Q3a;
Data visitsch;
label visitdt="visit date"
tsubjid="New subject ID"
Visit="visit"
;
Do tsubjid="A001","A002","A003", "B004", "B005", "B006";
visitdt=mdy(12,18,2014);
do visit=1 to 3;
visitdt=visitdt+14;
output;
end;
end;
run;

proc print data=visitsch;
format visitdt mmddyy10.;
run;

*Q3b;
Data mergedat;
merge anadat visitsch;
by tsubjid;
run;


proc print data=mergedat label;
format visitdt birthdt recruitdt deathdt mmddyy10.;
run;












