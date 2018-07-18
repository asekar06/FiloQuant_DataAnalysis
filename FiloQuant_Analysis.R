##FOR SRGAP2A
##set the working directory for the desired group of files for analysis
setwd("C:/Users/admin/Desktop/Filopodia Cell Images/SRGAP2/SRGAP2A/SRGAP2A_FiloQuantResults")
##call a certain type of file, in this case anything ending with .csv, 
##and populate it into a list called "filenames"
filenames <- list.files(pattern="*.csv", full.names=TRUE) 
##Create a "vector"? named filopodiaCounts and have this hold the number of rows counted
##in each .csv file
##skip = 2 is because the first two rows in each file is 1.header 2.the entire edge of the cell. 
##After the first 2 rows, the rows correspont to filopodia counts
SRGAP2AfilopodiaCounts <- sapply(filenames, function(f) nrow(read.csv(f, header = F, skip = 2)))
##make a dataframe out of all these counts
data.frame(SRGAP2AfilopodiaCounts)
##write dataframe into a new .csv file and direct the .csv file to a new directory where we will collect
##the other paralog filopodia counts also
write.csv(SRGAP2AfilopodiaCounts, file="C:/Users/admin/Desktop/Filopodia Cell Images/SRGAP2/SRGAP2_FilopodiaCounts/SRGAP2Afilopodiacounts.csv")


##FOR SRGAP2C
##set the working directory for the desired group of filed for analysis
setwd("C:/Users/admin/Desktop/Filopodia Cell Images/SRGAP2/SRGAP2C/SRGAP2C_FiloQuantResults")
##call a certain type of file, in this case anything ending with .csv, 
##and populate it into a list called "filenames"
filenames <- list.files(pattern="*.csv", full.names=TRUE) 
##Create a "variable"? named filopodiaCounts and have this hold the number of rows counted
##in each .csv file
##skip = 2 is because the first two rows in each file is 1. header 2. the entire edge of 
##the cell. After the first 2 rows, it is actual filopodia
SRGAP2CfilopodiaCounts <- sapply(filenames, function(f) nrow(read.csv(f, header = F, skip = 2)))
##make a dataframe out of all these counts
data.frame(SRGAP2CfilopodiaCounts)
##write dataframe into a new .csv file
write.csv(SRGAP2CfilopodiaCounts, file="C:/Users/admin/Desktop/Filopodia Cell Images/SRGAP2/SRGAP2_FilopodiaCounts/SRGAP2Cfilopodiacounts.csv")


##FOR SRGAP2AC
##set the working directory for the desired group of filed for analysis
setwd("C:/Users/admin/Desktop/Filopodia Cell Images/SRGAP2/SRGAP2A+C/SRGAP2AC_FiloQuantResults")
##call a certain type of file, in this case anything ending with .csv, 
##and populate it into a list called "filenames"
filenames <- list.files(pattern="*.csv", full.names=TRUE) 
##Create a "variable"? named filopodiaCounts and have this hold the number of rows counted
##in each .csv file
##skip = 2 is because the first two rows in each file is 1. header 2. the entire edge of 
##the cell. After the first 2 rows, it is actual filopodia
SRGAP2ACfilopodiaCounts <- sapply(filenames, function(f) nrow(read.csv(f, header = F, skip = 2)))
##make a dataframe out of all these counts
data.frame(SRGAP2ACfilopodiaCounts)
##write dataframe into a new .csv file
write.csv(SRGAP2ACfilopodiaCounts, file="C:/Users/admin/Desktop/Filopodia Cell Images/SRGAP2/SRGAP2_FilopodiaCounts/SRGAP2ACfilopodiacounts.csv")

getwd()

##FOR GFP
##set the working directory for the desired group of filed for analysis
setwd("C:/Users/admin/Desktop/Filopodia Cell Images/SRGAP2/GFP/GFP_FiloQuantResults")
##call a certain type of file, in this case anything ending with .csv, 
##and populate it into a list called "filenames"
filenames <- list.files(pattern="*.csv", full.names=TRUE) 
##Create a "variable"? named filopodiaCounts and have this hold the number of rows counted
##in each .csv file
##skip = 2 is because the first two rows in each file is 1. header 2. the entire edge of 
##the cell. After the first 2 rows, it is actual filopodia
GFPfilopodiaCounts <- sapply(filenames, function(f) nrow(read.csv(f, header = F, skip = 2)))
##make a dataframe out of all these counts
data.frame(GFPfilopodiaCounts)
##write dataframe into a new .csv file
write.csv(GFPfilopodiaCounts, file="C:/Users/admin/Desktop/Filopodia Cell Images/SRGAP2/SRGAP2_FilopodiaCounts/GFPfilopodiacounts.csv")

##making a boxplot with filopodia count data
##install.packages("ggplot2")
library("ggplot2")

setwd("C:/Users/admin/Desktop/Filopodia Cell Images/SRGAP2/SRGAP2_FilopodiaCounts")
SRGAP2A <- data.frame(group = "SRGAP2A", value = c(SRGAP2AfilopodiaCounts))
SRGAP2C <- data.frame(group = "SRGAP2C", value = c(SRGAP2CfilopodiaCounts))
SRGAP2AC <- data.frame(group = "SRGAP2AC", value = c(SRGAP2ACfilopodiaCounts))
GFP <- data.frame(group = "GFP", value = c(GFPfilopodiaCounts))
names(SRGAP2A) == names(SRGAP2C)
names(SRGAP2A) == names(SRGAP2AC)
names(SRGAP2A) == names(GFP)
tester_matrix <- rbind(SRGAP2A, SRGAP2C, SRGAP2AC, GFP)
tester_matrix
filopodia_plot <- ggplot(tester_matrix, aes(x = group, y = value, fill = group)) + geom_violin() + labs (title = "Expression of SRGAP2 in COS7 Cells", x = "Samples", y = "Filopodia Count", fill = "Samples")
filopodia_plot

