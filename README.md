# Marketplace Site (T2A2)

**Author:** Geoff Reid&nbsp;&nbsp;&nbsp;&nbsp; **Date:** 20 March 2022&nbsp;&nbsp;&nbsp;&nbsp; **GitHub repository:** <a href="https://github.com/LetTheWookieWin92/WhatNow">View</a>&nbsp;&nbsp;&nbsp;&nbsp; **Deployment:** <a href="https://what-now-tickets.herokuapp.com/ ">View</a>

## Description of the Project and Problem Definition

WhatNow is intended to be a two-sided event ticketing marketplace. The platform allows users to both organise their own events and join events created by other users.

A number of online solutions already exist within the event sector, such as Eventbrite, Viagogo and Ticketmaster. Ticketmaster offers a highly visual homepage, with the intention of drawing user’s attention to a select number of featured events using large banner images and animations. Viagogo contains only concert, sports, theatre and festival events, with minimal filters on the home page. Eventbrite displays events from a full range of categories, which can be filtered on the home page.

The proposed event ticketing application would set itself apart from existing solutions by introducing advanced recommendation features based upon how users felt about previous events, what their current interests are and a range of other user metrics. The application would be designed to offer a unique experience catered to each user, which reduces the time the user needs to spend locating events that are both relevant to them and highly likely to interest them. Furthermore, in contrast to some existing solutions, the proposed application would provide the user with a range of tools to assist them to locate events that haven’t already been recommended by the application’s algorithm.

The core problem the application aims to solve is the length of time a user needs to spend searching for an event they are interested in. The application will allow events from every category and provide users with the means to quickly find events that are relevant to them. This eliminates the need for them to visit a range of websites, and allows them to store all of their event plans in one place.

<br><br>

## Functionality and features

Using the application, users can:

- Browse events (with or without registering an account)
- Create an account to store all of their events
- Organise events for other users to join
- View the attendees of their events
- Join events that have been organised by other users
- Access a list of all of their organised and attending events
- Reset their password
- Edit events after they have been posted
- Cancel events after they have been posted (this will automatically remove all of the attendees and will be reflected on their profile pages)

The target audiences for this application are event participants and event organisers.
The application has been developed using the following tech stack:

- HTML
- CSS
- Ruby on Rails
- Heroku (deployment)
- GitHub (source control)
- Postgresql (database)
- Amazon Web Service S3 (online image storage, bucket)

<br>

## Site map

![Sitemap](app\assets\images\sitemap.png)

<br>

## Screenshots

<img src="app\assets\images\Home.png" alt="Home" width="600"/>
<img src="app\assets\images\Account.png" alt="Account" width="600"/>
<img src="app\assets\images\Event detail.png" alt="Event detail" width="600"/>
<img src="app\assets\images\Forgot password.png" alt="Forgot password" width="600"/>
<img src="app\assets\images\Organise event.png" alt="Organise event" width="600"/>
<img src="app\assets\images\Profile.png" alt="Profile" width="600"/>
<img src="app\assets\images\Sign in.png" alt="Sign in" width="600"/>
<img src="app\assets\images\Sign up.png" alt="Sign up" width="600"/>

<br>

## User stories

The user stories developed here include the main target audiences of the application; event organisers and participants. Organisers refer to users who mainly aim to create events for other users to see and participants refer to users who mainly aim to search for and join events.

As an <b>event organiser</b>:

- I want to create an account, so that my details are stored and my actions are tied to my account.
- I want to be able to amend my account details at any time.
- I want to be able to market my event to attract our target audience and enable users to obtain information and purchase tickets on a simple interface.
- I want to be able to view the users who have registered for my events.
- I want to be able to upload images of my upcoming event to assist with marketing.
- I want to be able to make changes or cancel my events, if needed.
- I want my event to appear amongst similar events, so that it is more easily found.
- I want to be able to organise and manage multiple events simultaneously.
- I want to be able to contact event participants to provide updates and ticketing information.
- I want to be able to cancel my account at any time, if needed, and for my information to be deleted.

As an <b>event participant</b>:

- I want to create an account, so that my details are stored and my actions are tied to my account.
- I want to be able to amend my account details at any time.
- I want to be able to explore events that may interest me, with tools to allow me to narrow down possible events by topic or category.
- I want to see relevant details about an event.
- I want to be able to register for events, to secure my place.
- I want to be able to deregister from events, if I can’t make it.
- I want to be able to access a list of events that I have registered for.
- I want to be able to provide feedback for the events I attend, so organisers can know how to improve.
- I want to be recommended events based on my interests and past event feedback.
- I want to be able to cancel my account at any time, if needed, and for my information to be deleted.

<br>

## Wireframes

<img src="app\assets\images\WF - Account.PNG" alt="Account" width="600"/>
<img src="app\assets\images\WF - Event detail.PNG" alt="Event detail" width="600"/>
<img src="app\assets\images\WF - Home.PNG" alt="Home" width="600"/>
<img src="app\assets\images\WF - Organise event.PNG" alt="Organise event" width="600"/>
<img src="app\assets\images\WF - Profile.PNG" alt="Profile" width="600"/>
<img src="app\assets\images\WF - Sign in.PNG" alt="Sign in" width="600"/>
<img src="app\assets\images\WF - Sign up.PNG" alt="Sign up" width="600"/>

<br>

## ERD

<img src="app\assets\images\ERD.png" alt="ERD" width="600"/>

