local function load(source_id)
    local parts = {}
    parts.text = {{id = "freespace-tx", font = 2, size = 19, overflow = 1, value = function()
            return

--[[フリースペースに文字を入力する場合、下のダブルクオーテーションの間に入力してください]]

"   "
            
--[[----------------------------------------------------------------------------]]

        end},}
    return parts
end

return {
    load = load
}