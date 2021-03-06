context("ox_units")

# getting the file address
file <- system.file("extdata", "odm1.3_full_example.xml",
                    package = "ox",
                    mustWork = TRUE)
# Parsing the xml file
doc <- XML::xmlParse(file)

# incorrect call
test_that("gives error when arg is not of expected class", {
  expect_error(ox_units(file))
})

# correct call
res <- ox_units(doc)

test_that("returns dataframe", {
  expect_is(res, "data.frame")
})

# clean
rm(doc, file, res)

