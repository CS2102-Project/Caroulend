CREATE TABLE stuff (
	itemID CHAR(10) PRIMARY KEY,
	type VARCHAR(16),
	name VARCHAR(64),
	owner CHAR(7),
	currentBorrower CHAR(7)
);

CREATE TABLE post (
	postID CHAR(13) PRIMARY KEY,
	itemID CHAR(7) REFERENCES stuff(itemID),
	loanFee NUMERIC,
	location VARCHAR(256),
	availablePeriod VARCHAR(256)
);

CREATE TABLE user (
	userID CHAR(7) PRIMARY KEY,
	creditRating CHAR(3)
);

CREATE TABLE bid (
	postID CHAR(13) REFERENCES post(postID),
	bidder CHAR(7) REFERENCES user(userID),
	bidPrice NUMERIC,
	biddingDate VARCHAR(256),
	PRIMARY KEY(postID, bidder)
);

CREATE TABLE loan (
	startDate VARCHAR(128),
	endDate VARCHAR(128),
	post CHAR(13) REFERENCES post(postID) PRIMARY KEY,
	borrowerID CHAR(7) REFERENCES user(userID),
	comment VARCHAR(256),
	fee NUMERIC,
);

%% These two tables loan and post should be combined.