<br>

## High-level components (abstractions)

The application is comprised of 3 models; User, Event and Attendee. The application models have been normalised to preserve integrity, efficiency and security, and avoid potential errors.

- User – The purpose of this model is to store all of the relevant information about each user, and to serve as a parent for every event or attendee. In line with current legislation, the user model purposefully contains only the necessary personal information for the service to operate. Examples of personal information that is not included in the model include home address or phone number, neither are needed as the application is an entirely digital service, which provides everything the user needs through the online interface. The user model is generated by Devise, a purpose-built authentication gem, which protects passwords and provides a framework for implementing user sessions.

- Event - The purpose of this model is to store all of the relevant information about each event. When an event is created, it is created as a dependent of the organising User, and so if the user cancels their account, their events and all of their attendees will also be removed. As per the ERD above, one user can optionally organise many events. Events can be viewed by users who are logged in or are not logged in. Organisers are able to add an image for an event, which linked to the event model but utilises a dedicated Amazon Web Services S3 bucket for online storage, which avoids the image being stored in the application itself.

- Attendee – The purpose of this model is to store all of the registrations for a given event. When a user registers for an event, an row is created in the Attendee model linking a User to that Event. Utilising a dedicated model for this purpose is more suitable than storing it separately on the User and Event models, as this would mean the data is in two places and errors could occur, such as it being removed from one model but not the other. An attendee is a dependent of an event and a user, for any user can register for many events and every event can have many attendees.

<br>

## Third party services

The following third-party services have been implemented in the WhatNow application:

- <a href="https://github.com/">GitHub</a> – an online repository used for source control and collaboration on software projects.
- <a href="https://aws.amazon.com/">Amazon Web Services</a> S3 – an efficient cloud-based storage solution built for scalability. This was used to store images for events, to be called upon when needed by the application.
- <a href="https://dashboard.heroku.com/">Heroku</a> – a cloud platform that enables users to host their application on a live URL, which they can push changes to using source control.
- <a href="https://github.com/heartcombo/devise">Devise</a> – a flexible MVC authentication solution used to provide a framework for user accounts and sessions.
- <a href="https://trello.com/">Trello</a> – an online project/task management service, used to plan and track project progress.

<br>

## Models and associations

<b>User model</b>

The user model was implemented using Devise, and configured to:

- Allow users to register accounts (registerable)
- Recover forgotten passwords (recoverable)
- Enable browsers to remember a user using a saved cookie (rememberable)
- Validate new or updated user attributes (validatable)
- Set a time out for user sessions (timeoutable)

A single user can both organise and attend events, and so the user model has an optional ‘has many’ relationship with both organised events and attendees. If a user cancels their account, it also destroys any event attendances on the database and any organised events.

<img src="app\assets\images\User_Model.png" alt="User model" width="600"/>

<br>

<b>Event model</b>

The event model dictates that each event belongs to a user (the organiser of the event). Each event can have many attendees, and in the event an event is cancelled, all attendees linked to the event will also be removed. Each event has an image associated with it through AWS S3.

<img src="app\assets\images\Event_Model.png" alt="Event model" width="600"/>

<br>

<b>Attendee model</b>

The attendee model is a simple way to link a user to and event and vice versa. An attendee belongs to both a specific user and event.

<img src="app\assets\images\Attendee_Model.png" alt="Attendee model" width="300"/>

<br>

## Database relations and schema

The database relations and schema are illustrated in the diagram below. As described previously, each user can organise many events and each event can have many users in attendance. The userID is stored on each Event as a foreign key named organiserID and the eventID is stored on each Attendee as a foreign key called eventID as well as the userID foreign key linking the user to the event they are attending.

In terms of the relations:

- The User model has a one to optionally many Attendees (events they are attending) relationship and a one to optionally many Events they have organised. The User model is a parent to both organised Events and event Attendees, and upon deletion it will cause a cascade deletion of organised events and event attendances.

- The Event model has a one to optionally many Attendees relationship and deleting an event will cause a cascade deletion of any event Attendees.

- The Attendee model belongs to both a single user and a single event. If a user deregisters from an event, it will not cause any cascade deletions of users or events (as one would expect).

<img src="app\assets\images\ERD - with relations.png" alt="ERD relations" width="600"/>

## Project task management

The entire project was planned and tracked using Trello (<a href="https://trello.com/invite/b/PVJzbBMc/568c814f4cc98c3bbf8e5126794c69c6/marketplace-site-t2a2">see board</a>). Each task was categorised based on the kind of task and crucial tasks were marked as priority (see below).

<img src="app\assets\images\20220303.png" alt="1" width="600"/>
<img src="app\assets\images\20220308.png" alt="2" width="600"/>
<img src="app\assets\images\20220310 (1).png" alt="3" width="600"/>
<img src="app\assets\images\20220310 (2).png" alt="4" width="600"/>
<img src="app\assets\images\20220310 (3).png" alt="5" width="600"/>
<img src="app\assets\images\20220310 (4).png" alt="6" width="600"/>
<img src="app\assets\images\20220311.png" alt="7" width="600"/>
<img src="app\assets\images\20220313.png" alt="8" width="600"/>
<img src="app\assets\images\20220318.png" alt="9" width="600"/>
<img src="app\assets\images\20220319.png" alt="10" width="600"/>
<img src="app\assets\images\20220320.png" alt="11" width="600"/>
