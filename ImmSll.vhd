----------------------------------------------------------------------------------------------
-- ImmSll                                                                                   --
--														                                    --
-- myRISC												                                    --
-- Prof. Max Santana  (2023)                                                                --
-- CEComp/Univasf                                                                           --
----------------------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
use IEEE.numeric_std.all;

entity ImmSll is
	port(
    	imm: in std_logic_vector(31 downto 0);
        branch_addr: out std_logic_vector(31 downto 0);
    );
end entity;

architecture behavior of ImmSll is
	signal temporary: std_logic_vector(31 downto 0);
	begin
    	branch_addr(1 downto 0) <= "00";
		branch_addr(31 downto 2) <= imm(29 downto 0);
end behavior;