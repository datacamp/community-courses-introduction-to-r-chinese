# This little script converts \u____ encodings to &#____; encodings
file <- "chapter5.Rmd"

library(stringr)
file_string <- paste(readLines(file), collapse = "\n")
unicodes <- unique(str_extract_all(file_string, "\\\\u[0-9a-fA-F]{4}"))[[1]]
translations <- paste0("&#", strtoi(gsub("\\\\u", "", unicodes) , base = 16L), ";")
names(translations) <- paste0("\\", unicodes)
write(str_replace_all(file_string, translations), file = file)
