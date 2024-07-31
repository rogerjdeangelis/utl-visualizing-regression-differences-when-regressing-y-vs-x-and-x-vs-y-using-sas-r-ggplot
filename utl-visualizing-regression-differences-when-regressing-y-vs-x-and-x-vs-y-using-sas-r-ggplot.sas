%let pgm=utl-visualizing-regression-differences-when-regressing-y-vs-x-and-x-vs-y-using-sas-r-ggplot;

Visualizing regression differences when regressing y on x and x on y using the y given x equation and it inverse

output graphic
https://tinyurl.com/4rmuchu2
https://github.com/rogerjdeangelis/utl-visualizing-regression-differences-when-regressing-y-vs-x-and-x-vs-y-using-sas-r-ggplot/blob/main/fatherson.pdf

Not sure where this message is going, but I thought it was worth investigating.
Question: How can we regress y on x  such that the regression is invertible?

Can I use predict y given x and x given y from my regression equation

        Estimating x from y and y from x using the regression equation and it inverse

            1 SAS R-Squared =  1 and R-Squared  = .1
            2 R R-Squared  = .4

github
https://tinyurl.com/2n48h7t3
https://github.com/rogerjdeangelis/utl-visualizing-regression-differences-when-regressing-y-vs-x-and-x-vs-y-using-sas-r-ggplot

github
https://tinyurl.com/4xut78ed
https://stackoverflow.com/questions/78727401/ggplots-geom-smooth-fails-with-formula-yx

Why do the regression predictions differ when regressing y on x and x on y

INTERESTING PROPERTIES OF REgressing Y on X and A on Y

     1 In the plot below the both axes can be used as x and y axes.


     2  note if son is regressed on father then son = a*father + b,
        However the father regressed on son is NOT father = (son-b)/a

     3  Why aren't the regressions inverses?
        If you look closely at the plot below

          The regression of son on father is the vertical distances
          of the 'f' line to the points.

          If you turn your head the regression of son on father
          is the horixontal distances tot 's'

     4. If the correlation of  son on father is perfect ie r=1 or -1
        then all vertical and horizontal residual are all zero and
        the following holds

            son = a*father + b
            father = (son-b)/a

        Easy to show with matrix algebra.

     5  Slope of y on x: ayx = r * (sy / sx)
        Slope of x on y: axy = r * (sx / sy)

        Where r is the correlation coefficient,
        sy is the standard deviation of y, a
        and sx is the standard deviation of x.

     6  Given 4 the product of the slopes = r**2
           slopes
                       r * sy    r * sx
           ayx * axy = ------  * ------  = r**2
                        sx        sy

      For y on x: intercept = mean(y) - slope * mean(x)
For x on y: intercept = mean(x) - slope * mean(y)

/*               _     _
 _ __  _ __ ___ | |__ | | ___ _ __ ___
| `_ \| `__/ _ \| `_ \| |/ _ \ `_ ` _ \
| |_) | | | (_) | |_) | |  __/ | | | | |
| .__/|_|  \___/|_.__/|_|\___|_| |_| |_|
|_|
*/


