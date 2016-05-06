-- ==============================================================
-- RTL generated by Vivado(TM) HLS - High-Level Synthesis from C, C++ and SystemC
-- Version: 2015.1
-- Copyright (C) 2015 Xilinx Inc. All rights reserved.
-- 
-- ===========================================================

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity tri_intersect is
port (
    ap_clk : IN STD_LOGIC;
    ap_rst_n : IN STD_LOGIC;
    ins_TDATA : IN STD_LOGIC_VECTOR (31 downto 0);
    ins_TVALID : IN STD_LOGIC;
    ins_TREADY : OUT STD_LOGIC;
    ins_TKEEP : IN STD_LOGIC_VECTOR (3 downto 0);
    ins_TSTRB : IN STD_LOGIC_VECTOR (3 downto 0);
    ins_TUSER : IN STD_LOGIC_VECTOR (1 downto 0);
    ins_TLAST : IN STD_LOGIC_VECTOR (0 downto 0);
    ins_TID : IN STD_LOGIC_VECTOR (4 downto 0);
    ins_TDEST : IN STD_LOGIC_VECTOR (5 downto 0);
    outs_TDATA : OUT STD_LOGIC_VECTOR (31 downto 0);
    outs_TVALID : OUT STD_LOGIC;
    outs_TREADY : IN STD_LOGIC;
    outs_TKEEP : OUT STD_LOGIC_VECTOR (3 downto 0);
    outs_TSTRB : OUT STD_LOGIC_VECTOR (3 downto 0);
    outs_TUSER : OUT STD_LOGIC_VECTOR (1 downto 0);
    outs_TLAST : OUT STD_LOGIC_VECTOR (0 downto 0);
    outs_TID : OUT STD_LOGIC_VECTOR (4 downto 0);
    outs_TDEST : OUT STD_LOGIC_VECTOR (5 downto 0) );
end;


architecture behav of tri_intersect is 
    attribute CORE_GENERATION_INFO : STRING;
    attribute CORE_GENERATION_INFO of behav : architecture is
    "tri_intersect,hls_ip_2015_1,{HLS_INPUT_TYPE=cxx,HLS_INPUT_FLOAT=0,HLS_INPUT_FIXED=0,HLS_INPUT_PART=xc7z020clg484-1,HLS_INPUT_CLOCK=5.000000,HLS_INPUT_ARCH=others,HLS_SYN_CLOCK=2.440000,HLS_SYN_LAT=1,HLS_SYN_TPT=none,HLS_SYN_MEM=0,HLS_SYN_DSP=0,HLS_SYN_FF=35,HLS_SYN_LUT=34}";
    constant ap_const_logic_1 : STD_LOGIC := '1';
    constant ap_const_logic_0 : STD_LOGIC := '0';
    constant ap_ST_st1_fsm_0 : STD_LOGIC_VECTOR (1 downto 0) := "01";
    constant ap_ST_st2_fsm_1 : STD_LOGIC_VECTOR (1 downto 0) := "10";
    constant ap_const_lv32_0 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000000";
    constant ap_const_lv1_1 : STD_LOGIC_VECTOR (0 downto 0) := "1";
    constant ap_const_lv32_1 : STD_LOGIC_VECTOR (31 downto 0) := "00000000000000000000000000000001";

    signal ap_rst_n_inv : STD_LOGIC;
    signal ins_data_V_val_reg_132 : STD_LOGIC_VECTOR (31 downto 0);
    signal ap_CS_fsm : STD_LOGIC_VECTOR (1 downto 0) := "01";
    attribute fsm_encoding : string;
    attribute fsm_encoding of ap_CS_fsm : signal is "none";
    signal ap_sig_cseq_ST_st1_fsm_0 : STD_LOGIC;
    signal ap_sig_bdd_37 : BOOLEAN;
    signal ap_sig_cseq_ST_st2_fsm_1 : STD_LOGIC;
    signal ap_sig_bdd_56 : BOOLEAN;
    signal ap_sig_ioackin_outs_TREADY : STD_LOGIC;
    signal ap_reg_ioackin_outs_TREADY : STD_LOGIC := '0';
    signal ap_NS_fsm : STD_LOGIC_VECTOR (1 downto 0);


