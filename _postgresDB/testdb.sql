CREATE TABLE "allfaculty" (
    "name" VARCHAR,
    "designation" VARCHAR,
    "edu" VARCHAR,
    "url" VARCHAR,
    "joined" VARCHAR,
    "phone" VARCHAR,
    "email" VARCHAR PRIMARY KEY,
    "research" VARCHAR,
    "iitpkdpubid" VARCHAR,
    "office" VARCHAR,
    "isIITPKDfaculty" VARCHAR,
    "isCSEfaculty" VARCHAR
);

CREATE TABLE "adjfaculty" (
    "affiliation" VARCHAR,
    "email" VARCHAR PRIMARY KEY,
    "expertise" VARCHAR
);

CREATE TABLE "announce" (
    "UniqueID" SERIAL PRIMARY KEY,
    "date" VARCHAR,
    "title" VARCHAR,
    "show" varchar,
    "description" VARCHAR,
    "notifypublic" VARCHAR,
    "link" VARCHAR
);

CREATE TABLE "awards" (
    "UniqueID" SERIAL PRIMARY KEY,
    "title" VARCHAR,
    "description" VARCHAR,
    "date" VARCHAR,
    "people" VARCHAR,
    "show" BOOLEAN
);

CREATE TABLE "btech" (
    "year" INT,
    "name" VARCHAR,
    "rollno" INT PRIMARY KEY,
    "faEmail" VARCHAR
);

CREATE TABLE "btechAlumni" (
    "year" INT,
    "name" VARCHAR,
    "rollno" INT PRIMARY KEY,
    "faEmail" VARCHAR
);

CREATE TABLE "carousels" (
    "UniqueID" SERIAL PRIMARY KEY,
    "image" VARCHAR
);

CREATE TABLE "colloquium" (
    "UniqueID" SERIAL PRIMARY KEY,
    "title" VARCHAR,
    "speaker" VARCHAR,
    "description" VARCHAR,
    "speakerbio" VARCHAR,
    "date" VARCHAR,
    "time" VARCHAR,
    "venue" VARCHAR,
    "host" VARCHAR,
    "show" BOOLEAN,
    "images" VARCHAR,
    "imagesLayout" VARCHAR
);

CREATE TABLE "currentCourses" (
    "code" VARCHAR PRIMARY KEY,
    "faculty1" varchar, 
    "faculty2" varchar,
    "slot" VARCHAR,
    "room" VARCHAR
);

CREATE TABLE "currentNPTELCourses" (
    "Code" VARCHAR PRIMARY KEY,
    "Title" VARCHAR,
    "Credits" VARCHAR,
    "Link" VARCHAR
);

-- needs email faculty
CREATE TABLE "internship" (
    "UniqueID" SERIAL PRIMARY KEY,
    "name" VARCHAR,
    "faculty" VARCHAR,
    "numpos" VARCHAR,
    "duration" VARCHAR,
    "apply" VARCHAR
);

-- needs fa email
CREATE TABLE "mcam" (
    "year" INT,
    "name" VARCHAR,
    "rollno" INT PRIMARY KEY,
    "faEmail" VARCHAR
);

CREATE TABLE "mcamAlumni" (
    "year" INT,
    "name" VARCHAR,
    "rollno" INT PRIMARY KEY
);

CREATE TABLE "msAlumni" (
    "year" INT,
    "rollno" VARCHAR PRIMARY KEY,
    "program" VARCHAR,
    "thesisTitle" VARCHAR,
    "name" VARCHAR,
    "advisor1" VARCHAR,
    "advisor2" VARCHAR,
    "doj" VARCHAR,
    "type" varchar,
    "area" VARCHAR
);

-- fa email
CREATE TABLE "msocd" (
    "year" INT,
    "name" VARCHAR,
    "rollno" INT PRIMARY KEY,
    "faEmail" VARCHAR
);

CREATE TABLE "msocdAlumni" (
    "year" INT,
    "name" VARCHAR,
    "rollno" INT PRIMARY KEY
);

