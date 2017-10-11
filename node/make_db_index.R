library("devtools")
install_github("rethomics/behavr")
install_github("rethomics/scopr")

RESULT_DIR <- "/ethoscope_results"
INDEX <- "index.txt"

scopr::make_index_file(RESULT_DIR, INDEX)

