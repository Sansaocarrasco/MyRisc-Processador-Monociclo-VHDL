----------------------------------------------------------------------------------------------
-- Instruction fetch                                                                        --
--							                                                                --
-- myRISC										                                            --
-- Prof. Max Santana  (2023)                                                                --
-- CEComp/Univasf                                                                           --
----------------------------------------------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;

entity fetch is
  port(
    clk        : in std_logic;
    rst        : in std_logic;
    bne		   : in std_logic;
    branch     : in std_logic;                      -- control signal (branch)
    jump       : in std_logic_vector (1 downto 0);                      -- control signal (jump)
    zero       : in std_logic;                      -- control signal (zero)
    RD1		   : in std_logic_vector (31 downto 0);
    jumpAddr   : in std_logic_vector(31 downto 0);  -- Jump Address
    branchAddr : in std_logic_vector(31 downto 0);  -- Branch Address
    PCplus4    : out std_logic_vector(31 downto 0); -- next program counter (PC+4)
    inst       : out std_logic_vector(31 downto 0); -- instruction
    jr         : out std_logic
    
  );
end fetch;

architecture behavior of fetch is
  signal wireBranchAddr, wireInstAddr, WireNextPC, WireJumpAddr, WireOut: std_logic_vector(31 downto 0);
begin

  PC : entity work.rreg32 port map (
    clk => clk, 
    rst => rst, 
    in_reg32  => wireNextPC, 
    out_reg32 => wireInstAddr
  );
  ADDER: entity work.adder32 port map (
    in1_adder32 => wireInstAddr,
    in2_adder32 => x"00000004",
    out_adder32 => PCplus4
  );
  MUXJUMP: entity work.mux332 port map (
    d0 => wireBranchAddr,
    d1 => jumpAddr,
    d2 => RD1,
    sel_mux332   => jump,
    out_mux332  => WireNextPC
  );
  MUXBRANCH: entity work.mux232 port map (
    d0 => PCPlus4,
    d1 => branchAddr,
    in_mux232   => (zero and branch) or (bne and not zero),
    out_mux232  => wireBranchAddr
  );
  
  IMEMORY: entity work.rom port map (
    address => wireInstAddr,
    data    => inst
  );
end behavior;