/**************************************************************************************************************************/
/*                                                      |                                                                 */
/*    You can estimate Y from X and X from Y            |            Visualizing the difference                           */
/*                                                      |                                                                 */
/*                 R-Squared = 1                        |                R-Squared = .1                                   */
/*                                                      |                                                                 */
/*                  f(x) = f(y)                         |                f(x) ne f(y)                                     */
/*                                                      |                                                                 */
/*                   X & Y                              |                       X & Y                                     */
/*                                                      |                                                                 */
/*            165  170  175  180  185  190              |            165  170  175  180  185  190                         */
/*           --+----+----+----+----+----+---            |           --+----+----+----+----+----+---                       */
/*           |                             |            |           |                             |                       */
/*           | ORIGINAL                    |            |           |  ORIGINAL         OORIGINAL |                       */
/*       190 + f(x) = ax + b RSquared=1 /  + 190        |       190 +  f(x) =y=ax + b  o       i  + 190                   */
/*           |                         /   |            |           |                 o       i   |                       */
/*           | INVERSE                /    |            |           |  RSquared=.1    o      i    |                       */
/*           | f(y) = (y-b)/a        /     |            |           |                o      i     |                       */
/*           |                      /      |            |           |               o      i      |                       */
/*       185 + When RSquared = 1   /       + 185        |       185 +               o     i       + 185                   */
/*           | You can use y      /        |            |           |              o     i        |                       */
/*           | to estimate x     /         |            |           |              o    i         |                       */
/*           |                  /          |      f(y)  |  f(y)     |             o    i          |     f(y)              */
/*  f(y)     |                 /           |            |           |            o    i INVERSE   |                       */
/*       180 +                /            + 180        |       180 +            o   i            + 180                   */
/*           |               /             |       &    |   &       |           o   i             |      &                */
/*    &      |              /              |            |           |           o  i              |                       */
/*           |             /               |            |           |          o i                |                       */
/*           |            /                |      f(x)  |  f(x)     |          o                  |     f(x)              */
/*  f(x) 175 +           /                 + 175        |       175 +         oi                  + 175                   */
/*           |          /                  |            |           |        oi                   |                       */
/*           |         / When R-Squared =1 |            |           |        oi                   |                       */
/*           |        /                    |            |           |       o                     |                       */
/*           |       /                     |            |           |       o                     |                       */
/*       170 +      /                      + 170        |       170 +      o                      + 170                   */
/*           |     /                       |            |           |     io                      |                       */
/*           |    /                        |            |           |    io                       |                       */
/*           |   /                         |            |           |   io                        |                       */
/*           |  /                          |            |           |  i                          |                       */
/*       165 + /                           + 165        |       165 + i INVERSE f(y)=x=(y-b)/a    + 165                   */
/*           |                             |            |           |                             |                       */
/*           --+----+----+----+----+----+---            |           --+----+----+----+----+----+---                       */
/*            165  170  175  180  185  190              |            165  170  175  180  185  190                         */
/*                                   s                  |                                                                 */
/*                     X & Y                            |                        X & Y                                    */
/*                                                      |                                                                 */
/**************************************************************************************************************************/


/*   _                   _      ___
/ | (_)_ __  _ __  _   _| |_   ( _ )    _ __ ___   __ _  ___ _ __ ___
| | | | `_ \| `_ \| | | | __|  / _ \/\ | `_ ` _ \ / _` |/ __| `__/ _ \
| | | | | | | |_) | |_| | |_  | (_>  < | | | | | | (_| | (__| | | (_) |
|_| |_|_| |_| .__/ \__,_|\__|  \___/\/ |_| |_| |_|\__,_|\___|_|  \___/
            |_|
*/

%macro yxxy(stdev=);

options validvarname=any;
data sd1.have98;
  call streaminit(4321);
  do x=165 to 190 by .25;
    father=x;
    son=father + rand('normal',0,&stdev);
    if 165 <= x <= 190 then output;
  end;
run;quit;

proc corr data=sd1.have98;
var son;
with father;
run;quit;

* get the four parameters;
options ls=255 ps=65;
ods output parameterestimates(persist=proc)=parms;
proc reg data=sd1.have98; model son=father;OUTPUT OUT=sf P=sf;run;quit;
proc reg data=sd1.have98; model father=son;OUTPUT OUT=fs P=fs;run;quit;
ods output close;

%array(_par,data=parms,var=estimate);

%put &=_par1;
%put &=_par2;
%put &=_par3;
%put &=_par4;

* _PAR1=-0.868718792 * intercept son    = a*father + b;
* _PAR2=1.0050373474 * slope     son    = a*father + b;
* _PAR3=1.4085856112 * intercept father = a*son    + b;
* _PAR4=0.9918790083 * slope     father = a*son    + b;

