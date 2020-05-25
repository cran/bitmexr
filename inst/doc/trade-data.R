## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)
library(httptest)
start_vignette("trade-data")

## ----setup, message=FALSE-----------------------------------------------------
library(bitmexr)
library(dplyr)
library(ggplot2)
library(tidyquant)

## ----message=FALSE------------------------------------------------------------
# Get 1000 most recent trades on the exchange
trade_data <- trades(
  symbol = "XBTUSD",
  reverse = "true",
  count = 1000
)

## ----message=FALSE------------------------------------------------------------
# Daily OHLC data from 2017-01-01 to 2020-01-01

bucket_data <- bucket_trades(
  binSize = "1d",
  startTime = "2018-01-01",
  endTime = "2020-05-01",
  symbol = "XBTUSD"
)

## ----message=FALSE------------------------------------------------------------
# 1-minute buckets from 2020-01-01 until 2020-01-03

bucket_data <- bucket_trades(
  binSize = "1m",
  startTime = "2020-01-01",
  endTime = "2020-01-03",
  symbol = "XBTUSD"
)

max(as.Date(bucket_data$timestamp))

## ----message=FALSE------------------------------------------------------------

bucket_data_long <- map_bucket_trades(
  binSize = "1m",
  start_date = "2020-01-01",
  end_date = "2020-01-03",
  symbol = "XBTUSD",
  verbose = FALSE
)

max(as.Date(bucket_data_long$timestamp))

## ----message=FALSE------------------------------------------------------------
map_trades(
  symbol = "XBTUSD",
  start_date = "2019-05-03 12:00:00",
  end_date = "2019-05-03 12:05:00",
  verbose = TRUE
) %>%
  select(1:5) %>%
  head()

## ----message=FALSE------------------------------------------------------------
paste(available_symbols(), collapse = ", ")

## ----message=FALSE------------------------------------------------------------
valid_dates("ETHUSD")

## ----fig.width=7, fig.height=5, fig.retina=2----------------------------------

bucket_data_long %>%
  filter(timestamp > "2020-01-01" & timestamp < "2020-01-03") %>%
  mutate(timestamp = as_datetime(timestamp)) %>%
  ggplot(aes(x = timestamp, y = close)) +
  geom_candlestick(aes(open = open, high = high, low = low, close = close)) +
  geom_ma(ma_fun = SMA, n = 200) +
  scale_x_datetime(date_breaks = "12 hour", date_labels = "%H:%M") +
  theme_tq()

## ---- include=FALSE-----------------------------------------------------------
end_vignette()

