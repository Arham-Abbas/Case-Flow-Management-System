# Case-Flow-Management-System

Manages the flow of cases by scheduling them. The goal is achieved by implementing 3 different engines. Each engine has different purpose and the output of one is passed to another. The data is currently stored locally on the host machine.

## Engine-1

Engine-1 takes in a structured data or image/pdf document and converts it into structured data. It then stores the data into the database managed by PostgreSQL.

## Engine-2

Engine-2 then uses the generated data and allocates lawyers, judges and other resources to it. It then also assigns the desired priority of the case based on the nature of case. Then the data is again stored into a more comprehensive database.

## Engine-3

Engine-3 finally uses this data to create a multi-level priority queue which manages all the cases and arranges them in such a way that a high priority case gets preference. It also takes care of stale cases by increasing their priority. The scheduling is done in such a way that no conflicts regarding assigned judges and lawyers occurs.

## Installation

The software is designed to run on a Linux based machine. Follow the mentioned steps to install the software on your machine.

### Get source code

Get the software files from the source, by cloning this repository.

### Set permission

Open terminal and navigate to the cloned directory. Type and press enter the following command.

``` chmod +x *.sh ```

### Install required dependencies

Install the required dependencies by running following code in your terminal.
``` ./setup.sh ```
Please note that the required files are large and may require a high speed internet. Refrain from using mobile data to avoid incurring unexpected charges. Interrupting the setup script is not recommended.

### Launch the server

To start the server, use ``` sudo ./runserver.sh ``` in your terminal. Ensure that all four servers are running by testing the following URL from your browser.
- localhost:8000
- localhost:8002
- localhost:8001
- localhost:8003 