* use the parameters and add inverse of the father on son equation;
data xy1;
  do son=165 to 190 by .125;
    father=son;
    sonfather    =  &_par1  + &_par2*father;        * son regressed on father;
    fatherson    =  &_par3 + &_par4*son;        * father regressed on son;
    fatherson90  = (fatherson-&_par3)/&_par4; * solve father regressed on son for son;
    output;
  end;
run;quit;

options ls=64 ps=40;
proc plot data=xy1(rename=sonfather=sf123456789012345678901234567890);
 plot sf123456789012345678901234567890*son='o' fatherson90*son='i' /overlay box haxis=165 to 190 by 5 vaxis=165 to 190 by 5;
run;quit;

%mend yxxy;

/*
 _ __  _ __ ___   ___ ___  ___ ___
| `_ \| `__/ _ \ / __/ _ \/ __/ __|
| |_) | | | (_) | (_|  __/\__ \__ \
| .__/|_|  \___/ \___\___||___/___/
|_|
*/

%yxxy(stdev=.1);  /*  essetially results in R-squated=1 */
%yxxy(stdev=30);  /*  essetially results in R-squated=.1 */

/*           _               _
  ___  _   _| |_ _ __  _   _| |_
 / _ \| | | | __| `_ \| | | | __|
| (_) | |_| | |_| |_) | |_| | |_
 \___/ \__,_|\__| .__/ \__,_|\__|
                |_|
*/

 /**************************************************************************************************************************/
 /*                                                                                                                        */
 /*        --+----+----+----+----+----+---           --+----+----+----+----+----+---                                       */
 /*        |                             |           |                     o       |                                       */
 /*        |                             |           |                    oo       |                                       */
 /*    190 +                          1  +       190 +                    o     i  +                                       */
 /*        |                         1   |           |                   oo    i   |                                       */
 /*        |                        1    |           |                   o    i    |                                       */
 /*        |                       1     |           |                  o    i     |                                       */
 /*        |                      1      |           |                 oo   i      |                                       */
 /*    185 +                     1       +       185 +                 o   i       +                                       */
 /*        |                    1        |           |                oo  i        |                                       */
 /*        |                   1         |           |               oo  i         |                                       */
 /*        |                  1          |           |               o  i          |                                       */
 /*        |                 1           |           |              oo i           |                                       */
 /*    180 +                1            +       180 +              o i            +                                       */
 /*        |               1             |           |             o i             |                                       */
 /*        |              1              |           |            ooi              |                                       */
 /*        |             1               |           |            oi               |                                       */
 /*        |            1                |           |           oo                |                                       */
 /*    175 +           1                 +       175 +           o                 +                                       */
 /*        |          1                  |           |          o                  |                                       */
 /*        |         1                   |           |         oo                  |                                       */
 /*        |        1                    |           |        io                   |                                       */
 /*        |       1                     |           |       ioo                   |                                       */
 /*    170 +      1                      +       170 +      ioo                    +                                       */
 /*        |     1                       |           |     i o                     |                                       */
 /*        |    1                        |           |    i oo                     |                                       */
 /*        |   1                         |           |   i  o                      |                                       */
 /*        |  1                          |           |  i  o                       |                                       */
 /*    165 + 1                           +       165 + i  oo                       +                                       */
 /*        |                             |           |    o                        |                                       */
 /*        --+----+----+----+----+----+---           --+----+----+----+----+----+---                                       */
 /*         165  170  175  180  185  190              165  170  175  180  185  190                                         */
 /*                                                                                                                        */
 /*                      son                                       son                                                     */
 /**************************************************************************************************************************/



/*                   _
(_)_ __  _ __  _   _| |_
| | `_ \| `_ \| | | | __|
| | | | | |_) | |_| | |_
|_|_| |_| .__/ \__,_|\__|
        |_|
*/

options validvarname=any;
data sd1.have;
  call streaminit(4321);
  input father son @@;
 father=father+4*rand('uniform');
 son=son+4*rand('uniform');
