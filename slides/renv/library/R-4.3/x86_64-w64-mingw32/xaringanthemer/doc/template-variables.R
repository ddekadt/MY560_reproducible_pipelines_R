## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----table, results = "asis", echo=FALSE--------------------------------------
tv <- xaringanthemer:::template_variables
tv$variable <- glue::glue_data(tv, "`{variable}`")
tv[!is.na(tv$css_variable), "css_variable"] <- glue::glue("`{tv$css_variable[!is.na(tv$css_variable)]}`")
tv[is.na(tv$css_variable), "css_variable"] <- ""
tv[is.na(tv$css_property), "css_property"] <- ""
tv$default <- gsub("[{}]", "", tv$default)
tv <- tv[, c(
  "variable", "description", "element", "css_property", "default", "css_variable"
)]
knitr::kable(
  tv,
  col.names = c("Variable", "Description", "Element", "CSS Property", "Default", "CSS Variable")
)

