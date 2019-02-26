--============================================================================
-- 
--  VHDL implementation of the 74LS298 quad 2-to-1 multiplexer with storage
--  Copyright (C) 2018, 2019 Ace
--
--  Permission is hereby granted, free of charge, to any person obtaining a
--  copy of this software and associated documentation files (the "Software"),
--  to deal in the Software without restriction, including without limitation
--	 the rights to use, copy, modify, merge, publish, distribute, sublicense,
--	 and/or sell copies of the Software, and to permit persons to whom the 
--	 Software is furnished to do so, subject to the following conditions:
--
--  The above copyright notice and this permission notice shall be included in
--	 all copies or substantial portions of the Software.
--
--  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
--	 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
--	 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
--	 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
--	 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
--	 FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
--	 DEALINGS IN THE SOFTWARE.
--
--============================================================================

--Chip pinout:
/*       _____________
       _|             |_
i1(1) |_|1          16|_| VCC
       _|             |_                     
i1(0) |_|2          15|_| q(0)
       _|             |_
i0(0) |_|3          14|_| q(1)
       _|             |_
i0(1) |_|4          13|_| q(2)
       _|             |_
i1(2) |_|5          12|_| q(3)
       _|             |_
i1(3) |_|6          11|_| clk
       _|             |_
i0(3) |_|7          10|_| s
       _|             |_
GND   |_|8           9|_| i0(2)
        |_____________|
*/

library IEEE;
use IEEE.std_logic_1164.all;

entity ls298 is
port
(
	i0		: in std_logic_vector(3 downto 0);
	i1		: in std_logic_vector(3 downto 0);
	clk	: in std_logic;
	s		: in std_logic;
	q		: out std_logic_vector(3 downto 0)
);
end ls298;

architecture arch of ls298 is
begin
	process(clk) begin
		if(clk'event and clk = '0') then
			if(s = '0') then
				q <= i0;
			else
				q <= i1;
			end if;
		end if;
	end process;
end arch;