cards4;
173 174  173 174   173 174   173 174   173 174   173 174   173 174   173 174
181 170  181 170   181 170   181 170   181 170   181 170   181 170   181 170
186 184  186 184   186 184   186 184   186 184   186 184   186 184   186 184
176 169  176 169   176 169   176 169   176 169   176 169   176 169   176 169
175 164  175 164   175 164   175 164   175 164   175 164   175 164   175 164
169 175  169 175   169 175   169 175   169 175   169 175   169 175   169 175
183 180  183 180   183 180   183 180   183 180   183 180   183 180   183 180
168 165  168 165   168 165   168 165   168 165   168 165   168 165   168 165
179 166  179 166   179 166   179 166   179 166   179 166   179 166   179 166
175 170  175 170   175 170   175 170   175 170   175 170   175 170   175 170
173 169  173 169   173 169   173 169   173 169   173 169   173 169   173 169
165 170  165 170   165 170   165 170   165 170   165 170   165 170   165 170
174 170  174 170   174 170   174 170   174 170   174 170   174 170   174 170
173 174  173 174   173 174   173 174   173 174   173 174   173 174   173 174
181 184  181 184   181 184   181 184   181 184   181 184   181 184   181 184
169 173  169 173   169 173   169 173   169 173   169 173   169 173   169 173
173 167  173 167   173 167   173 167   173 167   173 167   173 167   173 167
179 180  179 180   179 180   179 180   179 180   179 180   179 180   179 180
180 174  180 174   180 174   180 174   180 174   180 174   180 174   180 174
176 179  176 179   176 179   176 179   176 179   176 179   176 179   176 179
164 165  164 165   164 165   164 165   164 165   164 165   164 165   164 165
185 182  185 182   185 182   185 182   185 182   185 182   185 182   185 182
173 168  173 168   173 168   173 168   173 168   173 168   173 168   173 168
168 168  168 168   168 168   168 168   168 168   168 168   168 168   168 168
178 172  178 172   178 172   178 172   178 172   178 172   178 172   178 172
;;;;
run;quit;

/*          _                               _       _
/ |  _ __  | |_ __ ___     __ _  __ _ _ __ | | ___ | |_
| | | `__| | | `_ ` _ \   / _` |/ _` | `_ \| |/ _ \| __|
| | | |    | | | | | | | | (_| | (_| | |_) | | (_) | |_
|_| |_|    |_|_| |_| |_|  \__, |\__, | .__/|_|\___/ \__|
                          |___/ |___/|_|
*/

%utlfkil(d:/pdf/fatherson.pdf);

%utl_rbeginx;
parmcards4;
library(haven)
library(ggplot2)
library(tidyverse)
library(MASS)
library(haven)
source("c:/oto/fn_tosas9x.R")
have<-read_sas("d:/sd1/have.sas7bdat")
have
reg<-lm(data=have,son~father)
summary(reg)
reg<-lm(data=have,father~son)
summary(reg)
;;;;
%utl_rendx;

pdf("d:/pdf/fatherson.pdf");
ggplot(have, aes(x=father, y=son)) +
  theme(aspect.ratio = 1) +
  xlim(165, 190) +
  ylim(165, 190) +
  labs(title = "Adult height of fathers and sons, England", x = "X = Father height (cm)", y = "Y = Son height (cm)") +
  geom_point(shape = 'o', size=2, color='black', na.rm = TRUE) +
  geom_smooth(method='lm', formula = y~x, linewidth=.3, colour = 'blue', na.rm = TRUE) +
  annotate("text", x = 172, y = 172, angle = 26, size=4, colour = 'blue', label = 'Regression of Son on Father') +
  # Second linear regression with the axis of orientation switched.
  geom_smooth(method='lm', formula = y~x, orientation = "y", linewidth=.3, colour = 'red', na.rm = TRUE) +
  annotate("text", x = 174, y = 168, angle = 90 - 26, size=4, colour = 'red', label = 'Regression of Father on Son')
pdf()
;;;;
%utl_rendx;

