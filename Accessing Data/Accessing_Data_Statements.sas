/*PROC CONTENTS procedure is used to retrieve information about the structure and metadata of a SAS dataset.*/

PROC CONTENTS DATA=your_dataset;
RUN;
/*-------------------------------------*/

/* Using a library in SAS allows you to efficiently access and read data from external sources, such as datasets, enhancing data analysis and manipulation capabilities.*/

LIBNAME libref engine "path";
/*libref -> should be 8 letters and similiar attributes condition of column names*/
/*engine -> can be Base, Excel, Terradata, Hadoop etc.*/
/*path -> local location path of the dataset folder or file.*/
/*-------------------------------------*/

/*The statement is used to disconnect or "clear" a library reference that was previously assigned using the LIBNAME statement. */

LIBNAME libref CLEAR;

/*-------------------------------------*/

/*The SAS "WORK" library is a temporary storage space where SAS datasets and intermediate results are stored during a session for data processing and analysis.*/

*Using a Library to Read Excel Files;
*synax and example;

*Complete the options statement;
OPTIONS VALIDVARNAME=v7;

*Complete the LIBNAME statement;
LIBNAME xlsfile xlsx "Pathname";

*Complete the data= worksheet to refer the xlsfile;
PROC CONTENTS DATA=libref.dataset;
RUN;







