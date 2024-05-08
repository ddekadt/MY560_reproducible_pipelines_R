## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  warning = FALSE,
  comment = "#>",
  fig.width = 6, 
  fig.height = 4
)

## ----setup, include=FALSE-----------------------------------------------------
library(xaringanthemer)
style_mono_accent(
  base_color = "#DC322F",
  inverse_background_color = "#002B36",
  inverse_header_color = "#31b09e",
  inverse_text_color = "#FFFFFF",
  title_slide_background_color = "var(--base)",
  text_font_google = google_font("Kelly Slab"),
  header_font_google = google_font("Oleo Script"),
  outfile = NULL
)

## ----ggplot2-demo-1, out.width = "48%", fig.show="hide"-----------------------
library(ggplot2)

g_base <- ggplot(mpg) + 
  aes(hwy, cty) + 
  geom_point() +
  labs(x = "Highway MPG", y = "City MPG", title = "Fuel Efficiency")

# Basic plot with default theme
g_base

## ----ggplot2-demo-2, fig.show="hide"------------------------------------------
# Fancy slide-matching themed plot
g_base + theme_xaringan()

## ----eval=FALSE---------------------------------------------------------------
#  theme_xaringan_restore_defaults()

## ----ggplot2-demo-inverse, fig.show="hide"------------------------------------
# theme_xaringan() on the left, theme_xaringan_inverse() on the right
g_base + theme_xaringan_inverse()

## ----eval=FALSE---------------------------------------------------------------
#  theme_xaringan(css_file = "my-slide-style.css")

## ----eval=FALSE---------------------------------------------------------------
#  theme_xaringan(
#    text_color = "#3D3E38",
#    background_color = "#FFFFFF",
#    accent_color = "#DC322F",
#    text_font = "Kelly Slab",
#    text_font_use_google = TRUE,
#    title_font = "Oleo Script",
#    title_font_use_google = TRUE
#  )

## ----demo-geom-defaults, fig.width = 10---------------------------------------
g_diamonds <- ggplot(diamonds, aes(x = cut)) +
  geom_bar() +
  labs(x = NULL, y = NULL, title = "Diamond Cut Quality") +
  ylim(0, 25000)

g_diamonds + theme_xaringan()

## ----eval=FALSE---------------------------------------------------------------
#  theme_xaringan_restore_defaults()

## ----scale-xaringan, fig.width = 9, fig.height = 5, out.width="48%", fig.show="hold", echo = TRUE----
ggplot(diamonds, aes(x = cut)) +
  geom_bar(aes(fill = ..count..), show.legend = FALSE) +
  labs(x = NULL, y = "Count", title = "Diamond Cut Quality") +
  theme_xaringan() +
  scale_xaringan_fill_continuous()

ggplot(mpg, aes(x = hwy, y = cty)) +
  geom_count(aes(color = ..n..), show.legend = FALSE) +
  labs(x = "Highway MPG", y = "City MPG", title = "Fuel Efficiency") +
  theme_xaringan_inverse() +
  scale_xaringan_color_continuous(breaks = seq(3, 12, 2), inverse = TRUE, begin = 1, end = 0)

## ----text demo, fig.width = 10------------------------------------------------
g_diamonds_with_text <- 
  g_diamonds + 
  geom_text(aes(y = ..count.., label = format(..count.., big.mark = ",")),
            vjust = -0.30, size = 8, stat = "count") +
  labs(x = "Cut", y = "Count")

g_diamonds_with_text + theme_xaringan()

## ----text-demo-2, fig.width = 10----------------------------------------------
g_diamonds_with_text +
  theme_xaringan(
    text_font = google_font("Ranga"),
    title_font = google_font("Holtwood One SC")
  )

## ----eval=FALSE---------------------------------------------------------------
#  font_url <- file.path(
#    "https://fontlibrary.org/assets/fonts/glacial-indifference/",
#    "5f2cf277506e19ec77729122f27b1faf/0820b3c58fed35de298219f314635982",
#    "GlacialIndifferenceRegular.ttf"
#  )
#  
#  font_temp <- tempfile()
#  download.file(font_url, font_temp)

## ----sysfonts-custom-font, fig.width = 10-------------------------------------
# Path to the local custom font file
font_temp <- system.file(
  "fonts/GlacialIndifferenceRegular.ttf", package = "xaringanthemer"
)

# Register the font with sysfonts/showtext
sysfonts::font_add(family = "GlacialIndifferenceRegular", regular = font_temp)

# Now it's available for use!
g_diamonds_with_text +
  theme_xaringan(
    text_font = "GlacialIndifferenceRegular",
    title_font = "GlacialIndifferenceRegular"
  )

## ----eval=FALSE---------------------------------------------------------------
#  ## On Windows
#  # x11(width = 16 * 2/3, height = 9 * 2/3)
#  
#  ## On MacOS
#  quartz(width = 16 * 2/3, height = 9 * 2/3)
#  ## run plot code to preview in separate window
#  dev.off() # call when done to close the device

