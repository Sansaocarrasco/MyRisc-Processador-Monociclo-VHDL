----------------------------------------------------------
-- 32 bits adder                                        --
--                                                      --
-- Prof. Max Santana  (2023)                            --
-- CEComp/Univasf                                       --
----------------------------------------------------------

library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std_unsigned.ALL;

entity adder32 is
  port(
    in1_adder32     : in std_logic_vector(31 downto 0);
    in2_adder32     : in std_logic_vector(31 downto 0);
    out_adder32     : out std_logic_vector(31 downto 0)
  );
end adder32;

architecture behavior of adder32 is
begin
  out_adder32 <= in1_adder32 + in2_adder32;
end behavior;