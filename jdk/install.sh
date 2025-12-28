#!/usr/bin/env bash
set -euo pipefail

echo "WORK IN PROGRESS....."
echo "YOU CAN EXECUTE THIS COMMANDS MANUALLY"

exit

# brew install openjdk@8

# sudo ln -sfn /usr/local/opt/openjdk@8/libexec/openjdk.jdk /Library/Java/JavaVirtualMachines/openjdk-8.jdk  


curl "https://get.sdkman.io" -o sdkman-install.sh

chmod +x sdkman-install.sh

./sdkman-install.sh

#echo '👀 Copy this command and execute manualy in other terminal session:'
#echo 'source "$HOME/.sdkman/bin/sdkman-init.sh"'
#read -rp "👀 When finish press Enter to continue..." not_needed_param

source "$HOME/.sdkman/bin/sdkman-init.sh"

sdk version

#sdk list java

sdk install java 8.0.392-amzn
sdk install java 17.0.9-amzn

sdk default 17.0.9-amzn
