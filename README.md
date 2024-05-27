# Ideapad-adjustable-conservation-mode
A small script that you can use to limit the charging on some ideapad laptops to anything between 60 and 100.
Most lenovo ideapads can only limit charge to 60%. This script allows you to set the desired percentage, it then checks every 30 seconds if that percentage has been reached. If so it re-enables conservation mode.

# Requirements
Linux, on windows you have lenovo vantage, but it does not allow you to select a specfic percentage.
A Lenovo Ideapad, this only works on ideapad that have the conversation mode option to limit charge to 60%.
2 aliases for cons_on and cons_off that make it much easier to enable and disable conservation mode from the terminal.

# Aliases
Go to your .bashrc file and add the following lines:
`alias cons_on='sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode <<<1; echo "conservation mode on"'`
`alias cons_off='sudo tee /sys/bus/platform/drivers/ideapad_acpi/VPC2004:00/conservation_mode <<<0; echo "conservation mode off"'`
These aliases are shortcuts for disabeling conservation mode.

# Script
Download the script and run it as follows to limit the charging percentage to 75%:
First disable conservation mode: `sudo cons_off` then,
`sudo ./cons_on_per.sh 75` to start the script.
You will have to keep the terminal open for it to work.





