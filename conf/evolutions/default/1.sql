# --- Created by Slick DDL
# To stop Slick DDL generation, remove this comment and start using Evolutions

# --- !Ups

create table "TASKS" ("id" BIGINT GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,"label" VARCHAR NOT NULL);
create table "AUTHORS" ("paperid" INTEGER NOT NULL,"position" INTEGER NOT NULL,"firstname" VARCHAR NOT NULL,"lastname" VARCHAR NOT NULL,"organization" VARCHAR NOT NULL,"positiontitle" VARCHAR NOT NULL,"email" VARCHAR NOT NULL);
alter table "AUTHORS" add constraint "authors_pk" primary key("paperid","position");
create table "MEMBERS" ("id" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,"email" VARCHAR NOT NULL,"firstlogindate" TIMESTAMP NOT NULL,"lastlogindate" TIMESTAMP NOT NULL,"role" INTEGER NOT NULL,"firstname" VARCHAR NOT NULL,"lastname" VARCHAR NOT NULL,"organization" VARCHAR,"positiontitle" VARCHAR);
create table "PAPERS" ("id" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,"contactemail" VARCHAR NOT NULL,"submissiondate" TIMESTAMP NOT NULL,"lastupdate" TIMESTAMP NOT NULL,"accepted" BOOLEAN,"title" VARCHAR NOT NULL,"format" INTEGER NOT NULL,"student" BOOLEAN NOT NULL,"keywords" VARCHAR NOT NULL,"abstrct" VARCHAR NOT NULL,"data" BLOB);
create table "TOPICS" ("id" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,"name" VARCHAR NOT NULL,"description" VARCHAR);
create table "COMMENTS" ("id" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,"paperid" INTEGER NOT NULL,"memberid" INTEGER NOT NULL,"submissiondate" TIMESTAMP NOT NULL,"lastupdate" TIMESTAMP NOT NULL,"content" VARCHAR NOT NULL);
create table "MEMBER_BIDS" ("paperid" INTEGER NOT NULL,"memberid" INTEGER NOT NULL,"bid" INTEGER NOT NULL);
alter table "MEMBER_BIDS" add constraint "memberbids_pk" primary key("paperid","memberid");
create table "MEMBER_TOPICS" ("memberid" INTEGER NOT NULL,"topicid" INTEGER NOT NULL);
alter table "MEMBER_TOPICS" add constraint "membertopics_pk" primary key("memberid","topicid");
create table "PAPER_TOPICS" ("paperid" INTEGER NOT NULL,"topicid" INTEGER NOT NULL);
alter table "PAPER_TOPICS" add constraint "papertopics_pk" primary key("paperid","topicid");
create table "REVIEWS" ("paperid" INTEGER NOT NULL,"memberid" INTEGER NOT NULL,"submissiondate" TIMESTAMP,"lastupdate" TIMESTAMP,"confidence" INTEGER NOT NULL,"evaluation" INTEGER NOT NULL,"content" text NOT NULL);
alter table "REVIEWS" add constraint "members_pk" primary key("paperid","memberid");
create table "SECURE_SOCIAL_TOKENS" ("uuid" VARCHAR NOT NULL PRIMARY KEY,"email" VARCHAR NOT NULL,"creationtime" TIMESTAMP NOT NULL,"expirationtime" TIMESTAMP NOT NULL,"issignup" BOOLEAN NOT NULL);
create table "SECURE_SOCIAL_USERS" ("uid" VARCHAR NOT NULL,"pid" VARCHAR NOT NULL,"email" VARCHAR NOT NULL,"firstname" VARCHAR NOT NULL,"lastname" VARCHAR NOT NULL,"avatarurl" VARCHAR,"authmethod" VARCHAR NOT NULL,"hasher" VARCHAR,"password" VARCHAR,"salt" VARCHAR);
alter table "SECURE_SOCIAL_USERS" add constraint "securesocialusers_pk" primary key("uid","pid");
create table "LOGS" ("id" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,"date" TIMESTAMP NOT NULL,"entry" VARCHAR NOT NULL);
create table "SENTMAILS" ("id" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,"sent" TIMESTAMP NOT NULL,"to" VARCHAR NOT NULL,"subject" VARCHAR NOT NULL,"body" VARCHAR NOT NULL);
create table "SETTINGS" ("name" VARCHAR NOT NULL PRIMARY KEY,"value" VARCHAR NOT NULL);
create table "TEMPLATES" ("id" INTEGER GENERATED BY DEFAULT AS IDENTITY(START WITH 1) NOT NULL PRIMARY KEY,"name" VARCHAR NOT NULL,"subject" VARCHAR NOT NULL,"body" VARCHAR NOT NULL);
alter table "AUTHORS" add constraint "authors_paperid_fk" foreign key("paperid") references "PAPERS"("id") on update NO ACTION on delete NO ACTION;
alter table "COMMENTS" add constraint "comments_paperid_fk" foreign key("paperid") references "PAPERS"("id") on update NO ACTION on delete NO ACTION;
alter table "COMMENTS" add constraint "comments_memberid_fk" foreign key("memberid") references "MEMBERS"("id") on update NO ACTION on delete NO ACTION;
alter table "MEMBER_BIDS" add constraint "memberbids_paperid_fk" foreign key("paperid") references "PAPERS"("id") on update NO ACTION on delete NO ACTION;
alter table "MEMBER_BIDS" add constraint "memberbids_memberid_fk" foreign key("memberid") references "MEMBERS"("id") on update NO ACTION on delete NO ACTION;
alter table "MEMBER_TOPICS" add constraint "membertopics_topic_fk" foreign key("topicid") references "TOPICS"("id") on update NO ACTION on delete NO ACTION;
alter table "MEMBER_TOPICS" add constraint "membertopics_memberid_fk" foreign key("memberid") references "MEMBERS"("id") on update NO ACTION on delete NO ACTION;
alter table "PAPER_TOPICS" add constraint "papertopics_paperid_fk" foreign key("paperid") references "PAPERS"("id") on update NO ACTION on delete NO ACTION;
alter table "PAPER_TOPICS" add constraint "papertopics_topicid_fk" foreign key("topicid") references "TOPICS"("id") on update NO ACTION on delete NO ACTION;
alter table "REVIEWS" add constraint "members_paperid_fk" foreign key("paperid") references "PAPERS"("id") on update NO ACTION on delete NO ACTION;
alter table "REVIEWS" add constraint "members_memberid_fk" foreign key("memberid") references "MEMBERS"("id") on update NO ACTION on delete NO ACTION;

