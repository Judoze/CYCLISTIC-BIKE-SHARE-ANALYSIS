# Cyclistic Bike Share Analysis

## Introduction

![logo](data_viz/logo.jpeg)

The main purpose of this study is to analyze well cleaned and processed data and get insights. These insights would enable the Cyclistic Executive team make data 
driven decisions as regards marketing strategies that would be aimed at converting casual riders into annual riders.


## Background

In 2016, Cyclistic launched a successful bike-share offering. Since then, the program has grown to a fleet of 5,824 bicycles that are geotracked and locked into a 
network of 692 stations across Chicago. The bikes can be unlocked from one station and returned to any other station in the system anytime.
Until now, Cyclistic’s marketing strategy relied on building general awareness and appealing to broad consumer segments. One approach that helped make these things 
possible was the flexibility of its pricing plans: single-ride passes, full-day passes, and annual memberships. Customers who purchase single-ride or full-day 
passes are referred to as casual riders. Customers who purchase annual memberships are Cyclistic members.


## Scenario

“You are a junior data analyst working in the marketing analyst team at Cyclistic, a bike-share company in Chicago. The director of marketing believes the company’s 
future success depends on maximizing the number of annual memberships. Therefore, your team wants to understand how casual riders and annual members use Cyclistic 
bikes differently. From these insights, your team will design a new marketing strategy to convert casual riders into annual members. But first, Cyclistic executives 
must approve your recommendations, so they must be backed up with compelling data insights and professional data visualizations.”


## Theories/Assumptions

*	Annual members are much more profitable than casual riders.
*	Based on the information provided, it would be easier to convert existing casual riders to annual members than on boarding new clients as annual members


## Stakeholders

*	Cyclistic Executive Team
*	Cyclistic Marketing Analytics Team
*	Lili Moreno – Director of Marketing


## Business task

To determine the differences in how both annual members and casual riders use Cyclistic bikes and to use the insights derived from this to determine best 
marketing strategies that would convert casual riders to annual members.


## Data Source

The data used would cover rider information spanning a one-year period from January 2020 to January 2022.

The data has been made available by Motivate International Inc. with [license](https://ride.divvybikes.com/data-license-agreement), and is originally stored in 
separate CSV files organized by the different months of 
the year [here](https://divvy-tripdata.s3.amazonaws.com/index.html)!


## Data Processing & Analysis

The total number of the rows contained in the Datasets combined is **5,698,833** knocking out spreadsheets as the tool of choice for cleaning since they are 
limited when very large datasets are involved.

For the purpose of this project, SQL(Postgresql) was used for data cleaning, processing and analysis.

Click [HERE](cyclistic_data.sql)! To view processing queries.

After processing and cleaning, a total of **4,668,232** rows containing complete data is ready for analysis.


### Average Ride Length by subscription type


|  Subscription type   |   Average ride length  |

|  Casual Member       |   32.48                |

|  Annual Member       |   13.11                |



### Average Ride Length by Day of the week


|  Day of the week     |   Average ride length  |

|  Sunday              |   27.68                |

|  Monday              |   20.47                |

|  Tuesday             |   18.09                |

|  Wednesday           |   17.96                |

|  Thursday            |   18.13                |

|  Friday              |   20.67                |

|  Saturday            |   26.06                |



### Ride Counts by Day of the week


|  Day of the week     |   Average ride length  |

|  Saturday            |   836,461              |

|  Sunday              |   723,531              |

|  Friday              |   666,589              |

|  Wednesday           |   627,851              |

|  Tuesday             |   615,556              |

|  Thursday            |   610,738              |

|  Monday              |   587,506              |


## Data Visualization

The data was exported in a CSV file to Tableau for visualization and further analysis.


![Monthly Distribution](https://github.com/Judoze/CYCLISTIC-BIKE-SHARE-ANALYSIS/blob/main/data_viz/User%20Monthly%20distribution.png)

An overview of the monthly distribution of rides taken by both member types shows a significant increase in the use of the bike share services from the beginning 
of the month of May through to the end of the month of September; **predominantly around the summer period**. Service usage drops during the winter period: 
November to February. We can conclude that the weather plays a pivotal role in influencing user behavior regardless of subscription type.


![Percentage Representation](https://github.com/Judoze/CYCLISTIC-BIKE-SHARE-ANALYSIS/blob/main/data_viz/Percentage%20Rep.png)

Annual members rides make up 55.85% of the total number of rides for the period being analysed and Casual members make up about 44.15% which supports the theory that it would be easier to convert already existing casual members to annual members than onboarding new members since they already make up almost half of the year's business generated.
