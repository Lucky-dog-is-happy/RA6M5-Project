/* generated vector source file - do not edit */
        #include "bsp_api.h"
        /* Do not build these data structures if no interrupts are currently allocated because IAR will have build errors. */
        #if VECTOR_DATA_IRQ_COUNT > 0
        BSP_DONT_REMOVE const fsp_vector_t g_vector_table[BSP_ICU_VECTOR_NUM_ENTRIES] BSP_PLACE_IN_SECTION(BSP_SECTION_APPLICATION_VECTORS) =
        {
                        [0] = sci_uart_rxi_isr, /* SCI2 RXI (Receive data full) */
            [1] = sci_uart_txi_isr, /* SCI2 TXI (Transmit data empty) */
            [2] = sci_uart_tei_isr, /* SCI2 TEI (Transmit end) */
            [3] = sci_uart_eri_isr, /* SCI2 ERI (Receive error) */
            [4] = sci_spi_rxi_isr, /* SCI3 RXI (Receive data full) */
            [5] = sci_spi_txi_isr, /* SCI3 TXI (Transmit data empty) */
            [6] = sci_spi_tei_isr, /* SCI3 TEI (Transmit end) */
            [7] = sci_spi_eri_isr, /* SCI3 ERI (Receive error) */
            [8] = sci_i2c_txi_isr, /* SCI4 TXI (Transmit data empty) */
            [9] = sci_i2c_tei_isr, /* SCI4 TEI (Transmit end) */
            [10] = r_icu_isr, /* ICU IRQ6 (External pin interrupt 6) */
            [11] = spi_rxi_isr, /* SPI0 RXI (Receive buffer full) */
            [12] = spi_txi_isr, /* SPI0 TXI (Transmit buffer empty) */
            [13] = spi_tei_isr, /* SPI0 TEI (Transmission complete event) */
            [14] = spi_eri_isr, /* SPI0 ERI (Error) */
            [15] = sci_uart_rxi_isr, /* SCI6 RXI (Receive data full) */
            [16] = sci_uart_txi_isr, /* SCI6 TXI (Transmit data empty) */
            [17] = sci_uart_tei_isr, /* SCI6 TEI (Transmit end) */
            [18] = sci_uart_eri_isr, /* SCI6 ERI (Receive error) */
            [19] = sci_i2c_txi_isr, /* SCI5 TXI (Transmit data empty) */
            [20] = sci_i2c_tei_isr, /* SCI5 TEI (Transmit end) */
            [21] = gpt_counter_overflow_isr, /* GPT0 COUNTER OVERFLOW (Overflow) */
        };
        #if BSP_FEATURE_ICU_HAS_IELSR
        const bsp_interrupt_event_t g_interrupt_event_link_select[BSP_ICU_VECTOR_NUM_ENTRIES] =
        {
            [0] = BSP_PRV_VECT_ENUM(EVENT_SCI2_RXI,GROUP0), /* SCI2 RXI (Receive data full) */
            [1] = BSP_PRV_VECT_ENUM(EVENT_SCI2_TXI,GROUP1), /* SCI2 TXI (Transmit data empty) */
            [2] = BSP_PRV_VECT_ENUM(EVENT_SCI2_TEI,GROUP2), /* SCI2 TEI (Transmit end) */
            [3] = BSP_PRV_VECT_ENUM(EVENT_SCI2_ERI,GROUP3), /* SCI2 ERI (Receive error) */
            [4] = BSP_PRV_VECT_ENUM(EVENT_SCI3_RXI,GROUP4), /* SCI3 RXI (Receive data full) */
            [5] = BSP_PRV_VECT_ENUM(EVENT_SCI3_TXI,GROUP5), /* SCI3 TXI (Transmit data empty) */
            [6] = BSP_PRV_VECT_ENUM(EVENT_SCI3_TEI,GROUP6), /* SCI3 TEI (Transmit end) */
            [7] = BSP_PRV_VECT_ENUM(EVENT_SCI3_ERI,GROUP7), /* SCI3 ERI (Receive error) */
            [8] = BSP_PRV_VECT_ENUM(EVENT_SCI4_TXI,GROUP0), /* SCI4 TXI (Transmit data empty) */
            [9] = BSP_PRV_VECT_ENUM(EVENT_SCI4_TEI,GROUP1), /* SCI4 TEI (Transmit end) */
            [10] = BSP_PRV_VECT_ENUM(EVENT_ICU_IRQ6,GROUP2), /* ICU IRQ6 (External pin interrupt 6) */
            [11] = BSP_PRV_VECT_ENUM(EVENT_SPI0_RXI,GROUP3), /* SPI0 RXI (Receive buffer full) */
            [12] = BSP_PRV_VECT_ENUM(EVENT_SPI0_TXI,GROUP4), /* SPI0 TXI (Transmit buffer empty) */
            [13] = BSP_PRV_VECT_ENUM(EVENT_SPI0_TEI,GROUP5), /* SPI0 TEI (Transmission complete event) */
            [14] = BSP_PRV_VECT_ENUM(EVENT_SPI0_ERI,GROUP6), /* SPI0 ERI (Error) */
            [15] = BSP_PRV_VECT_ENUM(EVENT_SCI6_RXI,GROUP7), /* SCI6 RXI (Receive data full) */
            [16] = BSP_PRV_VECT_ENUM(EVENT_SCI6_TXI,GROUP0), /* SCI6 TXI (Transmit data empty) */
            [17] = BSP_PRV_VECT_ENUM(EVENT_SCI6_TEI,GROUP1), /* SCI6 TEI (Transmit end) */
            [18] = BSP_PRV_VECT_ENUM(EVENT_SCI6_ERI,GROUP2), /* SCI6 ERI (Receive error) */
            [19] = BSP_PRV_VECT_ENUM(EVENT_SCI5_TXI,GROUP3), /* SCI5 TXI (Transmit data empty) */
            [20] = BSP_PRV_VECT_ENUM(EVENT_SCI5_TEI,GROUP4), /* SCI5 TEI (Transmit end) */
            [21] = BSP_PRV_VECT_ENUM(EVENT_GPT0_COUNTER_OVERFLOW,GROUP5), /* GPT0 COUNTER OVERFLOW (Overflow) */
        };
        #endif
        #endif