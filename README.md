# Roomies

### Table of Contents
- [Roomies](#roomies)
  - [Overview](#overview)
  - [Front End Production](#front-end-production)
  - [Versions](#versions)
  - [Setup](#setup)
  - [API Endpoint Examples](#api-endpoint-examples)
  - [Technologies](#technologies)
  - [Future Iterations](#future-iterations)
  - [Credits](#credits)
      - [Authors](#authors)
      - [Project Managers](#project-managers)

## Overview

Roomies is an app designed to connect people looking for roommates in any city based on specifications such as age, gender, budget, etc. Roomies Backend specifically creates several APIs to be used by the frontend, including the signed-in user's info, as well as that user's favorited roommates, and all users for a specific search query. 

- Project Spec [LINK](https://mod4.turing.edu/projects/capstone/)

## Front End Production

- [Roomies website](https://turing-roomies.herokuapp.com/)
- [Roomies FE Repo](https://github.com/Turing-Roomies/roomies-fe)



## Versions

- Rails 5.2.5
- Ruby 2.5.3
- Bundler 2.1.4

## Setup

Run through the standard Rails setup.

```$ bundle install```

```$ rake db:{create,migrate}```

```$ rails s```

Navigate to http://localhost:3000

## API Endpoint Examples

#### CREATING A ROOMIE REQUEST

Endpoint: https://turing-roomies-be.herokuapp.com/api/v1/roomie_requests
Verb: POST

```
Body: {
         "requestor_id": 5,
         "receiver_id": 9,
         "status": "pending"
      }
```
      
- The status will be removed soon (unless we want to keep it for developer empathy / clarity) just want the endpoint up and running

#### ACCEPTING A ROOMIE REQUEST

Endpoint: https://turing-roomies-be.herokuapp.com/api/v1/roomies
Verb: POST

```
Body : {
         "roomie_a_id": 5,
         "roomie_b_id": 14
       }
```

#### DECLINING A ROOMIE REQUEST

Endpoint: https://turing-roomies-be.herokuapp.com/api/v1/roomie_requests
Verb: DELETE

```
Body: {
         "requestor_id": 5,
         "receiver_id": 9,
         "status": "declined"
      }
```

- The status will be removed soon (unless we want to keep it for developer empathy / clarity) just want the endpoint up and running

#### POSTMAN COLLECTION

- https://www.getpostman.com/collections/da6e78b4ac7493445640

## Technologies

- Framework: Ruby on Rails
- Testing: RSpec
- Response Caching: VCR & Webmock
- Test Coverage: SimpleCov
- Docker
- CI: TravisCI

## Future Iterations

- Add a messenger platform so potentials roomies can message each other through the app
- Allow roomies to cancel a roomie request
- Add a profile view to display additional information when a roomie's card is clicked
- Gather more information about each roomies, like hobbies, budget, job, and more

## Credits

#### Authors
<table>
  <tr>
    <td>Andrew Carlin <a href="https://github.com/AndieDrew">GH <a href="https://www.linkedin.com/in/andrewrcarlin/"><img src="https://img.shields.io/badge/-0e76a8?style=flat-square&logo=Linkedin&logoColor=white"></a></td>
    <td>Michann Stoner <a href="https://github.com/michannstoner">GH <a href="https://www.linkedin.com/in/michann-stoner/"><img src="https://img.shields.io/badge/-0e76a8?style=flat-square&logo=Linkedin&logoColor=white"></a></td>
    <td>Sarah Lane <a href="https://github.com/sarahlane8">GH <a href="https://www.linkedin.com/in/sarahlane8/"><img src="https://img.shields.io/badge/-0e76a8?style=flat-square&logo=Linkedin&logoColor=white"></a></td>
  </tr>
  <td>
     <img src="https://avatars.githubusercontent.com/u/27929330?v=4" alt="Andrew's' GH img"
     width="150" height="auto" />
  </td>  
  <td>
    <img src="https://avatars.githubusercontent.com/u/76269802?v=4" alt="Michann"
    width="150" height="auto" />
  </td>
  <td>
    <img width="150" height="auto" src="https://user-images.githubusercontent.com/70901622/120944450-cafe1800-c6f1-11eb-96f2-5e18fdb2a96e.png" alt="Sarah's GH img">
  </td>
</table>
<table>
  <tr>
    <td>Dustin Harbaugh <a href="https://github.com/Thee-Dust">GH <a href="https://www.linkedin.com/in/dustin-harbaugh/"><img src="https://img.shields.io/badge/-0e76a8?style=flat-square&logo=Linkedin&logoColor=white"></a></td>
    <td>Wyatt Wicks <a href="https://github.com/Wyattwicks">GH <a href="https://www.linkedin.com/in/wyattwicks/"><img src="https://img.shields.io/badge/-0e76a8?style=flat-square&logo=Linkedin&logoColor=white"></a></td>
    <td>Harrison Blake <a href="https://github.com/harrison-blake">GH <a href="https://www.linkedin.com/in/harrison-blake-802094200/"><img src="https://img.shields.io/badge/-0e76a8?style=flat-square&logo=Linkedin&logoColor=white"></a></td>
  </tr>
  <td>
     <img src="https://avatars.githubusercontent.com/u/75390410?v=4" alt="Dustin's GH img"
  width="150" height="auto" />
  </td>  
  <td>
    <img src="https://avatars.githubusercontent.com/u/74991865?v=4" alt="Wyatt's GH img"
    width="150" height="auto" />
  </td>
  <td>
    <img width="150" height="auto" src="https://avatars.githubusercontent.com/u/72946334?v=4" alt="Harrison's GH img">
  </td>
</table>

#### Project Managers
<table>
  <tr>
    <td> Travis <a href="https://github.com/Kalikoze">GH</td>
    <td> Dione <a href="https://github.com/dionew1r">GH</td>
  </tr>
  <td>
    <img src="https://avatars.githubusercontent.com/u/25714149?v=4" alt="Travis's GH img"
 width="150" height="auto" />
 </td>
  <td>
    <img src="https://avatars.githubusercontent.com/u/22304676?v=4" alt="Dione's GH img"
 width="150" height="auto" />
 </td>
</table>

**************************************************************************
This project was created for [Turing School of Software and Design](https://turing.io/)
