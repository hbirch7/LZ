/*LZ ODOCS Database*/
/* Table 1: Board_Identification */
create table Board_Identification(
    board_id smallint not NULL,
    FPGA_Num SMALLINT,
    channel_Num SMALLINT,
    CONSTRAINT pk_board PRIMARY KEY (board_id)
);

/* Table 2: lnNPHvsTrigW_func_parameters */
CREATE TABLE lnNPHvsTrigW(
    board_id SMALLINT not NULL,
    p0 FLOAT(9,6),
    p1 FLOAT(9,6),
    p2 FLOAT(9,6),
    p3 FLOAT(9,6),
    CONSTRAINT pk_TrigWfunc PRIMARY KEY (board_id),
    CONSTRAINT fk_TrigWfunc FOREIGN KEY (board_id)
        REFERENCES Board_Identification (board_id)
);

/* Table 3: WidthsetvsTrigW_step_func_parameters */
CREATE TABLE WidthsetvsTrigW(
    board_id SMALLINT not NULL,
    W5p0 FLOAT(9,6),
    W5p1 FLOAT(9,6), 
    W6p0 FLOAT(9,6), 
    W6p1 FLOAT(9,6), 
    W7p0 FLOAT(9,6), 
    W7p1 FLOAT(9,6), 
    W8p0 FLOAT(9,6), 
    W8p1 FLOAT(9,6), 
    W9p0 FLOAT(9,6), 
    W9p1 FLOAT(9,6), 
    W10p0 FLOAT(9,6), 
    W10p1 FLOAT(9,6), 
    W11p0 FLOAT(9,6), 
    W11p1 FLOAT(9,6), 
    W12p0 FLOAT(9,6), 
    W12p1  FLOAT(9,6)
    CONSTRAINT pk_WidthSetfunc PRIMARY KEY (board_id),
    CONSTRAINT fk_WidthSetfunc FOREIGN KEY (board_id)
        REFERENCES Board_Identification (board_id)
);

/* Table 4: TrigWvslnNph_func_parameters */
CREATE TABLE TrigWvslnNph(
    board_id SMALLINT NOT NULL,
    p0 FLOAT(9,6),
    p1 FLOAT(9,6),
    p2 FLOAT(9,6),
    p3  FLOAT(9,6)
    CONSTRAINT pk_lnNphfunc PRIMARY KEY(board_id),
    CONSTRAINT fk_lnNphfunc FOREIGN KEY (board_id)
        REFERENCES Board_Identification (board_id)
);

LOAD DATA LOCAL 
INFILE '/tmp/foo.txt' 
INTO TABLE Board_Identification COLUMNS TERMINATED BY '\t';


LOAD DATA LOCAL