![](../../workflows/gds/badge.svg) ![](../../workflows/docs/badge.svg) ![](../../workflows/test/badge.svg)

Demo project for KV Integrated Circuit Design, WS 2023. (c) Harald Pretl, IIC@JKU.

## Description

A simple 4b binary counter is realized in Verilog. On asserting reset, it is set to 0, and on a positive clock edge it is counting up.

The counter valid is output using `uo_out[3:0]`.

