# Hotel-Reservations-Analysis-Using-Map-Reduce
A MapReduce Approach to Identify the patterns in Hotel reservations data set.

## What is Map Reduce?
MapReduce is a programming model and software framework used for processing and analyzing large-scale data sets in a parallel and distributed manner. It was introduced by Google and has become a fundamental concept in big data processing.

The MapReduce framework divides a computation task into two main phases: the map phase and the reduce phase.

### Map phase
In the map phase, the input data is divided into smaller chunks and processed in parallel by multiple map tasks. Each map task applies a specified function or transformation to the input data and generates a set of key-value pairs as intermediate output.

### Reduce phase
In the reduce phase, the intermediate key-value pairs are grouped and processed by the reduce tasks. Each reduce task performs a specific operation, such as aggregation or summarization, on the grouped data. The final output is a set of key-value pairs representing the result of the computation.

MapReduce allows for distributed processing of data across a cluster of machines, enabling scalability and fault tolerance. It abstracts the complexity of parallel and distributed computing, allowing developers to focus on the logic of the map and reduce functions.

Overall, MapReduce provides an efficient and scalable approach for processing and analyzing large volumes of data, making it a key component of many big data processing frameworks and systems.


## Dataset
We are using two datasets. The first dataset (hotel-bookings) provides booking information from 2015 to 2016. The second dataset (customer-reservations) provides information about the reservation details from 2017 to 2018.

## Analysis
We used a total of 3 jobs to perform different analysis on the data. Each job has a different input and output as explained in detail below.

**1. Finding the month with the highest grossing revenue over the 4 years of data.**

The BookingMapper class is our mapper class here. In this case, the input key is the month year combination, and the input value is the revenue for each data point from the input file. The mapper parses the input record, extracts the necessary attributes (booking status, total cost, and month-year), and filters out canceled bookings. It then sets the month-year as the output key and the total cost as the output value.
The BookingReducer class extends the Reducer class, which is responsible for reducing the intermediate key-value pairs to a final output. In this case, the key is the month year combination, and the input value is the revenue for each data point from the input file. The reducer calculates the total revenue for each month by summing up the revenue values. It uses a TreeMap to store the revenue as the key and the month-year as the value, sorting the entries based on revenue in descending order. In the cleanup method, the sorted results are outputted, with the month-year and revenue being written as the final output key-value pairs.
The main method sets up the MapReduce job by configuring the job parameters, specifying the mapper and reducer classes, and defining the input and output formats. It uses the TextOutputFormat to write the final output as text. The input and output paths are provided as command-line arguments. This is common for all the Map-Reduce programs explained below as well.
Overall, the Map-Reduce construct uses the hotel booking data and  calculates the total revenue for each month, and outputs the result in descending order of revenue.

**2. Finding the season with the highest grossing revenue over the 4 years of data.**

The BookingMapper class is our mapper class here. In this case, the input key is the season, and the input value is the revenue for each data point from the input file.The mapper parses the input record, extracts the necessary attributes (booking status, total cost, and season), and filters out canceled bookings. It sets the season as the output key and the total cost as the output value.
		The BookingReducer class extends the Reducer class, which is responsible for reducing the intermediate key-value pairs to a final output. In this case, the key is the season, and the input value is the revenue for each data point from the input file. The reducer calculates the total revenue for each season by summing up the revenue values. It uses a TreeMap to store the revenue as the key and the season as the value, sorting the entries based on revenue in descending order. In the cleanup method, the sorted results are outputted, with the season and revenue being written as the final output key-value pairs.
Finally, this program processes the hotel booking data, calculates the total revenue for each season, and outputs the result in descending order of revenue.

**3. Finding the countries that book reservations the most during each season.**

The CountryMapper class is our mapper class here. In this case, the input key is the season, and the input value is the country for each data point from the input file. The mapper parses the input record, extracts the necessary attributes (booking status, season, and country), and filters out canceled bookings. It sets the season as the output key and the country as the output value.

	The TopCountryReducer class extends the Reducer class and reduces the intermediate key-value pairs to a final output. The input key is a Text object representing the season, and the input value is a Text object representing the country. The reducer counts the occurrences of each country for a given season and determines the top country based on the maximum count. It stores the top country for each season in a Map called topCountryMap. In the cleanup method, the top country for each season is outputted as the final result.
In the end this program processes the hotel booking data, counts the occurrences of each country for each season, and determines the top country for each season based on the maximum count. The result is written to the output file.
