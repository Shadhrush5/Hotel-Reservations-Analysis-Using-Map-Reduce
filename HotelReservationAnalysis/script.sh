python DBMS_DataPreprocessing.py $1 $2
hadoop fs -mkdir /Project/
hadoop fs -mkdir /Project/Input
hadoop fs -mkdir /Project/Input2
hadoop fs -mkdir /Project/Input3
hadoop fs -put Intermediate_input/input.csv /Project/Input
hadoop fs -put Intermediate_input/input_season.csv /Project/Input2
hadoop fs -put Intermediate_input/input_country.csv /Project/Input3
hadoop jar ProfitableMonth/jarFiles/test1.jar  ProfitableMonthSorted /Project/Input /Project/Output
hadoop jar ProfitableMonth/jarFiles/test2.jar  ProfitableMonthSeason /Project/Input2 /Project/Output2
hadoop jar ProfitableMonth/jarFiles/test3.jar  ProfitableMonthCountry /Project/Input3 /Project/Output3
hadoop fs -copyToLocal /Project/Output/part-r-00000 $3/Output1.txt
hadoop fs -copyToLocal /Project/Output2/part-r-00000 $3/Output2.txt
hadoop fs -copyToLocal /Project/Output3/part-r-00000 $3/Output3.txt
