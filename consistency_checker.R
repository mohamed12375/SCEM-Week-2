# Change this to TRUE if you want to force a reinstall of SCEMChecker
# (Useful to get the latest version, as this is still a work in progress)
reinstall_SCEMchecker <- FALSE

# ========== SET CHECKING PARAMETERS ==========

# Path to your submission file (change as needed)
submission_path <- "./W02_Assignment_AnswerTemplate.Rmd"

# Path to the checkfile
template_path <- "./W02_Checkfile.Rmd"


# ========== PACKAGE SETUP ==========
if(!("remotes") %in% rownames(installed.packages())){
  install.packages("remotes", repos = "https://cloud.r-project.org")
}

if(reinstall_SCEMchecker | !("SCEMChecker") %in% rownames(installed.packages())){
  remotes::install_github("fcampelo/SCEMChecker",
                          dependencies = c("Imports"),
                          force = TRUE)
}

library(SCEMChecker)

# ========== RUN CHECKER ==========

# 'mycheck' will contain a data frame with the details of the check
mycheck <- consistency_checker(submission_path = submission_path, 
                               template_path = template_path)

# This prints a summary of any issues encountered
# If there are no issues, it shows a blank list
summary(mycheck)

# print(mycheck) # <--- uncomment this if you want to inspect the raw data frame
