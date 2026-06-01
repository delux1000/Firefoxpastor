FROM lscr.io/linuxserver/firefox:latest

# Copy a custom userChrome.css to hide the three-dot menu
RUN mkdir -p /config/.mozilla/firefox/*.default-release/chrome
COPY userChrome.css /config/.mozilla/firefox/*.default-release/chrome/

# Enable custom stylesheets via user.js
RUN echo 'user_pref("toolkit.legacyUserProfileCustomizations.stylesheets", true);' > /config/.mozilla/firefox/*.default-release/user.js

# (Optional) Start in kiosk mode – add environment variable
ENV FIREFOX_ARGS="--kiosk"

# Keep the original entrypoint 
