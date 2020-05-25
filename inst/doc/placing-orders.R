## ---- include = FALSE---------------------------------------------------------
knitr::opts_chunk$set(
  collapse = TRUE,
  comment = "#>"
)

## ----setup--------------------------------------------------------------------
library(bitmexr)

## ----eval=FALSE---------------------------------------------------------------
#  tn_place_order(symbol = "XBTUSD",
#                 orderQty = 10,
#                 price = 5000)

## ----eval=FALSE---------------------------------------------------------------
#  tn_place_order(symbol = "XBTUSD",
#                 orderQty = 10)

## ----eval=FALSE---------------------------------------------------------------
#  tn_place_order(symbol = "XBTUSD",
#                 orderQty = -10,
#                 price = 10000)

## ----eval=FALSE---------------------------------------------------------------
#  tn_place_order(symbol = "XBTUSD",
#                 orderQty = 100,
#                 price = 5000,
#                 clOrdID = "mybigorder")

## ----eval=FALSE---------------------------------------------------------------
#  tn_edit_order(origClOrdID = "mybigorder",
#                price = 4000)

## ----eval=FALSE---------------------------------------------------------------
#  tn_cancel_order(clOrdID = "mybigorder")

## ----eval=FALSE---------------------------------------------------------------
#  tn_cancel_all_orders(filter = '{"side": "Sell"')

## ----eval=FALSE---------------------------------------------------------------
#  tn_get_bitmex(path = "/user", use_auth = TRUE)

## ----eval=FALSE---------------------------------------------------------------
#  tn_post_bitmex(path = "/position/leverage",
#                 args = list("symbol" = "XBTUSD",
#                             "leverage" = 10))

