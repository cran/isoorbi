# orbi_start_aggregator() [plain]

    Code
      orbi_start_aggregator("test")
    Message
      -------------------------------- Aggregator test -------------------------------

---

    Code
      orbi_add_to_aggregator(orbi_add_to_aggregator(orbi_add_to_aggregator(
        orbi_add_to_aggregator(orbi_add_to_aggregator(orbi_start_aggregator("test"),
        "data", "col"), "data", "num", cast = "as.integer"), "data", "new", source = c(
          "def", "alt def"), default = 4), "data", "w\\1_\\2", "(\\d+)-(.*)", regexp = TRUE),
      "data", "from_fun", cast = "as.integer", source = list(c("a", "b"), "x"), func = "mean")
    Message
      -------------------------------- Aggregator test -------------------------------
      Dataset data:
       > col = as.character(col)
       > num = as.integer(num)
       > new = as.character(one_of(def, `alt def`)) - if source is missing: new =
      as.character(4)
       > w(\\d+)_(.*) = as.character(all_matches("(\\d+)-(.*)"))
       > from_fun = as.integer(mean(one_of(a, b), x))

# orbi_start_aggregator() [fancy]

    Code
      orbi_start_aggregator("test")
    Message
      ──────────────────────────────── [1mAggregator [3mtest[23m[22m ───────────────────────────────

---

    Code
      orbi_add_to_aggregator(orbi_add_to_aggregator(orbi_add_to_aggregator(
        orbi_add_to_aggregator(orbi_add_to_aggregator(orbi_start_aggregator("test"),
        "data", "col"), "data", "num", cast = "as.integer"), "data", "new", source = c(
          "def", "alt def"), default = 4), "data", "w\\1_\\2", "(\\d+)-(.*)", regexp = TRUE),
      "data", "from_fun", cast = "as.integer", source = list(c("a", "b"), "x"), func = "mean")
    Message
      ──────────────────────────────── [1mAggregator [3mtest[23m[22m ───────────────────────────────
      [1mDataset[22m [34mdata[39m:
       → [32mcol[39m = [3mas.character(col)[23m
       → [32mnum[39m = [3mas.integer(num)[23m
       → [32mnew[39m = [3mas.character(one_of(def, `alt def`))[23m - [33mif source is missing[39m: [32mnew[39m =
      [3mas.character(4)[23m
       → [35mw(\\d+)_(.*)[39m = [3mas.character(all_matches("(\\d+)-(.*)"))[23m
       → [32mfrom_fun[39m = [3mas.integer(mean(one_of(a, b), x))[23m

# get_data() [plain]

    Code
      out <- test_run1()
    Message
      v test_run1() retrieved 10 records from the combination of a (2), b (10), and
      data (10) via id and x

---

    Code
      out <- test_run2()
    Message
      v test_run2() retrieved 162 records from the combination of a (50) and b (50)
      via speed

# get_data() [fancy]

    Code
      out <- test_run1()
    Message
      [32m✔[39m [1mtest_run1()[22m retrieved 10 records from the combination of [34ma[39m (2), [34mb[39m (10), and
      [34mdata[39m (10) via [32mid[39m and [32mx[39m

---

    Code
      out <- test_run2()
    Message
      [32m✔[39m [1mtest_run2()[22m retrieved 162 records from the combination of [34ma[39m (50) and [34mb[39m (50)
      via [32mspeed[39m

---

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["id", "info", "x", "z"]
        },
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["tbl_df", "tbl", "data.frame"]
        }
      },
      "value": [
        {
          "type": "character",
          "attributes": {},
          "value": ["a", "a", "a", "a", "a", "a", "a", "a", "a", "a"]
        },
        {
          "type": "character",
          "attributes": {},
          "value": ["a info", "a info", "a info", "a info", "a info", "a info", "a info", "a info", "a info", "a info"]
        },
        {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [10, 20, 30, 40, 50, 60, 70, 80, 90, 100]
        }
      ]
    }

---

    {
      "type": "list",
      "attributes": {
        "names": {
          "type": "character",
          "attributes": {},
          "value": ["speed", "dist.x", "dist.y"]
        },
        "class": {
          "type": "character",
          "attributes": {},
          "value": ["data.frame"]
        },
        "row.names": {
          "type": "integer",
          "attributes": {},
          "value": [1, 2, 3, 4, 5, 6, 7, 8, 9, 10, 11, 12, 13, 14, 15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30, 31, 32, 33, 34, 35, 36, 37, 38, 39, 40, 41, 42, 43, 44, 45, 46, 47, 48, 49, 50, 51, 52, 53, 54, 55, 56, 57, 58, 59, 60, 61, 62, 63, 64, 65, 66, 67, 68, 69, 70, 71, 72, 73, 74, 75, 76, 77, 78, 79, 80, 81, 82, 83, 84, 85, 86, 87, 88, 89, 90, 91, 92, 93, 94, 95, 96, 97, 98, 99, 100, 101, 102, 103, 104, 105, 106, 107, 108, 109, 110, 111, 112, 113, 114, 115, 116, 117, 118, 119, 120, 121, 122, 123, 124, 125, 126, 127, 128, 129, 130, 131, 132, 133, 134, 135, 136, 137, 138, 139, 140, 141, 142, 143, 144, 145, 146, 147, 148, 149, 150, 151, 152, 153, 154, 155, 156, 157, 158, 159, 160, 161, 162]
        }
      },
      "value": [
        {
          "type": "double",
          "attributes": {},
          "value": [4, 4, 4, 4, 7, 7, 7, 7, 8, 9, 10, 10, 10, 10, 10, 10, 10, 10, 10, 11, 11, 11, 11, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 12, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 13, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 14, 15, 15, 15, 15, 15, 15, 15, 15, 15, 16, 16, 16, 16, 17, 17, 17, 17, 17, 17, 17, 17, 17, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 18, 19, 19, 19, 19, 19, 19, 19, 19, 19, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 20, 22, 23, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 24, 25]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2, 2, 10, 10, 4, 4, 22, 22, 16, 10, 18, 18, 18, 26, 26, 26, 34, 34, 34, 17, 17, 28, 28, 14, 14, 14, 14, 20, 20, 20, 20, 24, 24, 24, 24, 28, 28, 28, 28, 26, 26, 26, 26, 34, 34, 34, 34, 34, 34, 34, 34, 46, 46, 46, 46, 26, 26, 26, 26, 36, 36, 36, 36, 60, 60, 60, 60, 80, 80, 80, 80, 20, 20, 20, 26, 26, 26, 54, 54, 54, 32, 32, 40, 40, 32, 32, 32, 40, 40, 40, 50, 50, 50, 42, 42, 42, 42, 56, 56, 56, 56, 76, 76, 76, 76, 84, 84, 84, 84, 36, 36, 36, 46, 46, 46, 68, 68, 68, 32, 32, 32, 32, 32, 48, 48, 48, 48, 48, 52, 52, 52, 52, 52, 56, 56, 56, 56, 56, 64, 64, 64, 64, 64, 66, 54, 70, 70, 70, 70, 92, 92, 92, 92, 93, 93, 93, 93, 120, 120, 120, 120, 85]
        },
        {
          "type": "double",
          "attributes": {},
          "value": [2, 10, 2, 10, 4, 22, 4, 22, 16, 10, 18, 26, 34, 18, 26, 34, 18, 26, 34, 17, 28, 17, 28, 14, 20, 24, 28, 14, 20, 24, 28, 14, 20, 24, 28, 14, 20, 24, 28, 26, 34, 34, 46, 26, 34, 34, 46, 26, 34, 34, 46, 26, 34, 34, 46, 26, 36, 60, 80, 26, 36, 60, 80, 26, 36, 60, 80, 26, 36, 60, 80, 20, 26, 54, 20, 26, 54, 20, 26, 54, 32, 40, 32, 40, 32, 40, 50, 32, 40, 50, 32, 40, 50, 42, 56, 76, 84, 42, 56, 76, 84, 42, 56, 76, 84, 42, 56, 76, 84, 36, 46, 68, 36, 46, 68, 36, 46, 68, 32, 48, 52, 56, 64, 32, 48, 52, 56, 64, 32, 48, 52, 56, 64, 32, 48, 52, 56, 64, 32, 48, 52, 56, 64, 66, 54, 70, 92, 93, 120, 70, 92, 93, 120, 70, 92, 93, 120, 70, 92, 93, 120, 85]
        }
      ]
    }

