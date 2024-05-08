## ----setup, include = FALSE---------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  results = "asis",
  echo = FALSE,
  comment = "#>",
  out.width = "100%"
)
library(xaringanthemer)

## ----include=FALSE------------------------------------------------------------
IN_PKGDOWN <- identical(Sys.getenv("IN_PKGDOWN"), "true")

## ----xaringanthemer-ggplot-setup, include=FALSE, eval=!IN_PKGDOWN-------------
style_mono_accent(
  base_color = "#1c5253",
  header_font_google = google_font("Josefin Sans"),
  text_font_google   = google_font("Montserrat", "300", "300i"),
  code_font_google   = google_font("Fira Mono"),
  outfile = NULL
)

## ----theme_xaringan_demo, echo=TRUE, warning=FALSE, fig.width=13, fig.height=5.5, eval=!IN_PKGDOWN, fig.showtext=TRUE----
library(ggplot2)
ggplot(diamonds) +
  aes(cut, fill = cut) +
  geom_bar(show.legend = FALSE) +
  labs(
    x = "Cut",
    y = "Count",
    title = "A Fancy diamonds Plot"
  ) +
  theme_xaringan(background_color = "#FFFFFF") +
  scale_xaringan_fill_discrete()

## ----link-to-plot-image, echo=FALSE, eval=IN_PKGDOWN, results='asis'----------
#  cat("![](../reference/figures/index-theme_xaringan_demo-1.png)")

## ----include=FALSE------------------------------------------------------------
IS_README <- exists("IS_README") && IS_README
include_graphic <- function(img_path) {
  glue::glue(
    '<img src="https://raw.githubusercontent.com/gadenbuie/', 
    'xaringanthemer/assets/{img_path}" data-external="1" />'
  )
}

## ----style_mono_light---------------------------------------------------------
demo_function_call <- function(f, n_params = 1) {
  cat(sep = "",
    "```r\n",
    paste(substitute(f)), "(",
    if (n_params > 0) paste(collapse = ", ",
      sapply(1:n_params, function(i) {
        paste0(names(formals(f))[i], ' = "', formals(f)[[i]], '"')})),
    ")\n```"
    )
}
demo_function_call(style_mono_light, 1)

## ----style_mono_dark----------------------------------------------------------
demo_function_call(style_mono_dark, 1)

## ----style_mono_accent--------------------------------------------------------
demo_function_call(style_mono_accent, 1)

## ----style_mono_accent_inverse------------------------------------------------
demo_function_call(style_mono_accent_inverse, 1)

## ----style_duo----------------------------------------------------------------
demo_function_call(style_duo, 2)

## ----style_duo_accent---------------------------------------------------------
demo_function_call(style_duo_accent, 2)

## ----style_duo_accent_inverse-------------------------------------------------
demo_function_call(style_duo_accent_inverse, 2)

## ----style_solarized_light----------------------------------------------------
demo_function_call(style_solarized_light, 0)

## ----style_solarized_dark-----------------------------------------------------
demo_function_call(style_solarized_dark, 0)

## ---- results='asis', echo=FALSE----------------------------------------------
tvv <- xaringanthemer:::template_variables$variable
cat(paste0("- `", tvv[grepl("^text_", tvv)][1:5], "`"), sep = "\n")
cat("- *and more ...*")

## ----results='asis', echo=FALSE-----------------------------------------------
cat(paste0("- `", tvv[grepl("^title_slide_", tvv)], "`"), sep = "\n")

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  style_xaringan(
#    text_font_family = "Droid Serif",
#    text_font_url = "https://fonts.googleapis.com/css?family=Droid+Serif:400,700,400italic",
#    header_font_google = google_font("Yanone Kaffeesatz")
#  )

## ----results='asis', echo=FALSE-----------------------------------------------
cat(paste0("`", tvv[grepl("_font_google$", tvv)], "`", collapse = ", "))

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  style_mono_light(
#    header_font_google = google_font("Josefin Slab", "600"),
#    text_font_google   = google_font("Work Sans", "300", "300i"),
#    code_font_google   = google_font("IBM Plex Mono")
#  )

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  style_solarized_dark(
#    code_font_family = "Fira Code",
#    code_font_url = "https://cdn.jsdelivr.net/gh/tonsky/FiraCode@2/distr/fira_code.css"
#  )

## ----eval=FALSE, echo=TRUE----------------------------------------------------
#  style_mono_light(
#    extra_fonts = list(
#      google_font("Sofia"),
#      # Young Serif by uplaod.fr
#      "https://cdn.jsdelivr.net/gh/uplaod/YoungSerif/fonts/webfonts/fontface.css",
#    ),
#    extra_css = list(
#      ".title-slide h2" = list("font-family" = "Sofia"),
#      blockquote = list("font-family" = "youngserifregular")
#    )
#  )

## ----results='asis', echo=FALSE-----------------------------------------------
extra_css <- list(
  ".small" = list("font-size" = "90%"),
  ".full-width" = list(
    display = "flex",
    width   = "100%",
    flex    = "1 1 auto"
  )
)
cat(
  "\n```css",
  "/* Extra CSS */",
  xaringanthemer:::list2css(extra_css),
  "```",
  sep = "\n"
)

