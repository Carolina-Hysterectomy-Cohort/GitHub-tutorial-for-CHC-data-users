/***********************************************************************************/
/*Programmer: Natalie Rivadeneira											  	   */
/*Purpose: This will be used to test SAS program in the remote folder upload to    */
/*		   a GitHub repository for  version control and collaboration.  		   */
/*         This program should not be used for any analysis of CHC data. This is   */
/*         only for demonstration.    											   */
/***********************************************************************************/

/*Regression analysis*/


*The regression estimates will be presented in Table 2; 

title "Outcome adjusted for patient demographic variable 2 with random intercepts ";
proc glimmix data= work ;
class pt_demog_var1 (ref="Group A");
model outcome (event="1") = pt_demog_var1 pt_demog_var2 /cl dist=poisson link=log solution;
random intercept / subject =hospital_var type=cs solution cl;
random intercept / subject =provider_var type=cs solution cl;

estimate 'RR Group B vs. Group A' pt_demog_var1 0 1 0 0 0 0 -1/ exp cl;
estimate 'RR Group C vs. Group A' pt_demog_var1 0 0 1 0 0 0 -1/ exp cl;
estimate 'RR one-unit change pt_demog_var2' pt_demog_var2 1 / exp cl;

run;







