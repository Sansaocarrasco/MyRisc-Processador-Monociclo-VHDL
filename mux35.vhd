------------------------------------------------------------------------------------- --------
-- MUX 35                                                                                   --
--														                                    --
-- myRISC												                                    --
-- João Pedro												                                --
-- Prof. Max Santana  (2023)                                                                --
-- CEComp/Univasf                                                                           --
----------------------------------------------------------------------------------------------

library ieee ;
use ieee.std_logic_1164.all;

entity mux35 is
  port(	
    d0, d1, d2 	   : in std_logic_vector(4 downto 0);
    sel_mux35      : in std_logic_vector(1 downto 0);
    out_mux35	   : out std_logic_vector(4 downto 0)
  );
end mux35;

architecture behavior of mux35 is
begin
  out_mux35 <= 	d0 when sel_mux35 = "00" else
  				d1 when sel_mux35 = "01" else
           	 	d2 when sel_mux35 = "10";
end behavior;