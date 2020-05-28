---
title: "Petfinder API Client"
header:
  image: images/post-5.jpg
  teaser: images/post-5.jpg
excerpt: Access Data in R from Petfinder
---

## petfindeR

The petfindeR API client (Application Programming Interface) allows you to access the Petfinder database of hundreds of thousands of pets ready for adoption and over ten thousand animal welfare organizations. 

With the PetfindeR, you can:

* Search for and display pet listings based on pet characteristics, location, and status.
* Search for and display animal welfare organizations based on organization name, ID, and location.

An many other field! Look at the documentation to explore supported parameters.

## Installation and Setup
Install the latest version from github as follows.

```r
devtools::install_github('JoseAndresMontes/petfindeR')
```

Each subscriber to the Petfinder API is uniquely identified by an Key and Key Secret, and every request to the API requires a token that can only be accessed by providing both of these credentials. After loading the `petfindeR` package, you should set your Key and Key Secret in your environment as shown below. This facilitates API calls without needing to specify your credentials after first setup.

```r
library(petfindeR)
R.home(component = "home")
usethis::edit_r_environ()
```

Then set your Key and Secret Key exactly like this
```r
PETFINDER_APP_KEY = x #Key Sequence
PETFINDER_APP_SECRET = y #Key Secret Sequence
```
Click [here](https://www.petfinder.com/developers/) to register with Petfinder and receive your credentials.
 
## Basic Usage
petfindeR provides easy to use function for the API service, with API parameters as function arguments. GetAnimals function gathers all available data. Available parameters are documented in the package.

For example:

```r
data <- GetAnimals()

> data
         id organization_id type species      breeds.primary breeds.secondary
1  48079622           AL122  Cat     Cat Domestic Short Hair             <NA>
2  48079562           OH330  Dog     Dog   Italian Greyhound             <NA>
3  48079609            KY16  Cat     Cat Domestic Short Hair            Tabby
4  48079617            DC20  Cat     Cat Domestic Short Hair             <NA>
5  48079618            DC20  Cat     Cat Domestic Short Hair             <NA>
6  48079620            DC20  Cat     Cat Domestic Short Hair             <NA>
7  48079616            DC20  Cat     Cat Domestic Short Hair             <NA>
8  48079619            DC20  Cat     Cat Domestic Short Hair             <NA>
9  48079610            CA59  Dog     Dog      Boston Terrier             <NA>
10 48079611            CA59  Dog     Dog      Boston Terrier             <NA>
11 48079612            CA59  Dog     Dog      Boston Terrier             <NA>
12 48079613            CA59  Dog     Dog      Boston Terrier             <NA>
13 48079601            KY16  Cat     Cat Domestic Short Hair            Tabby
14 48079283            KY33  Cat     Cat Domestic Short Hair             <NA>
15 48079604            SK11  Cat     Cat Domestic Short Hair             <NA>
16 48079603            NM59  Cat     Cat  Domestic Long Hair             <NA>
17 48079602           WA650  Dog     Dog  Labrador Retriever             <NA>
18 48079600          FL1500  Dog     Dog           Shiba Inu          Basenji
19 48079599           TN132  Dog     Dog           Dachshund        Chihuahua
20 48079598           CA605  Cat     Cat Domestic Short Hair             <NA>
```
The example dropped the url feature for more accessible viewing. Also, the breed column shows how nested data.frames are handled using the period (.) as the syntax delimitation.

## Special Mention
Shoutout to Angela Zheng, the most gorgeous and beautiful girl in the world for inspiring every day and suggesting taking this project on!

Be sure to check out the [API documentation](https://www.petfinder.com/developers/v2/docs/) to learn more about the API. 
