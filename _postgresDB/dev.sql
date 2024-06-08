CREATE TABLE "all_faculty" (
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
    "uid" SERIAL PRIMARY KEY,
    "date" VARCHAR,
    "title" VARCHAR,
    "show" BOOLEAN,
    "description" VARCHAR,
    "notifypublic" BOOLEAN,
    "link" VARCHAR
);

CREATE TABLE "awards" (
    "uid" SERIAL PRIMARY KEY,
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
    "fa" VARCHAR
);

CREATE TABLE "btechAlumni" (
    "year" INT,
    "name" VARCHAR,
    "rollno" INT PRIMARY KEY,
    "fa" VARCHAR
);

CREATE TABLE "carousels" (
    "UniqueID" SERIAL PRIMARY KEY,
    "image" VARCHAR
);

CREATE TABLE "colloquium" (
    "uid" SERIAL PRIMARY KEY,
    "title" VARCHAR,
    "speaker" VARCHAR,
    "description" VARCHAR,
    "speakerbio" VARCHAR,
    "date" VARCHAR,
    "time" VARCHAR,
    "venue" VARCHAR,
    "host" VARCHAR,
    "show" BOOLEAN,
    "images" VARCHAR[],
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

CREATE TABLE "internship" (
    "uid" SERIAL PRIMARY KEY,
    "name" VARCHAR,
    "faculty" VARCHAR,
    "numpos" VARCHAR,
    "duration" VARCHAR,
    "apply" VARCHAR
);

CREATE TABLE "mcam" (
    "year" INT,
    "name" VARCHAR,
    "rollno" INT PRIMARY KEY,
    "fa" VARCHAR
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

CREATE TABLE "msocd" (
    "year" INT,
    "name" VARCHAR,
    "rollno" INT PRIMARY KEY,
    "fa" VARCHAR
);

CREATE TABLE "msocdAlumni" (
    "year" INT,
    "name" VARCHAR,
    "rollno" INT PRIMARY KEY
);

CREATE TABLE "openPos" (
    "uid" SERIAL PRIMARY KEY,
    "quals" VARCHAR,
    "apply" VARCHAR,
    "name" VARCHAR,
    "responsibility" VARCHAR,
    "numpos" VARCHAR,
    "faculty1" VARCHAR,
    "faculty2" VARCHAR
);

CREATE TABLE "courses" (
    "Code" VARCHAR PRIMARY KEY,
    "Title" VARCHAR,
    "Last Modified" DATE,
    "Core" VARCHAR[],
    "CoreMSOCD" VARCHAR,
    "CoreMCAM" VARCHAR,
    "CoreUG" VARCHAR,
    "Credits" VARCHAR,
    "Category" VARCHAR,
    "Proposingfaculty" VARCHAR,
    "Proposingfaculty2" VARCHAR,
    "Proposingfaculty3" VARCHAR,
    "Curriculum" VARCHAR[],
    "Senate approved on" INTEGER,
    "Show" BOOLEAN,
    "Prerequisites" VARCHAR,
    "Status" varchar,
    "Prerevision code" varchar,
    "Dual code" varchar,
    "Revision info" varchar,
    "Faculty" varchar
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
    "Project Details" VARCHAR,
    "Project Type" VARCHAR,
    "Project Pumber" VARCHAR,
    "Duration" VARCHAR,
    "Principal Investigator 1" VARCHAR,
    "Principal Investigator 2" VARCHAR,
    "Principal Investigator 3" VARCHAR,
    "Funding Agency" VARCHAR,
    "Total Budget" VARCHAR
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
    "uid" SERIAL PRIMARY KEY,
    "show" BOOLEAN,
    "imageslayout" VARCHAR,
    "host" VARCHAR,
    "description" VARCHAR,
    "date" VARCHAR,
    "images" VARCHAR[],
    "speakerbio" VARCHAR,
    "venue" VARCHAR,
    "speaker" VARCHAR,
    "title" VARCHAR
);

CREATE TABLE "workshops" (
    "uid" SERIAL PRIMARY KEY,
    "date" DATE,
    "link" VARCHAR,
    "title" VARCHAR,
    "description" VARCHAR
);

