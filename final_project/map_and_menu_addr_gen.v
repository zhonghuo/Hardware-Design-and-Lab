module map_and_menu_addr_gen(
    input [9:0] h, v,
    input [2:0] select, map, 
    input [16:0] map1_addr, map2_addr, map3_addr, map4_addr, map5_addr,
    output wire [16:0] map_and_menu_addr
);
    /*assign map_and_menu_addr = (!select && map == 1) ? (
        (h >= 150 && h < 170 && v >= 40 && v < 65) ? (
            (h-150)+(v-39)*320
        ) : (
            (h >= 150 && h < 170 && v >= 80 && v < 105) ? (
                (h-150)+(v-79)*320
            ) : (
                (h >= 150 && h < 170 && v >= 120 && v < 145) ? (
                    (h-150)+(v-119)*320
                ) : (
                    (h >= 150 && h < 170 && v >= 160 && v < 185) ? (
                        (h-150)+(v-159)*320
                    ) : (
                        (h >= 148 && h < 170 && v >= 200 && v < 225) ? (
                            (h-127)+(v-199)*320
                        ) : (
                            0
                        )
                    )
                )
            )
        )
    ) : (
        (!select && map == 2) ? (
            (h >= 150 && h < 170 && v >= 40 && v < 65) ? (
                (h-150)+(v-39)*320
            ) : (
                (h >= 150 && h < 170 && v >= 80 && v < 105) ? (
                    (h-150)+(v-79)*320
                ) : (
                    (h >= 150 && h < 170 && v >= 120 && v < 145) ? (
                        (h-150)+(v-119)*320
                    ) : (
                        (h >= 148 && h < 170 && v >= 160 && v < 185) ? (
                            (h-127)+(v-159)*320
                        ) : (
                            (h >= 150 && h < 170 && v >= 200 && v < 225) ? (
                                (h-150)+(v-199)*320
                            ) : (
                                0
                            )
                        )
                    )
                )
            )
        )  : (
            (!select && map == 3) ? (
                (h >= 150 && h < 170 && v >= 40 && v < 65) ? (
                    (h-150)+(v-39)*320
                ) : (
                    (h >= 150 && h < 170 && v >= 80 && v < 105) ? (
                        (h-150)+(v-79)*320
                    ) : (
                        (h >= 148 && h < 170 && v >= 120 && v < 145) ? (
                            (h-127)+(v-119)*320
                        ) : (
                            (h >= 150 && h < 170 && v >= 160 && v < 185) ? (
                                (h-150)+(v-159)*320
                            ) : (
                                (h >= 150 && h < 170 && v >= 200 && v < 225) ? (
                                    (h-150)+(v-199)*320
                                ) : (
                                    0
                                )
                            )
                        )
                    )
                )
            ) : (
                (!select && map == 4) ? (
                    (h >= 150 && h < 170 && v >= 40 && v < 65) ? (
                        (h-150)+(v-39)*320
                    ) : (
                        (h >= 148 && h < 170 && v >= 80 && v < 105) ? (
                            (h-127)+(v-79)*320
                        ) : (
                            (h >= 150 && h < 170 && v >= 120 && v < 145) ? (
                                (h-150)+(v-119)*320
                            ) : (
                                (h >= 150 && h < 170 && v >= 160 && v < 185) ? (
                                    (h-150)+(v-159)*320
                                ) : (
                                    (h >= 150 && h < 170 && v >= 200 && v < 225) ? (
                                        (h-150)+(v-199)*320
                                    ) : (
                                        0
                                    )
                                )
                            )
                        )
                    )
                ) : (
                    (!select && map == 5) ? (
                        (h >= 148 && h < 170 && v >= 40 && v < 65) ? (
                            (h-127)+(v-39)*320
                        ) : (
                            (h >= 150 && h < 170 && v >= 80 && v < 105) ? (
                                (h-150)+(v-79)*320
                            ) : (
                                (h >= 150 && h < 170 && v >= 120 && v < 145) ? (
                                    (h-150)+(v-119)*320
                                ) : (
                                    (h >= 150 && h < 170 && v >= 160 && v < 185) ? (
                                        (h-150)+(v-159)*320
                                    ) : (
                                        (h >= 150 && h < 170 && v >= 200 && v < 225) ? (
                                            (h-150)+(v-199)*320
                                        ) : (
                                            0
                                        )
                                    )
                                )
                            )
                        )
                    ) : (
                        (select && map == 1) ? (
                            map1_addr
                        ) : (select && map == 2) ?(
                            map2_addr
                        ) : (select && map == 3) ?(
                            map3_addr
                        ) : (select && map == 4) ?(
                            map4_addr
                        ) : (select && map == 5) ?(
                            map5_addr
                        ) :(
                            0
                        )
                    )
                )
            )
        )
    );*/

    assign map_and_menu_addr = (!select && map == 1) ? (
        (h >= 150 && h < 170 && v >= 40 && v < 65) ? (
            (h-150)+(v-39)*320
        ) : (
                (h >= 150 && h < 170 && v >= 120 && v < 145) ? (
                    (h-150)+(v-119)*320
                ) : (
                        (h >= 148 && h < 170 && v >= 200 && v < 225) ? (
                            (h-127)+(v-199)*320
                        ) : (
                            0
                        )
                )
            
        )
    ) : (
        (!select && map == 2) ? (
            (h >= 150 && h < 170 && v >= 40 && v < 65) ? (
                (h-150)+(v-39)*320
            ) : (
                    (h >= 148 && h < 170 && v >= 120 && v < 145) ? (
                        (h-127)+(v-119)*320
                    ) : (
                            (h >= 150 && h < 170 && v >= 200 && v < 225) ? (
                                (h-150)+(v-199)*320
                            ) : (
                                0
                            )
                    )
            )
        )  : (
            (!select && map == 3) ? (
                (h >= 148 && h < 170 && v >= 40 && v < 65) ? (
                    (h-127)+(v-39)*320
                ) : (
                    (h >= 150 && h < 170 && v >= 120 && v < 145) ? (
                        (h-150)+(v-119)*320
                    ) : (
                        (h >= 150 && h < 170 && v >= 200 && v < 225) ? (
                            (h-150)+(v-199)*320
                        ) : (
                            0
                        )
                    )
                )
            ) : (
                        (select && map == 1) ? (
                            map1_addr
                        ) : (select && map == 2) ?(
                            map2_addr
                        ) : (select && map == 3) ?(
                            map3_addr
                        ) : 0
            )

        )
    );
endmodule