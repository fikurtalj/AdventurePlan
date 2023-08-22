-- CREATE 
CREATE DATABASE adventurePlan
--create user
CREATE USER techuser WITH PASSWORD "password";
--create schemas:
/*
CREATE SCHEMA userData;
CREATE SCHEMA event;
CREATE SCHEMA location;
*/
--create tables:
   
     --user tables:
CREATE TABLE userData.users
(
    userID  BIGSERIAL  PRIMARY KEY,
    userName VARCHAR(255) NOT NULL,
    password VARCHAR(255) NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    middleName VARCHAR(255) NULL,
    lastName VARCHAR(255) NOT NULL,
    emailAdress VARCHAR(128) NOT NULL,
    socialMedia VARCHAR(255)  NULL,
    website VARCHAR(255) NULL,
    UNIQUE (emailAdress)
);

CREATE TABLE userData.userType
(
    userTypeID SERIAL PRIMARY KEY,
    userTypeName VARCHAR(255) NOT NULL ---> restaurant, OPG, winery, smallbusiness, pub, hostel,adventurePark,adventurer
);


CREATE TABLE userData.Address
(
    addressID SERIAL PRIMARY KEY,
    streetName VARCHAR(255),
    postalcode VARCHAR(128),
    cityName VARCHAR(255),
    countryName VARCHAR (255)
);

CREATE TABLE userData.reservations
(
    restervationID SERIAL PRIMARY KEY,
    userID INT NOT NULL,
    reservationName VARCHAR(255),
    restervationStatus VARCHAR(32), --> active, nonactive
    reservationTime DATETIME
);
 
 
 
    --EVENT tables

CREATE TABLE event.events
(
    eventID SERIAL PRIMARY KEY,
    userID INT,
    eventtypeID INT, 
    eventaddressID INT, 
    eventName VARCHAR(255) NOT NULL,
    eventDescription VARCHAR(255) NOT NULL,
    eventStatus VARCHAR(32) NOT NULL,
    eventStartTime datetime NULL,
    eventEndTime datetime NULL,
CONSTRAINT FK_events_userid_user_userid
      FOREIGN KEY(userID) 
	  REFERENCES event.events(userID),
CONSTRAINT FK_events_eventtypeid_eventtype_eventtypeid
      FOREIGN KEY(eventTypeID) 
	  REFERENCES event.eventtype(eventtypeID),
CONSTRAINT FK_events_eventaddressid_eventaddress_eventaddressid
      FOREIGN KEY(eventaddressID) 
	  REFERENCES event.eventaddress(eventaddressID)
);


CREATE TABLE event.eventType
(
    eventTypeID SERIAL PRIMARY KEY,
    eventTypeName VARCHAR(128) 
);

CREATE TABLE event.proposalEvents
(
    proposalEventID SERIAL PRIMARY KEY,
    voteCount BIGINT,
    voteStatus VARCHAR(255) --> very interested, interested, not interested
);


CREATE TABLE  event.Address
( 
    addressID SERIAL PRIMARY KEY,
    streetName VARCHAR(255),
    postalcode VARCHAR(128),
    cityName VARCHAR(255),
    countryName VARCHAR(255)
);


--LOCATION TABLES:
CREATE TABLE location.location
( 
    locationID SERIAL PRIMARY KEY,
    coordinates VARCHAR(255)
);


--tables:
-- eventPlans -?
-- planStatus-?








