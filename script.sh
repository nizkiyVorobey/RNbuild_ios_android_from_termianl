#!/bin/bash/

# # error "Message"
# function error() {
#   osascript <<EOT
#     tell app "System Events"
#       display dialog "$1" buttons {"OK"} default button 1 with icon caution with title "$(basename $0)"
#       return  -- Suppress result
#     end tell
# EOT
# }

# error "Not enough cheese!"


# # prompt "Question" "Default value"
# function prompt() {
#   osascript <<EOT
#     tell app "System Events"
#      display dialog "$1" buttons {"OK","Cancel"} default button 1 with title "$(basename $0)"
#      return  -- Suppress result
#     end tell
# EOT
# }

# value="$(prompt 'Enter:' '42')"
# echo "${value}"





# # prompt "Question" "Default value"
# function prompt() {
#   osascript <<EOT
#     tell app "System Events"
#      display dialog "$1" buttons {"OK","Cancel"} default button 1 with icon caution with title "$(basename $0)"
#     end tell
# EOT
# }



# # prompt "Question" "Default value"
# function prompt() {
#   osascript <<EOT
#     tell app "System Events"
#      button returned of (display dialog "Are you sure!?"  buttons {"No", "Yes"})
#     end tell
# EOT
# }


# echo $OSTYPE

$platform
$confirmResult

if [[ "$OSTYPE" == "linux-gnu"* ]]; then
  platform="linux"
elif [[ "$OSTYPE" == "darwin"* ]]; then
  platform="mac"
elif [[ "$OSTYPE" == "cygwin" ]]; then
  platform="win"
  # POSIX compatibility layer and Linux environment emulation for Windows
elif [[ "$OSTYPE" == "msys" ]]; then
  platform="win"
  # Lightweight shell and GNU utilities compiled for Windows (part of MinGW)
elif [[ "$OSTYPE" == "win32" ]]; then
  platform="unknown"
elif [[ "$OSTYPE" == "freebsd"* ]]; then
  platform="unknown"
else
  platform="unknown"
fi

# echo $platform

function linuxPrompt() {
  zenity --question --text="Do you wish to continue/?"
}

function macPrompt() {
  osascript <<EOT
    tell app "System Events"
     button returned of (display dialog "Are you sure!?"  buttons {"No", "Yes"})
    end tell
EOT
}

if [ "$platform" == "linux" ]; then
  value="$(linuxPrompt)"
  if [ $? -eq 0 ]; then
    confirmResult="Yes"
  else
    confirmResult="No"
  fi
elif [ "$platform" == "mac" ]; then
  confirmResult="$(linuxPrompt)"
else 
  echo Other plaforms
fi


echo $confirmResult





if [ $confirmResult == "Yes" ]
then
  echo "result is YES"
elif [ $confirmResult == "No" ]
then 
  echo "result is NO"
else
  echo "result in undefined"
fi