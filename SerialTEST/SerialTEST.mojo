<?xml version="1.0" encoding="UTF-8"?>
<project name="SerialTEST" board="Mojo V3" language="Lucid">
  <files>
    <src>pwm.luc</src>
    <src top="true">mojo_top.luc</src>
    <src>quadencoder.luc</src>
    <ucf>encoders.ucf</ucf>
    <ucf lib="true">mojo.ucf</ucf>
    <component>reg_interface.luc</component>
    <component>spi_slave.luc</component>
    <component>uart_rx.luc</component>
    <component>cclk_detector.luc</component>
    <component>reset_conditioner.luc</component>
    <component>avr_interface.luc</component>
    <component>uart_tx.luc</component>
    <component>pipeline.luc</component>
    <component>button_conditioner.luc</component>
    <component>counter.luc</component>
    <component>edge_detector.luc</component>
  </files>
</project>