CREATE TABLE "openPos" (
    "UniqueID" SERIAL PRIMARY KEY,
    "quals" VARCHAR,
    "apply" VARCHAR,
    "name" VARCHAR,
    "responsibility" VARCHAR,
    "numpos" VARCHAR,
    "faculty1" VARCHAR,
    "faculty2" VARCHAR
);

CREATE TABLE "placement" (
    "registered" INTEGER,
    "year" INTEGER,
    "prog" TEXT,
    "range" TEXT,
    "count" INTEGER
);

CREATE TABLE "courses" (
    "Code" VARCHAR PRIMARY KEY,
    "Title" VARCHAR,
    "Last Modified" VARCHAR,
    "Core" VARCHAR[],
    "CoreMSOCD" VARCHAR,
    "CoreMCAM" VARCHAR,
    "CoreUG" VARCHAR,
    "Credits" VARCHAR,
    "Category" VARCHAR,
    "Proposingfaculty" VARCHAR,
    "Proposingfaculty2" VARCHAR,
    "Proposingfaculty3" VARCHAR,
    "Proposingfaculty4" VARCHAR,
    "Curriculum" VARCHAR,
    "Senate approved on" VARCHAR,
    "Show" BOOLEAN,
    "Prerequisites" VARCHAR,
    "Status" varchar,
    "Prerevision code" varchar,
    "Dual code" varchar,
    "Revision info" varchar,
    "Faculty" varchar,
    "Remarks" varchar
);

CREATE TABLE "pastCourses" (
    "year" INT,
    "semester" VARCHAR,
    "room" VARCHAR,
    "faculty1" VARCHAR,
    "faculty2" VARCHAR,
    "faculty3" VARCHAR,
    "faculty4" VARCHAR,
    "name" VARCHAR,
    "code" VARCHAR,
    "slot" VARCHAR,
    PRIMARY KEY ("year", "code")
);

CREATE TABLE "phdAlumni" (
    "year" INT,
    "name" VARCHAR,
    "rollno" INT PRIMARY KEY,
    "doj" VARCHAR,
    "area" VARCHAR,
    "advisor1" VARCHAR,
    "advisor2" VARCHAR,
    "thesis_submitted" VARCHAR,
    "next" VARCHAR,
    "thesisTitle" VARCHAR
);

CREATE TABLE "postdoc" (
    "name" VARCHAR,
    "email" VARCHAR PRIMARY KEY,
    "research" VARCHAR,
    "host" VARCHAR,
    "url" VARCHAR
);

CREATE TABLE "projects" (
    "projID" VARCHAR PRIMARY KEY,
    "PROJECT DETAILS" VARCHAR,
    "PROJECT TYPE" VARCHAR,
    "PROJECT NUMBER" VARCHAR,
    "DURATION" VARCHAR,
    "PRINCIPAL INVESTIGATOR 1" VARCHAR,
    "PRINCIPAL INVESTIGATOR 2" VARCHAR,
    "PRINCIPAL INVESTIGATOR 3" VARCHAR,
    "PRINCIPAL INVESTIGATORS 4" VARCHAR,
    "CO-INVESTIGATORS " VARCHAR,
    "FUNDING AGENCY" VARCHAR,
    "TOTAL BUDGET" VARCHAR
);

CREATE TABLE "projectFaculty" (
    "projID" VARCHAR,
    "facEmail" VARCHAR,
    "isPrincipal" BOOLEAN,
    PRIMARY KEY ("projID", "facEmail")
);

CREATE TABLE "scholars" (
    "name" VARCHAR,
    "rollno" VARCHAR PRIMARY KEY,
    "program" VARCHAR,
    "doj" VARCHAR,
    "area" VARCHAR,
    "url" VARCHAR,
    "type" VARCHAR,
    "advisor1" VARCHAR,
    "advisor2" VARCHAR,
    "otherdepartment" VARCHAR
);

