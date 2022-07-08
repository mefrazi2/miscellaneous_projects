# resources : https://www.youtube.com/watch?v=z0UGmMOxl-c

library(gt)
library(tidyverse)

# all candidates 

data <- read.csv("all_candidates.csv")

data %>%
  gt(rowname_col = "ï..percent") %>%
  cols_label(
    Black.Belt.Counties = "Black Belt Counties",
    Northeast.Counties = "Northeast Counties",
    Total.AL.Votes.share = "Total AL Votes Share"
  ) %>%
  cols_align(c("center")) %>%
  cols_width(
    ï..percent ~ px(250),
    Black.Belt.Counties ~ px(120),
    Northeast.Counties ~ px(120),
    Total.AL.Votes.share ~ px(120)
  ) %>%
  fmt_percent(
    columns = Northeast.Counties,
    decimals = 2)  %>%
  fmt_percent(
    columns = Black.Belt.Counties,
    decimals = 2) %>%
 fmt_integer(columns = Total.AL.Votes.share) %>%
  tab_footnote(
    footnote = "Counties include Bullock, Choctaw, Dallas, Greene, Hale, Lowndes, Macon, Marego, Pickens, Sumter, Perry, and Wilcox",
    locations = cells_column_labels(columns = Black.Belt.Counties
  )) %>%
  tab_footnote(
    footnote = "Counties include Calgoun, Clay, Cherokee, Cleburne, Dekalb, Etowah, Jackson, Madison, Marshall, Randolph, Saint Clair, Talladega",
    locations = cells_column_labels(columns = Northeast.Counties
    )) %>%
  tab_options(
    footnotes.font.size = px(10)
  ) %>%
  tab_style(
        locations = cells_column_labels(columns = everything()),
        style = list(cell_text(weight = "bold"))
  )  %>%
  tab_style(
    locations = cells_stub(rows = everything()),
    style = list(
    cell_text(weight = "bold")
  )
) %>%
  gtsave(
    filename = "table_1_all_candidates.png",
    expand = 8,
    path = "filepath"
    )


# black and bankhead only
data1 <- read.csv("black_bankhead_only.csv")

data1 %>%
  gt(rowname_col = "ï..percent") %>%
  cols_label(
    Black.Belt.Counties = "Black Belt Counties",
    Northeast.Counties = "Northeast Counties",
    Total.AL.Votes.share = "Total AL Votes Share"
  ) %>%
  cols_align(c("center")) %>%
  cols_width(
    ï..percent ~ px(250),
    Black.Belt.Counties ~ px(120),
    Northeast.Counties ~ px(120),
    Total.AL.Votes.share ~ px(120)
  ) %>%
  fmt_percent(
    columns = Northeast.Counties,
    decimals = 2)  %>%
  fmt_percent(
    columns = Black.Belt.Counties,
    decimals = 2) %>%
  fmt_integer(columns = Total.AL.Votes.share) %>%
  tab_footnote(
    footnote = "Counties include Bullock, Choctaw, Dallas, Greene, Hale, Lowndes, Macon, Marego, Pickens, Sumter, Perry, and Wilcox",
    locations = cells_column_labels(columns = Black.Belt.Counties
    )) %>%
  tab_footnote(
    footnote = "Counties include Calgoun, Clay, Cherokee, Cleburne, Dekalb, Etowah, Jackson, Madison, Marshall, Randolph, Saint Clair, Talladega",
    locations = cells_column_labels(columns = Northeast.Counties
    )) %>%
  tab_options(
    footnotes.font.size = px(10)
  ) %>%
  tab_style(
    locations = cells_column_labels(columns = everything()),
    style = list(cell_text(weight = "bold"))
  )  %>%
  tab_style(
    locations = cells_stub(rows = everything()),
    style = list(
      cell_text(weight = "bold")
    )
   ) %>%
   gtsave(
     filename = "table_2_black_bankhead_only.png",
     expand = 8,
     path = "filepath"
   )
