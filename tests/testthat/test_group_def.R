context("Group definitions")

# getting the file address
file <- system.file("extdata", "odm1.3_full_example.xml",
                    package = "ox",
                    mustWork = TRUE)
# Parsing the xml file
doc <- XML::xmlParse(file)

# incorrect call
test_that("gives error when arg is not of expected class", {
  expect_error(ox_group_def(file))
})

# correct call
res <- ox_group_def(doc)

test_that("returns dataframe with expected variables, at least 1 row", {
  expect_is(res, "data.frame")
  # vars
  expect_true("group_oid" %in% names(res))
  expect_true("group_name" %in% names(res))
  expect_true("group_repeating" %in% names(res))
  expect_true("sas_dataset_name" %in% names(res))
  # rows
  expect_true(nrow(res) >= 1)
})

test_that("dataframe has no factors", {
  expect_false("factor" %in% unique(sapply(res, class)))
})


# clean
rm(doc, file, res)

