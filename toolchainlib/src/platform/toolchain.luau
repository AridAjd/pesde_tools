local types = require("../utils/result_option_conv")
local Option = types.Option
type Option<T> = types.Option<T>

local TOOLCHAINS: { Toolchain } = { "msvc", "gnu", "musl" }
export type Toolchain = "msvc" | "gnu" | "musl"

return {
	detect = function(str: string): Option<Toolchain>
		for _, toolchain: Toolchain in TOOLCHAINS do
			if string.find(str, toolchain) then
				-- FIXME: remove any usage
				return Option.Some(toolchain :: any) :: Option<Toolchain>
			end
		end

		return Option.None :: Option<Toolchain>
	end,
}
