RESULT_DIR <- "/ethoscope_results"
INDEX <- "index.txt"

all_db_files <- list.files(RESULT_DIR,recursive=T, pattern="*\\.db$")
fields <- strsplit(all_db_files,"/")
valid_files <- sapply(fields,length) == 4
all_db_files <- all_db_files[valid_files]
write(all_db_files, paste(RESULT_DIR, INDEX,sep="/")
