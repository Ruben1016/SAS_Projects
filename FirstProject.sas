data test_set;
	input Name $ Height Weight;
datalines;
Benny 143 178
Jen   176 98
Lilly 178 143
Miriam 37 390
run;

/* conditional*/
data cars_cylinders;
	length Car_Size $8.;
	set sashelp.cars;
	if cylinders = 4 then Car_Size = 'Small';
	else if cylinders = 6 then Car_size = 'Medium';
	else Car_Size = 'Large';
run;
data cars_cylinders;
	length Car_Size $8.;
	set sashelp.cars;
	if cylinders = 4 then do;
	Car_Size = 'Small';
	Popularity = 'High Demand';
	end;
	
run;

/* informats */

data customer_trans;
	format Date MMDDYY10.; * visiualize as date;
	input Price DOLLAR6. Region $ Date MMDDYY10.; *read in the date;
datalines;
$45.34 NW 01/02/2030
$35.89 SW 04/09/2008
$21.34 NE 03/31/2009
$39.76 SE 05/17/2028
;
run;

/* functions */
data customer trans1;
	set customer_trans;
	Rounded_Price = ceil(Price);
	Month = month(Date);
	Year = year(Date);
run;


/* concat */
data make_model_set;
	set sashelp.cars;
	Make_Model =catx('', Make, Model);
run;

/* proc contents */

proc contents data = sashelp.air;
run;

/* proc sort */

proc sort data = sashelp.cars out = cars;
by Model;
run;

/* proc print */

proc print data = cars;
	var Type Invoice Make Model;
	by Type;
	sum Invoice;
	Title 'Cars Total Invoices by Type';
	Footnote 'Auto Analyst Dept - 12/19/21';
run; 

/* proc format */
proc format;
	value $gender 'M' = 'Male'
				 'F'= 'Female';
	value level    11 - 12 = 'Pre Teen'
					13 - High = 'Teen';
run;

proc print data = sashelp.class;
	format Sex $gender. Age level.;
run;

/* proc means */

proc means data = sashelp.baseball mean median
									stddev max min maxdec= 2;
	class Div;
	var CrHits;
run;


/* proc export */