# --- !Downs

alter table "AUTHORS" drop constraint "authors_paperid_fk";
alter table "COMMENTS" drop constraint "comments_paperid_fk";
alter table "COMMENTS" drop constraint "comments_memberid_fk";
alter table "MEMBER_BIDS" drop constraint "memberbids_paperid_fk";
alter table "MEMBER_BIDS" drop constraint "memberbids_memberid_fk";
alter table "MEMBER_TOPICS" drop constraint "membertopics_topic_fk";
alter table "MEMBER_TOPICS" drop constraint "membertopics_memberid_fk";
alter table "PAPER_TOPICS" drop constraint "papertopics_paperid_fk";
alter table "PAPER_TOPICS" drop constraint "papertopics_topicid_fk";
alter table "REVIEWS" drop constraint "members_paperid_fk";
alter table "REVIEWS" drop constraint "members_memberid_fk";
drop table "TASKS";
alter table "AUTHORS" drop constraint "authors_pk";
drop table "AUTHORS";
drop table "MEMBERS";
drop table "PAPERS";
drop table "TOPICS";
drop table "COMMENTS";
alter table "MEMBER_BIDS" drop constraint "memberbids_pk";
drop table "MEMBER_BIDS";
alter table "MEMBER_TOPICS" drop constraint "membertopics_pk";
drop table "MEMBER_TOPICS";
alter table "PAPER_TOPICS" drop constraint "papertopics_pk";
drop table "PAPER_TOPICS";
alter table "REVIEWS" drop constraint "members_pk";
drop table "REVIEWS";
drop table "SECURE_SOCIAL_TOKENS";
alter table "SECURE_SOCIAL_USERS" drop constraint "securesocialusers_pk";
drop table "SECURE_SOCIAL_USERS";
drop table "LOGS";
drop table "SENTMAILS";
drop table "SETTINGS";
drop table "TEMPLATES";

