
# Set your folder path where all 12 Parquet files are located
data_path <- "C:\\Users\\attafuro\\Desktop\\datanyc_taxi_2024/"   

output_file <- paste0(data_path, "taxi_data_2024.csv")

# List all 2024 Parquet files
parquet_files <- list.files(data_path, pattern = "2024.*\\.parquet$", full.names = TRUE)

# Read the first file to write with headers
cat("Processing first file...\n")
first_data <- read_parquet(parquet_files[1])
write.csv(first_data, output_file, row.names = FALSE)
file.remove(parquet_files[1])  # Delete the first file
rm(first_data)
gc()

#Loop through remaining files
for (file in parquet_files[-1]) {
  cat("Processing and deleting:", file, "\n")
  df <- read_parquet(file)
  write.table(df, output_file, sep = ",", row.names = FALSE, col.names = FALSE, append = TRUE)
  file.remove(file)  # Delete after reading
  rm(df)
  gc()
}

cat("\n All files merged. Final CSV saved at:", output_file, "\n")