create table "seminars"(
    "people" TEXT	,
    "description"	TEXT	,
    "speaker"	TEXT,
    "show"	TEXT,
    "title"	TEXT,
    "date" TEXT
);

CREATE TABLE "MSscholarAdvisor" (
  "rollno" VARCHAR,
  "facEmail" VARCHAR,
  PRIMARY KEY ("rollno", "facEmail")
);

CREATE TABLE "staff" (
    "name" VARCHAR,
    "office" VARCHAR,
    "designation" VARCHAR,
    "email" VARCHAR PRIMARY KEY,
    "details" VARCHAR
);

CREATE TABLE "stats" (
    "year" INT PRIMARY KEY,
    "btech" INT,
    "mtech" INT,
    "ms" INT,
    "phd" INT
);

-- images list
CREATE TABLE "talks" (
    "title" VARCHAR,
    "speaker" VARCHAR,
    "description" VARCHAR,
    "speakerbio" VARCHAR,
    "date" VARCHAR,
    "time" VARCHAR,
    "venue" VARCHAR,
    "host" VARCHAR,
    "show" BOOLEAN,
    "type" VARCHAR,
    "image1" VARCHAR,
    "image2" VARCHAR,
    "image3" VARCHAR,
    PRIMARY KEY ("speaker", "venue")
);

CREATE TABLE "talkseries" (
    "UniqueID" SERIAL PRIMARY KEY,
    "show" BOOLEAN,
    "imageslayout" VARCHAR,
    "host" VARCHAR,
    "description" VARCHAR,
    "date" VARCHAR,
    "images" VARCHAR,
    "speakerbio" VARCHAR,
    "venue" VARCHAR,
    "speaker" VARCHAR,
    "title" VARCHAR
);

CREATE TABLE "workshops" (
    "UniqueID" SERIAL PRIMARY KEY,
    "date" varchar,
    "link" VARCHAR,
    "title" VARCHAR,
    "description" VARCHAR
);

ALTER TABLE "btech" ADD FOREIGN KEY ("faEmail") REFERENCES "allfaculty" ("email");

ALTER TABLE "btechAlumni" ADD FOREIGN KEY ("faEmail") REFERENCES "allfaculty" ("email");

--ALTER TABLE "cse_faculty" ADD FOREIGN KEY ("email") REFERENCES "allfaculty" ("email");

ALTER TABLE "internship" ADD FOREIGN KEY ("faculty") REFERENCES "allfaculty" ("email");

ALTER TABLE "mcam" ADD FOREIGN KEY ("faEmail") REFERENCES "allfaculty" ("email");

--ALTER TABLE "projectFaculty" ADD FOREIGN KEY ("facEmail") REFERENCES "allfaculty" ("email");

--ALTER TABLE "projectFaculty" ADD FOREIGN KEY ("projID") REFERENCES "projects" ("projID");

--ALTER TABLE "PhDscholarAdvisor" ADD FOREIGN KEY ("facEmail") REFERENCES "allfaculty" ("email");

--ALTER TABLE "PhDscholarAdvisor" ADD FOREIGN KEY ("rollno") REFERENCES "PhDscholars" ("rollno");

--ALTER TABLE "MSscholarAdvisor" ADD FOREIGN KEY ("facEmail") REFERENCES "allfaculty" ("email");

--ALTER TABLE "MSscholarAdvisor" ADD FOREIGN KEY ("rollno") REFERENCES "MSscholars" ("rollno");

ALTER TABLE "talkseries" ADD FOREIGN KEY ("host") REFERENCES "allfaculty" ("email");

ALTER TABLE "msocd" ADD FOREIGN KEY ("faEmail") REFERENCES "allfaculty" ("email");

--ALTER TABLE "currentCourses" ADD FOREIGN KEY ("code") REFERENCES "courses" ("Code");

--ALTER TABLE "pastCourses" ADD FOREIGN KEY ("code") REFERENCES "courses" ("Code");
