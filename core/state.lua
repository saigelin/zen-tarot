local enumState = {
    IDLE = 0,
    RESULT = 1
}
local State = {
    current = enumState.IDLE
}

function State:isIdle()
    if self.current == enumState.IDLE then
        return true
    else
        return false
    end
end

function State:toResult()
    self.current = enumState.RESULT
end

return State