begin




    -- the current state (ap_CS_fsm) of the state machine. --
    ap_CS_fsm_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_CS_fsm <= ap_ST_st1_fsm_0;
            else
                ap_CS_fsm <= ap_NS_fsm;
            end if;
        end if;
    end process;


    -- ap_reg_ioackin_outs_TREADY assign process. --
    ap_reg_ioackin_outs_TREADY_assign_proc : process(ap_clk)
    begin
        if (ap_clk'event and ap_clk =  '1') then
            if (ap_rst_n_inv = '1') then
                ap_reg_ioackin_outs_TREADY <= ap_const_logic_0;
            else
                if ((((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not(((ins_TVALID = ap_const_logic_0) or (ap_const_logic_0 = ap_sig_ioackin_outs_TREADY)))))) then 
                    ap_reg_ioackin_outs_TREADY <= ap_const_logic_0;
                elsif (((not((ins_TVALID = ap_const_logic_0)) and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (ap_const_logic_1 = outs_TREADY)))) then 
                    ap_reg_ioackin_outs_TREADY <= ap_const_logic_1;
                end if; 
            end if;
        end if;
    end process;


    -- assign process. --
    process (ap_clk)
    begin
        if (ap_clk'event and ap_clk = '1') then
            if (((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ins_TVALID = ap_const_logic_0)))) then
                ins_data_V_val_reg_132 <= ins_TDATA;
            end if;
        end if;
    end process;

    -- the next state (ap_NS_fsm) of the state machine. --
    ap_NS_fsm_assign_proc : process (ins_TVALID, ap_CS_fsm, ap_sig_ioackin_outs_TREADY)
    begin
        case ap_CS_fsm is
            when ap_ST_st1_fsm_0 => 
                if (not((ins_TVALID = ap_const_logic_0))) then
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                else
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                end if;
            when ap_ST_st2_fsm_1 => 
                if (not(((ins_TVALID = ap_const_logic_0) or (ap_const_logic_0 = ap_sig_ioackin_outs_TREADY)))) then
                    ap_NS_fsm <= ap_ST_st1_fsm_0;
                else
                    ap_NS_fsm <= ap_ST_st2_fsm_1;
                end if;
            when others =>  
                ap_NS_fsm <= "XX";
        end case;
    end process;

    -- ap_rst_n_inv assign process. --
    ap_rst_n_inv_assign_proc : process(ap_rst_n)
    begin
                ap_rst_n_inv <= not(ap_rst_n);
    end process;


    -- ap_sig_bdd_37 assign process. --
    ap_sig_bdd_37_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_37 <= (ap_CS_fsm(0 downto 0) = ap_const_lv1_1);
    end process;


    -- ap_sig_bdd_56 assign process. --
    ap_sig_bdd_56_assign_proc : process(ap_CS_fsm)
    begin
                ap_sig_bdd_56 <= (ap_const_lv1_1 = ap_CS_fsm(1 downto 1));
    end process;


    -- ap_sig_cseq_ST_st1_fsm_0 assign process. --
    ap_sig_cseq_ST_st1_fsm_0_assign_proc : process(ap_sig_bdd_37)
    begin
        if (ap_sig_bdd_37) then 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st1_fsm_0 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_cseq_ST_st2_fsm_1 assign process. --
    ap_sig_cseq_ST_st2_fsm_1_assign_proc : process(ap_sig_bdd_56)
    begin
        if (ap_sig_bdd_56) then 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_1;
        else 
            ap_sig_cseq_ST_st2_fsm_1 <= ap_const_logic_0;
        end if; 
    end process;


    -- ap_sig_ioackin_outs_TREADY assign process. --
    ap_sig_ioackin_outs_TREADY_assign_proc : process(outs_TREADY, ap_reg_ioackin_outs_TREADY)
    begin
        if ((ap_const_logic_0 = ap_reg_ioackin_outs_TREADY)) then 
            ap_sig_ioackin_outs_TREADY <= outs_TREADY;
        else 
            ap_sig_ioackin_outs_TREADY <= ap_const_logic_1;
        end if; 
    end process;


    -- ins_TREADY assign process. --
    ins_TREADY_assign_proc : process(ins_TVALID, ap_sig_cseq_ST_st1_fsm_0, ap_sig_cseq_ST_st2_fsm_1, ap_sig_ioackin_outs_TREADY)
    begin
        if ((((ap_const_logic_1 = ap_sig_cseq_ST_st1_fsm_0) and not((ins_TVALID = ap_const_logic_0))) or ((ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and not(((ins_TVALID = ap_const_logic_0) or (ap_const_logic_0 = ap_sig_ioackin_outs_TREADY)))))) then 
            ins_TREADY <= ap_const_logic_1;
        else 
            ins_TREADY <= ap_const_logic_0;
        end if; 
    end process;

    outs_TDATA <= std_logic_vector(unsigned(ins_TDATA) + unsigned(ins_data_V_val_reg_132));
    outs_TDEST <= ins_TDEST;
    outs_TID <= ins_TID;
    outs_TKEEP <= ins_TKEEP;
    outs_TLAST <= ins_TLAST;
    outs_TSTRB <= ins_TSTRB;
    outs_TUSER <= ins_TUSER;

    -- outs_TVALID assign process. --
    outs_TVALID_assign_proc : process(ins_TVALID, ap_sig_cseq_ST_st2_fsm_1, ap_reg_ioackin_outs_TREADY)
    begin
        if (((not((ins_TVALID = ap_const_logic_0)) and (ap_const_logic_1 = ap_sig_cseq_ST_st2_fsm_1) and (ap_const_logic_0 = ap_reg_ioackin_outs_TREADY)))) then 
            outs_TVALID <= ap_const_logic_1;
        else 
            outs_TVALID <= ap_const_logic_0;
        end if; 
    end process;

end behav;