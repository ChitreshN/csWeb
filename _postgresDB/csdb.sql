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
  "office" VARCHAR
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
  "show" BOOLEAN,
  "description" VARCHAR,
  "notifypublic" BOOLEAN,
  "link" VARCHAR
);

CREATE TABLE "awards" (
  "UniqueID" SERIAL PRIMARY KEY,
  "title" VARCHAR,
  "description" VARCHAR,
  "date" VARCHAR,
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
  "images" VARCHAR[],
  "imagesLayout" VARCHAR
);

CREATE TABLE "currentCourses" (
  "code" VARCHAR PRIMARY KEY,
  "fac_email" VARCHAR[],
  "slot" VARCHAR,
  "room" VARCHAR
);

CREATE TABLE "currentNPTELCourses" (
  "code" VARCHAR PRIMARY KEY,
  "title" VARCHAR,
  "credits" VARCHAR,
  "link" VARCHAR
);

CREATE TABLE "cse_faculty" (
  "email" VARCHAR PRIMARY KEY
);

CREATE TABLE "internship" (
  "UniqueID" SERIAL PRIMARY KEY,
  "name" VARCHAR,
  "facEmail" VARCHAR,
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
  "name" VARCHAR,
  "rollno" VARCHAR PRIMARY KEY,
  "program" VARCHAR,
  "doj" VARCHAR,
  "area" VARCHAR,
  "advisor" VARCHAR,
  "thesisTitle" VARCHAR
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
  "UniqueID" SERIAL PRIMARY KEY,
  "name" VARCHAR,
  "faculty" VARCHAR,
  "quals" VARCHAR,
  "numpos" VARCHAR,
  "responsibility" VARCHAR,
  "apply" VARCHAR
);

CREATE TABLE "courses" (
  "code" VARCHAR PRIMARY KEY,
  "title" VARCHAR,
  "core" VARCHAR[],
  "credits" VARCHAR,
  "category" VARCHAR,
  "proposingfaculty_email" VARCHAR[],
  "curriculum" VARCHAR[],
  "prereq" VARCHAR
);

CREATE TABLE "pastCourses" (
  "year" INT,
  "semester" VARCHAR,
  "code" VARCHAR,
  "name" VARCHAR,
  "fac_email" VARCHAR,
  "slot" VARCHAR,
  "room" VARCHAR,
  PRIMARY KEY ("year", "code")
);

CREATE TABLE "phdAlumni" (
  "year" INT,
  "name" VARCHAR,
  "rollno" INT PRIMARY KEY,
  "doj" VARCHAR,
  "area" VARCHAR,
  "advisor" VARCHAR,
  "thesisTitle" VARCHAR,
  "thesis_submitted" VARCHAR,
  "next" VARCHAR
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
  "projectdetails" VARCHAR,
  "duration" VARCHAR,
  "fundingagency" VARCHAR,
  "projecttype" VARCHAR,
  "projectnumber" VARCHAR,
  "totalbudget" VARCHAR
);

CREATE TABLE "projectFaculty" (
  "projID" VARCHAR,
  "facEmail" VARCHAR,
  "isPrincipal" BOOLEAN,
  PRIMARY KEY ("projID", "facEmail")
);

CREATE TABLE "PhDscholars" (
  "name" VARCHAR,
  "rollno" VARCHAR PRIMARY KEY,
  "program" VARCHAR,
  "doj" VARCHAR,
  "area" VARCHAR,
  "url" VARCHAR,
  "type" VARCHAR,
  "otherdepartment" VARCHAR
);

CREATE TABLE "PhDscholarAdvisor" (
  "rollno" VARCHAR,
  "facEmail" VARCHAR,
  PRIMARY KEY ("rollno", "facEmail")
);

CREATE TABLE "MSscholars" (
  "name" VARCHAR,
  "rollno" VARCHAR PRIMARY KEY,
  "program" VARCHAR,
  "doj" VARCHAR,
  "area" VARCHAR,
  "url" VARCHAR,
  "type" VARCHAR,
  "otherdepartment" VARCHAR
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
  "images" VARCHAR[],
  PRIMARY KEY ("speaker", "venue")
);

CREATE TABLE "talkseries" (
  "UniqueID" SERIAL PRIMARY KEY,
  "title" VARCHAR,
  "speaker" VARCHAR,
  "speakerbio" VARCHAR,
  "description" VARCHAR,
  "date" VARCHAR,
  "venue" VARCHAR,
  "host" VARCHAR,
  "show" BOOLEAN,
  "images" VARCHAR[],
  "imagesLayout" VARCHAR
);

CREATE TABLE "workshops" (
  "UniqueID" SERIAL PRIMARY KEY,
  "date" DATE,
  "title" VARCHAR,
  "link" VARCHAR,
  "description" VARCHAR
);

ALTER TABLE "btech" ADD FOREIGN KEY ("faEmail") REFERENCES "allfaculty" ("email");

ALTER TABLE "btechAlumni" ADD FOREIGN KEY ("faEmail") REFERENCES "allfaculty" ("email");

ALTER TABLE "cse_faculty" ADD FOREIGN KEY ("email") REFERENCES "allfaculty" ("email");

ALTER TABLE "internship" ADD FOREIGN KEY ("facEmail") REFERENCES "allfaculty" ("email");

ALTER TABLE "mcam" ADD FOREIGN KEY ("fa") REFERENCES "allfaculty" ("email");

ALTER TABLE "projectFaculty" ADD FOREIGN KEY ("facEmail") REFERENCES "allfaculty" ("email");

ALTER TABLE "projectFaculty" ADD FOREIGN KEY ("projID") REFERENCES "projects" ("projID");

ALTER TABLE "PhDscholarAdvisor" ADD FOREIGN KEY ("facEmail") REFERENCES "allfaculty" ("email");

ALTER TABLE "PhDscholarAdvisor" ADD FOREIGN KEY ("rollno") REFERENCES "PhDscholars" ("rollno");

ALTER TABLE "MSscholarAdvisor" ADD FOREIGN KEY ("facEmail") REFERENCES "allfaculty" ("email");

ALTER TABLE "MSscholarAdvisor" ADD FOREIGN KEY ("rollno") REFERENCES "MSscholars" ("rollno");

ALTER TABLE "talkseries" ADD FOREIGN KEY ("host") REFERENCES "allfaculty" ("email");

ALTER TABLE "msocd" ADD FOREIGN KEY ("fa") REFERENCES "allfaculty" ("email");

ALTER TABLE "currentCourses" ADD FOREIGN KEY ("code") REFERENCES "courses" ("code");

ALTER TABLE "pastCourses" ADD FOREIGN KEY ("code") REFERENCES "courses" ("code");