/**************************************************************************************************************************/
/*                                                                                                                        */
/*  R-SQUARED = 0.4                                                                                                       */
/*                                                                                                                        */
/*                                                                                                                        */
/*  SON axis is both an x and y axis                                                                                      */
/*  Father axis is both an x and y axis                                                                                   */
/*                                                                                                                        */
/*          ---------------------------------------------------------                                                     */
/*          |                                                       |                                                     */
/*          | sonfather = 0.62662*father+ 67.72754 (180,176) R**2=1 |                                                     */
/*          | fatherson = 0.62998*son   + 62.92949 (180,180) R**2=1 |                                                     */
/*          |                                                       |                                                     */
/*          | SLOPES AS A FUNCTION OF STADARIZATIONS                |                                                     */
/*          |                                                       |                                                     */
/*          | stdson        7.2709826  sx  (x=165 to 190)           |                                                     */
/*          | stdfather     7.2709826  sx                           |                                                     */
/*          | sonfather     4.5805736  s_son                        |                                                     */
/*          | fatherson     4.5561431  s_father                     |                                                     */
/*          |                                                       |                                                     */
/*          | fatherson slope = s_son/sx    = 4.581/7.271 = 0.6300  |                                                     */
/*          | sonfather slope = s_father/sx = 4.556/7.271 = 0.6266  |                                                     */
/*          |                                                       |                                                     */
/*          | PRODUCT OF THE SLOPES = R**2 =1                       |                                                     */
/*          |                                                       |                                                     */
/*          | y=1.5958635218*x -108.0839105                         |                                                     */
/*          |                                                       |                                                     */
/*          |   1.5958635218 * 0.62662 = 1                          |                                                     */
/*          |                                                       |                                                     */
/*          |-------------------------------------------------------|                                                     */
/*          |                       FATHER                          |                                                     */
/*          |  1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1  |                                                     */
/*          |  6 6 6 6 6 7 7 7 7 7 7 7 7 7 7 8 8 8 8 8 8 8 8 8 8 9  |                                                     */
/*          |  5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0  |                                                     */
/*          ---+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+---                                                     */
/*          |                                |                      |                                                     */
/*          | Two x axes                     | son=                 |                                                     */
/*          |  f = father x axis             |  1.596*father-108.08 |                                                     */
/*          |                                |                      |                                                     */
/*      190 +  s = son x axis                |            ff        + 190                                                 */
/*      189 +                                |           ff         + 189                                                 */
/*      188 +                                |         fff          + 188                                                 */
/*      187 +                                |         f            + 187                                                 */
/*      186 +                                |       ff             + 186                                                 */
/*      185 +                                |      ff              + 185                                                 */
/*      184 +                                |    fff               + 184                                                 */
/*      183 +                                |   ff              s  + 183                                                 */
/*      182 +                                |  f             ssss  + 182                                                 */
/*   S  181 + son and father =180cm          |  f           ss      + 181 S                                               */
/*   O  180 +------------------------------- O f--------------------+ 180 O                                               */
/*   N  179 +                               ff      ssss            + 179 N                                               */
/*      178 +                              ff|   sss                + 178                                                 */
/*      177 + father=180cm son=176cm      ffffss                    + 177                                                 */
/*      176 +----------------------------sffsO ---------------------+ 176                                                 */
/*      175 +                          sffs                         + 175                                                 */
/*      174 +son=.6266*father+67.728 sss     |                      + 174                                                 */
/*      173 +                    ssssff      |                      + 173                                                 */
/*      172 +                 ss    f        |                      + 172                                                 */
/*      171 +               sss   f          |                      + 171                                                 */
/*      170 +           ssss     ff          |                      + 170                                                 */
/*      169 +       ssss        f            |                      + 169                                                 */
/*      168 +    ss           ff             |                      + 168                                                 */
/*      167 +  sss           ff              |                      + 167                                                 */
/*      166 +               ff               |                      + 166                                                 */
/*      165 +              ff                |                      + 165                                                 */
/*          |                                |                      |                                                     */
/*          ---+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+---                                                     */
/*             1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 1                                                        */
/*             6 6 6 6 6 7 7 7 7 7 7 7 7 7 7 8 8 8 8 8 8 8 8 8 8 9                                                        */
/*             5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0 1 2 3 4 5 6 7 8 9 0                                                        */
/*                                                                                                                        */
/*                                   FATHER                                                                               */
/*                                                                                                                        */
/*------------------------------------------------------------------------------------------------------------------------*/
/*                                                                                                                        */
/* Manual Check  (where x=y and y=x)                                                                                      */
/*                                                                                                                        */
/*   suppose the sons height is 180cm then fathers height i  s= 67.72754 + 0.62662*180  = 180; ok                         */
/*   suppose the fathers height is 180cm then f sons height is= 62.92949 + 0.62998*180  = 176  ok                         */
/*                                                                                                                        */
/*   INTERSECTION                                                                                                         */
/*                                                                                                                        */
/*           --+--------+--------+--------+--------+--                                                                    */
/*      SON  |                   |          f        |                                                                    */
/*           |                   |                   |                                                                    */
/*    175.25 +                   |         f         +                                                                    */
/*           |                   |                   |                                                                    */
/*    175.13 +                   |       f           +                                                                    */
/*           |                   |                 s |                                                                    */
/*    175.00 +                   |      f        s   +                                                                    */
/*           |                   |             s     |                                                                    */
/*    174.88 +                   |     f             +                                                                    */
/*           |                   |          s        |                                                                    */
/*    174.75 +                   |   f    s          +                                                                    */
/*           |                   |      s            |                                                                    */
/*    174.63 +                   |  f                +                                                                    */
/*           |                   |    s              |                                                                    */
/*    174.50 +-------------------Ofs-----------------+                                                                    */
/*           |                   s                   |                                                                    */
/*    174.38 +                 s f(177.0544,174.470) +                                                                    */
/*           |                   |                   |                                                                    */
/*    174.25 +               s f |                   +                                                                    */
/*           |            s      |                   |                                                                    */
/*    174.13 +          s     f  |                   +                                                                    */
/*           |        s          |                   |                                                                    */
/*    174.00 +               f   |                   +                                                                    */
/*           |      s            |                   |                                                                    */
/*           --+--------+--------+--------+--------+--                                                                    */
/*           176.0    176.5    177.0    177.5    178.0                                                                    */
/*                                                                                                                        */
/*                             FATHER                                                                                     */
/*                                                                                                                        */
/*   Lets find the intersection of two equations                                                                          */
/*                                                                                                                        */
/*   We can use father regressed on son directly.                                                                         */
/*                                                                                                                        */
/*    y=67.72754  + 0.62662*x                                                                                             */
/*                                                                                                                        */
/*   However we need to solve for father as a function of son                                                             */
/*   in the second equation in order to find the intersection                                                             */
/*                                                                                                                        */
/*    y=1.5958635218*x -108.0839105                                                                                       */
/*                                                                                                                        */
/*   Lets solve the simutaneous equations                                                                                 */
/*                                                                                                                        */
/*    y=1.5958635218*x -108.0839105                                                                                       */
/*    y=0.62998*x       +62.92949                                                                                         */
/*                                                                                                                        */
/*    Subtracting and solving for x                                                                                       */
/*                                                                                                                        */
/*    0.9658835*x  -171.0134005 = 0                                                                                       */
/*                                                                                                                        */
/*    x= 171.0134005/0.9658835 = 177.05385846                                                                             */
/*                                                                                                                        */
/*    Substituting 177.05385846 in                                                                                        */
/*                                                                                                                        */
/*    y = 62.92949  + 0.62998*177.05385846 = 174.46987975                                                                 */
/*                                                                                                                        */
/*    The intersection poin on the graph is (177.05385846,174.46987975)                                                   */
/*                                                                                                                        */
/**************************************************************************************************************************/
/*              _
  ___ _ __   __| |
 / _ \ `_ \ / _` |
|  __/ | | | (_| |
 \___|_| |_|\__,_|

*/
