This readme file was initially generated on 2025-07-09 by Paul Musgrave. It was modified on 2025-10-03 to reflect expanded data collection.

# GENERAL INFORMATION

* Title of Dataset: Qatar Cars
## Author
Name: Paul Musgrave
ORCID: https://orcid.org/0000-0002-8984-4992
Institution: Georgetown University Qatar
Address: Education City, Doha, Qatar
Email: rpm47@georgetown.edu

* Date of data collection: January 2025, with additional data collected in July and August 2025.

* Geographic location of data collection: Doha, State of Qatar

* Information about funding sources that supported the collection of the data: No funding 


# SHARING/ACCESS INFORMATION

* Licenses/restrictions placed on the data: Mozilla Public License Version 2.0

* Was data derived from another source?
	* If yes, list source(s): YallaMotor Qatar's listing of vehicles for sale, along with a variety of other Internet sources to piece together "missing" data.

* Recommended citation for this dataset: 

Musgrave, Paul. 2025. "Introducing the Qatar Cars Dataset." July 8. https://musgrave.substack.com/p/introducing-the-qatar-cars-dataset


# DATA & FILE OVERVIEW

## File List: 

* this file
* qatarcars.dta
* qatarcars.csv

* Relationship between files, if important: Identical data, different formats.
* Additional related data collected that was not included in the current data package: NA
* Are there multiple versions of the dataset? NA
	* If yes, name of file(s) that was updated: NA
	* Why was the file updated? NA
	* When was the file updated? NA


# METHODOLOGICAL INFORMATION

## Description of methods used for collection/generation of data: 

The data was collected as part of a statistics course for International Politics majors at Georgetown University. Data was gathered from online automobile Web sites and collected via Google Forms and spreadsheets. Students were assigned automobile manufacturers and told to collect one to three makes for each manufacturer. In addition to collecting much of the data, Musgrave edited the data and ensured consistency in formatting.


# DATA-SPECIFIC INFORMATION FOR QATAR CARS DATASET

* Number of variables: 15
* Number of cases/rows: 99
* Variable List: 

origin          Origin Country Associated with Car (Germany, Italy, Japan, PR China, South Korea, Sweden, UK, USA)

make            Make (30 unique variables; names of brands of automobiles: Audi, BMW, BYD, Bentley, Bestune, Bugatti, Cadillac, Chery, Ford, Geely, Honda, Hyundai, Jaguar, Jetour, Kia, Land Rover, Lexus, Lotus, MG, Maserati, Mazda, McLaren, Mercedes, Mitsubishi, Nissan, Porsche, Tesla, Toyota, Volkswagen, Volvo

model           Model (99 unique models, such as Tiggo 8 Pro Max and Rav4 Hybrid)
length          Length (m)
width           Width (m)
height          Height (m)
seating         Number of Seats
trunk           Trunk Capacity (L)
economy         Fuel Economy (L/100km)
horsepower      Horsepower (hp)
price           Price (QAR)
mass            Mass (kg)
performance     Time 0-100km/h (s)
type            Type (coupe, hatchback, SUV, sedan)
enginetype      Engine Type (Electric, Hybrid, Petrol)


* Missing data codes: Missing data codes: economy is "missing" for electric vehicles (denoted by .), as fuel economy in L/100km is not applicable to electric powertrains.
