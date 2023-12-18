# This file is part of the standard setup for testthat.
# It is recommended that you do not modify it.
#
# Where should you do additional test configuration?
# Learn more about the roles of various files in:
# * https://r-pkgs.org/testing-design.html#sec-tests-files-overview
# * https://testthat.r-lib.org/articles/special-files.html

library(testthat)
library(doestyle)

test_dir <- fs::dir_create("test-reports/")
message(fs::path_abs(test_dir))

reporter <- MultiReporter$new(list(
  CheckReporter$new(),
  JunitReporter$new(file = fs::path(fs::path_abs(test_dir), "tests.xml"))
))

test_check("doestyle", reporter = reporter)
