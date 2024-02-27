<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8" />
    <meta
      name="viewport"
      content="width=device-width, initial-scale=1, shrink-to-fit=no"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/css/bootstrap.min.css"
      integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm"
      crossorigin="anonymous"
    />
    <link
      rel="stylesheet"
      href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css"
    />
    <link
      href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css"
      rel="stylesheet"
    />
    <link
      href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css"
      rel="stylesheet"
      integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN"
      crossorigin="anonymous"
    />
    <title>Voters' Services Portal</title>
    <link rel="shortcut icon" href="voter.svg" type="image/x-icon" />
  </head>
    <style>
     html, body {
  height: 100%;
  margin: 0;
}

.yoyo {
  min-height: 100%;
  display: flex;
  justify-content: center;
  text-align: center;
  flex-direction: column;
  background-image: url(india.gif);
  background-repeat: no-repeat;
  background-size: cover;
}
marquee{
  color: red;
  font-size: xx-large;
  font-weight: bolder;
}
main {
  flex: 1; /* This will make the main content area expand to fill the remaining space */
}

.footer {
  flex-shrink: 0;
}
    .nav-link:hover {
    background-color:white;
    border-radius: 10px;
    }
</style>
  <body>
    <header class="fixed-top">
      <nav class="navbar navbar-expand-lg bg-primary fixed-top">
        <a class="navbar-brand" href="#">
          <img
            src="voter.svg"
            alt="Logo"
            width="30"
            height="24"
            class="d-inline-block align-text-top"
          />
          VOTERS’ SERVICE PORTAL
        </a>
        <button
          class="navbar-toggler"
          type="button"
          data-toggle="collapse"
          data-target="#navbarSupportedContent"
          aria-controls="navbarSupportedContent"
          aria-expanded="false"
          aria-label="Toggle navigation"
        >
          <span class="navbar-toggler-icon"></span>
        </button>
        <div
          class="collapse navbar-collapse justify-content-end"
          id="navbarSupportedContent"
        >
          <ul class="navbar-nav">
            <li class="nav-item active">
              <a class="nav-link" href="index.jsp"
                >Home<span class="sr-only">(current)</span></a
              >
            </li>
            <li class="nav-item">
              <a class="nav-link" href="voteridapplication.jsp">Apply voterID</a>
            </li>
            <li class="nav-item">
              <div id="google_translate_element"></div>
              <script type="text/javascript">
                function googleTranslateElementInit() {
                  new google.translate.TranslateElement(
                    { pageLanguage: "en" },
                    "google_translate_element"
                  );
                }
              </script>
              <script
                type="text/javascript"
                src="//translate.google.com/translate_a/element.js?cb=googleTranslateElementInit"
              ></script>
            </li>
          </ul>
        </div>
      </nav>
    </header>
    <br /><br /><br /><br />
     <main class="yoyo">
      <marquee behavior="scroll" direction="left">INDIAN GOVT VOTERS’ SERVICE PORTAL</marquee>
    </main>
    <!-- Footer -->
    <footer class="bg-light text-center">
      <div class="container">
        <div class="row">
          <div class="col-md-5">
            <h4>Contact Us</h4>
            <p>Phone: 1950 (Toll-free)</p>
            <p>
              Address: Election Commission Of India, Nirvachan Sadan, Ashoka
              Road, New Delhi 110001
            </p>
            <p>
              Email:
              <a href="mailto:complaints@eci.gov.in">complaints@eci.gov.in</a>
            </p>
          </div>
          <div class="col-md-7">
            <h4>About ECI</h4>
            <p>
              The Election Commission of India is an autonomous constitutional
              authority responsible for administering Union and State election
              processes in India. The body administers elections to the Lok
              Sabha, Rajya Sabha, State Legislative Assemblies, and offices of
              President and Vice President in the country.
            </p>
          </div>
          <div class="row d-flex justify-content-center">
            <div class="col-md-4">
              <h4>Find us on</h4>

              <a
                class="btn btn-primary btn-floating m-1"
                style="background-color: #3b5998"
                href="#!"
                role="button"
                ><i class="fab fa-facebook-f"></i
              ></a>

              <!-- Twitter -->
              <a
                class="btn btn-primary btn-floating m-1"
                style="background-color: #55acee"
                href="#!"
                role="button"
                ><i class="fab fa-twitter"></i
              ></a>

              <!-- Google -->
              <a
                class="btn btn-primary btn-floating m-1"
                style="background-color: #dd4b39"
                href="#!"
                role="button"
                ><i class="fab fa-google"></i
              ></a>

              <!-- Instagram -->
              <a
                class="btn btn-primary btn-floating m-1"
                style="background-color: #ac2bac"
                href="#!"
                role="button"
                ><i class="fab fa-instagram"></i
              ></a>

              <!-- Linkedin -->
              <a
                class="btn btn-primary btn-floating m-1"
                style="background-color: #0082ca"
                href="#!"
                role="button"
                ><i class="fab fa-linkedin-in"></i
              ></a>
              <!-- Github -->
              <a
                class="btn btn-primary btn-floating m-1"
                style="background-color: #d40f0f"
                href="#!"
                role="button"
                ><i class="fab fa-youtube"></i
              ></a>
            </div>
            <p><a href="#">Privacy Policy</a></p>
          </div>
        </div>
      </div>
      <hr />
      <p>&copy; 2023 Election Commission of India. All Rights Reserved.</p>
    </footer>

    <script
      src="https://code.jquery.com/jquery-3.2.1.slim.min.js"
      integrity="sha384-KJ3o2DKtIkvYIK3UENzmM7KCkRr/rE9/Qpg6aAZGJwFDMVNA/GpGFF93hXpG5KkN"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/popper.js@1.12.9/dist/umd/popper.min.js"
      integrity="sha384-ApNbgh9B+Y1QKtv3Rn7W3mgPxhU9K/ScQsAP7hUibX39j7fakFPskvXusvfa0b4Q"
      crossorigin="anonymous"
    ></script>
    <script
      src="https://cdn.jsdelivr.net/npm/bootstrap@4.0.0/dist/js/bootstrap.min.js"
      integrity="sha384-JZR6Spejh4U02d8jOt6vLEHfe/JQGiRRSQQxSfFWpi1MquVdAyjUar5+76PVCmYl"
      crossorigin="anonymous"
    ></script>
  </body>
</html>
    