# AHM Intern
-------------

* Contact: Alan Blount <zeroasterisk@gmail.com>

### Goal: build and extend a set of scripted browser tests

Tools:

* [NightWatch](https://github.com/beatfactor/nightwatch)
* [Grunt](http://gruntjs.com/)
* [grunt-nightwatch](https://github.com/gextech/grunt-nightwatch)

Choices:

* As much as possible should be done "in the browser" finding links and
  clicking on them vs. jumping to a URL.
* No passwords will be included in this script... randomly generated passwords
  will be submitted to create a test member w/ a standardized username

### Member Basics

`/`

* sign up (invalid information: missing required fields)
* sign up (invalid information: mismatched passwords)
* sign up (invalid information: bad password "abc")
* sign up (valid information)
* logout
* forgot password (invalid email)
* forgot password (valid email)
* sign in (good user / bad pass)
* sign in (bad user / bad pass)
* sign in (bad user / good pass)
* sign in (good user / good pass)

### Membership Purchase

`/memberships/purchase/cta`

* not signed in, submit purchase
* sign in
* make a purchase w/ fake/validating credit card [get card number](http://www.getcreditcardnumbers.com/)
* view profile and ensure membership information is there

### Event Serach

* specifications coming

### Event Register

* sign in (as member w/ CTA)
* "Continuing Education" > "text"
* "Register"
* @"Pending"
 * "Start Course"
* @"Viewing Course"
 * verify URL pattern `/\/E/[0-9]+/[0-9]+/[a-f0-9]+/`
 * "Back to Pending Courses" (bottom)
* @"Pending"
 * "Take Exam"
* @"Verify Info"
 * "Continue" (should fail, requiring inputs)
 * "yes" for radio for reporting
 * "11111111" for input
 * "yes" for radio for authorize
 * "Continue"
* @"Course Examination"
 * fill in answers

### Job Browse / Serach

* specifications coming

### Job Apply

* apply as anon
* apply as logged in member


