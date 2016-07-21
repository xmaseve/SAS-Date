data hosp;
   do j = 1 to 1000;
      AdmitDate = int(ranuni(1234)*1200 + 15500);
      quarter = intck('qtr','01jan2002'd,AdmitDate);
      do i = 1 to quarter;
         if ranuni(0) lt .1 and weekday(AdmitDate) eq 1 then
            AdmitDate = AdmitDate + 1;
         if ranuni(0) lt .1 and weekday(AdmitDate) eq 7 then
            AdmitDate = AdmitDate - int(3*ranuni(0) + 1);
         DOB = int(25000*Ranuni(0) + '01jan1920'd);
         DischrDate = AdmitDate + abs(10*rannor(0) + 1);
         Subject + 1;
         output;
      end;
   end;
   drop i j;
   format AdmitDate DOB DischrDate mmddyy10.;
run;

data frequency;
	set hosp(keep = AdmitDate);
	where AdmitDate between '01Jan2003'd and '30Jun2016'd;
	quarter = intck('qtr', '01Jan2003'd, AdmitDate);
run;

proc freq data=frequency;
	table quarter / nocum out=quarter;
run;


proc contents data=quarter;run;

symbol value=dot i=sm;
proc gplot data=quarter;
	plot count * quarter;
run;


	

