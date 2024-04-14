
# ProjectNuggets
# WomenSecurityApp
 Description:
This App Is A Comprehensive Platform Designed To Address The Safety And Security Concerns Of Women. It Offers A Range Of Features Including Incident Tracking, User Registration, Authentication, Profile Management, Safety Tips, Complaint Registration,Admin Page And More


## Pages and Functionalities

### Home Page:
- **Emergency Button**: Allows users to make direct calls to the nearest police station in emergencies.
- **Latest Women's Incidents in India**: Displays recent incidents involving women in India.
- **Navigation Bar**: Includes options to navigate to the Sign Up, Sign In.

### Sign Up Page:
- **Email Confirmation Authentication**:
Before Users Can Register, The System Verifies Their Email Address By Sending An OTP (One-Time Password). Upon Successful Verification, Users Can Proceed With The Registration Process, Which Includes Providing Detailed Information Such As Username, Email, Aadhar Card Number, And Contact Details. The Registration Process Also Involves Real-Time Validation And Confirmation Emails.
- **Form Fields**: Users can fill in details such as Full Name, Email Address, Contact Number, etc., to create an account.
- **Validation**: Ensure all required fields are filled correctly, with format validation for email addresses and phone numbers.
  -**AJAX Validation**:
Contact Number: Utilize AJAX To Check If The Provided Contact Number Already Exists In The Database.
Aadhaar Card Number: Use AJAX To Verify Whether The Entered Aadhaar Card Number Is Already Registered.

### Sign In Page:

- **Form Fields**: Registered Users Can Securely Sign In Using Their Email And Password. Forgot Password Functionality Is Available With Email Verification And Password Reset.

### Profile Page:
- **Navigation Bar**: Includes two buttons for safety and complaint reporting.
- **User Profile**: Displayed on the right side,  user image.
- **User Options**: When clicking on the user's name, options are provided to edit profile,change password,delete the user's account, along with the option to logout.
    
### Edit profile Button: Allows the user to open the update page:
- **Navigation Bar**: Includes a Home button that redirects to the main profile page.
- **Update Form**: Allows the user to modify their personal information.
- **Save Changes Button**: Enables the user to save the updated information.
- **Options**: Allow the user to navigate back to the main profile page or perform other actions.
### Change password: 
Users Can Change Their Password By Providing Their Old Password Along With A New Password And Confirming The New Password.
- **Password Validation**:
The New Password Must Be Different From The Old Password.
The New Password And Confirmed Password Must Match.

  ### Delete Account Button:
- Deletes the user's account. After deletion, the main index page will open.
- ### Logout Button:
-  Logs the user out from their profile and redirects them to the main page.

### Safety Tips Page:
- **Navigation Bar**: Includes a Home button that redirects to the main profile page.
- **Options**: Allow the user to navigate back to the main profile page or perform other actions.
- **Information**: Provides guidance on protecting women in critical situations, including safety measures and precautions.

### Complaint Reporting Page:
- **Navigation Bar**: Includes a Home button that redirects to the main profile page.
- **History**: Users can view their complaint history, including previously reported incidents.
- **Options**: Allow the user to navigate back to the main profile page or perform other actions.
- **Form Fields**: Users can report incidents by providing details such as Type of Incident, Date and Time, Location, and Description.
- Additionally, Users Are Provided With The Option To Download A PDF Copy Of Their Registered Complaint For Reference.
### Admin Page:
-The Admin Page Offers Comprehensive Management Functionalities For User Details And Complaint Records, With Authentication Via Email Verification, OTP, And Password.
- **User Management**: Admins Can Oversee And Edit User Details In A Tabular Format, Enabling Efficient Updates As Needed.
- **Complaint History**: Access A Detailed List Of All Registered Complaints, Including Incident Details And Timestamps.
- **Complaint Status Editing:** Modify Complaint Statuses To Reflect The Current Resolution Stage.
- **Complaint Copy Download** :Download PDF Copies Of Registered Complaints For Reference Or Further Action


## How to Run
To run the WomenSecurityApp project:
1. Clone this repository.
2. Set up the necessary environment and dependencies.
3. Run the project locally using a web server.

## Technologies Used
- Frontend: HTML, CSS, JavaScript
- Backend:  Java ,Java Servlets ,JPA
- Database:  MySQL.
- Security: Passwords Are Encrypted Using Advanced Techniques, With Spring Security Employed For Authentication And Authorization
- Email Integration:Java Mail Sender Techniques Are Utilized For Email Notifications And Password Reset Functionalities
- Documentation: Documented Project Functionalities And Setup Instructions For Ease Of Understanding And Replication.
    # # Home Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/home%20page.png" alt="Home Page view" >
 
##  SignIn Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/signIn%20page.png" alt=" SignIn Page view ">
 
  ## SignUP Page view
   <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/SignUp%20page.png" alt="SignUP Page view">

    
   ## forgot password page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/forgot%20password.png" alt="profile Page view">

  ## User profile Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/user%20profile%20page.png" alt="profile view Page view">

  ## Edit Profile page view
  <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/Edit%20profile%20page.png" alt="update page view">
  
  ## change password Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/change%20password%20page.png" alt=" safty Page view">

   ## Delete Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/delete%20account%20page.png" alt=" safty Page view">

   ## Safety Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/saftey%20page.png" alt=" safty Page view">

  ## complaint page view
  <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/register%20complaint%20page.png" alt="complaint page view">
  
  ## complaint history page view
  <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/compalint%20history%20page.png" alt="complaint history page view">

   ## compliant pdf Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/compliant%20pdf%20view.png" alt="compliant pdf Page view">

   ## admin login Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/admin%20login%20page.png" alt="admin login Page view">

   ## admin main Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/admin%20main%20page.png" alt="admin Page view">

   ## user deatil Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/vie%20user%20detailes.png" alt="user deatail Page view">

   ## admin user edit Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/edit%20user%20pop%20modal.png" alt="admin user Page view">

   ## admin compliant histroy Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/complaint%20history%20table.png" alt="admin compliant histroy Page view">

   ## admin compliant status edit Page view
 <img src="https://github.com/ravikumarxworkz/ProjectNuggets/blob/main/WomenSecurityApp/images/edit%20complaint%20status.png" alt="admin user Page view">

## Contact
For any questions or inquiries, feel free to contact me via email  rkkumbar97@gmail.com
