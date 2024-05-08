# groundhog package checker: this takes in a list of needed packages and the date on which the packages should be tethered. it checks for the packages, installs as needed, and loads appropriately.

groundhog_package_check <- function(need, groundhog.date = Sys.Date()-7){
  need <- c(need, "groundhog") # make sure that groundhog is installed too
  have <- need %in% rownames(installed.packages()) # checks packages you have
  if(any(!have)) install.packages(need[!have]) # install missing packages
  invisible(lapply(need, groundhog::groundhog.library, date = groundhog.date)) # load needed packages
}

# file_grabber function: download data from a specific url

file_grabber <- function(file_name_dl, file_path, file_name_final = NULL, url, compressed = TRUE) {
  # check if the file has already been downloaded -- do not re-download if so
  if (!file.exists(paste0(file_path, file_name_dl))) {
    download.file(url, paste0(file_path, file_name_dl), mode = "wb")
    print("File downloaded.")
  } else {
    print("File already downloaded.")
  }
  
  # if file is compressed and not already unzipped, perform unzipping, otherwise do nothing
  if (compressed && !file.exists(paste0(file_path, '/shapefiles/', file_name_final))) {
    unzip(paste0(file_path, file_name_dl), exdir = paste0(file_path, "shapefiles"))
    print("File unzipped.")
  } else {
    print("File already unzipped or no need for unzipping.")
  }
}