#!/bin/bash
# This script was found at https://gist.github.com/krystofbe/92aed7cd03c9a631eb3c7af490525c4e

set -e

CURRENT_NAME="PhoenixBoilerplate"
CURRENT_OTP="phoenix_boilerplate"

NEW_NAME="YourProjectName"
NEW_OTP="your_project_name"

ack -l $CURRENT_NAME --ignore-file=is:rename_project.sh | xargs sed -i '' -e "s/$CURRENT_NAME/$NEW_NAME/g"
ack -l $CURRENT_OTP --ignore-file=is:rename_project.sh | xargs sed -i '' -e "s/$CURRENT_OTP/$NEW_OTP/g"

mv lib/$CURRENT_OTP lib/$NEW_OTP
mv lib/$CURRENT_OTP.ex lib/$NEW_OTP.ex
mv lib/${CURRENT_OTP}_web lib/${NEW_OTP}_web
mv lib/${CURRENT_OTP}_web.ex lib/${NEW_OTP}_web.ex
mv test/$CURRENT_OTP test/$NEW_OTP
mv test/${CURRENT_OTP}_web test/${NEW_OTP}_web
